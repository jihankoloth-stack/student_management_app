import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Addpage extends StatefulWidget {
  final dynamic student;
  final dynamic studentkey;

  const Addpage({super.key, this.student, this.studentkey});

  @override
  State<Addpage> createState() => _AddpageState();
}

class _AddpageState extends State<Addpage> {
  @override
  void initState() {
    super.initState();
    if (widget.student != null) {
      namecontroller.text = widget.student!["name"];
      agecontroller.text = widget.student!["age"].toString();
      classcontroller.text = widget.student!["class"].toString();
      addresscontroller.text = widget.student!["address"]?.toString() ?? "";
    }
  }

  final namecontroller = TextEditingController();
  final agecontroller = TextEditingController();
  final classcontroller = TextEditingController();
  final addresscontroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    namecontroller.dispose();
    agecontroller.dispose();
    classcontroller.dispose();
    addresscontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(radius: 60, backgroundColor: Colors.blue),
                  SizedBox(height: 10),
                  Text(
                    "Add image",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          controller: namecontroller,
                          decoration: InputDecoration(
                            hintText: "Enter your name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Age",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          controller: agecontroller,
                          decoration: InputDecoration(
                            hintText: "Enter your age",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Class",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          controller: classcontroller,
                          decoration: InputDecoration(
                            hintText: "Enter your class",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Address",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          controller: addresscontroller,
                          maxLines: 3,
                          decoration: InputDecoration(
                            hintText: "Enter your address",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),

                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                Map<String, dynamic> student = {
                                  "name": namecontroller.text,
                                  "age": int.tryParse(agecontroller.text) ?? 0,
                                  "class":
                                      int.tryParse(classcontroller.text) ?? 0,
                                  "address": addresscontroller.text,
                                };

                                final box = Hive.box("students");

                                if (widget.studentkey != null) {

                                  await box.put(widget.studentkey, student);
                                } else {

                                  await box.add(student);
                                  
                                }


                                if (mounted) {

                                  Navigator.pop(context);

                                }
                              },

                              style: ElevatedButton.styleFrom(
                                elevation: 3,
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                widget.student == null
                                    ? "add student"
                                    : "update student",
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                    
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
