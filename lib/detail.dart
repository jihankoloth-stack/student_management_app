import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:student_management/addpage.dart';
import 'package:student_management/home.dart';

class Detail extends StatefulWidget {
  dynamic studentkey;
  dynamic student;
  Detail({super.key, required this.student, required this.studentkey});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late Map<String,dynamic>student;
 
 @override
 void initState() {
    super.initState();
    student=widget.student;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Student Details",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Homepage()),
            );
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      child: Icon(Icons.person, size: 50),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "${widget.student["name"]}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Card(
                child: ListTile(
                  leading: Icon(Icons.cake_outlined),
                  title: Text("Age"),
                  subtitle: Text("${widget.student["age"]}"),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.school),
                  title: Text("Class"),
                  subtitle: Text("${widget.student["class"]}"),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text("Address"),
                  subtitle: Text("${widget.student["address"]}"),
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()async{
                await Navigator.push(context,
                 MaterialPageRoute(
                  builder: (context)=>Addpage(
                    student: student,
                    studentkey: widget.studentkey,
                  )
                  ),
                  );
                  final box=Hive.box("student");
                  if(!mounted)return;
                  final updateStudent =box.get(widget.studentkey);

                  if(updateStudent !=null){
                    setState(() {
                     student= updateStudent;
                    });
                  }
              },
               child: Text("edit"),
               ),
            ],
          ),
        ),
      ),
    );
  }
}
