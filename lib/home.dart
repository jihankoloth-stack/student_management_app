import 'package:flutter/material.dart';
import 'package:student_management/addpage.dart';
import 'package:student_management/detail.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomeState();
}

class _HomeState extends State<Homepage> {
  
  late Box studentsBox;

  @override
  void initState() {
    super.initState();
    studentsBox = Hive.box("students");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(onPressed: () {},
                     icon: Icon(Icons.home)),
                  ),
                ],
              ),
              Text(
                "Student management",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: studentsBox.listenable(),
                  builder: (context, box, child) {
                    final students = box.values.toList();

                    if (students.isEmpty) {
                      return Center(child: Text("No students add yet"));
                    }

                    return ListView.builder(
                      itemCount: students.length,
                      itemBuilder: (context, index) {
                        final student = students[index];

                        return Card(
                          margin: EdgeInsets.all(10),
                          elevation: 3,

                          child: ListTile(
                            leading: CircleAvatar(child: Icon(Icons.person)),
                            title: Text(student["name"]),
                            // subtitle: Text(
                            //   "Age: ${student["age"]} | Class: ${student["class"]}",
                            // ),
                            trailing: Icon(Icons.arrow_forward_ios,
                            size: 17,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Detail(student: student),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              FloatingActionButton(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Addpage()),
                  );
                },
                child: Icon(Icons.add),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
