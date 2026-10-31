import 'package:flutter/material.dart';
import 'package:student_management/addpage.dart';
import 'package:student_management/detail.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomeState();
}

class _HomeState extends State<Homepage> {
  List<Map<String, dynamic>> students = [
    {"name": "Jihan", "age": 19, "class": 12},
    {"name": "Ashmil", "age": 17, "class": 12},
    {"name": "Riswan", "age": 17, "class": 12},
    {"name": "Jinu", "age": 19, "class": 12},
  ];

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
                  child: IconButton(onPressed: (){}, icon:Icon(Icons.home)),
                 )
                ],
              ),
              Text(
                "Student management",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    final student = students[index];
                        
                    return Card(
                      margin: EdgeInsets.all(10),
                      elevation: 3,
                        
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        title: Text(student["name"]),
                        subtitle: Text(
                          "Age: ${student["age"]} | Class: ${student["class"]}",
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: (){
                          Navigator.push(context,
                           MaterialPageRoute(builder: (context) => Detail(),),
                           );
                        },
                        
                      ),
                    );
                  },
                ),
                
              ),
              FloatingActionButton(onPressed: ()async{
                final newstudent=await Navigator.push (context,
                 MaterialPageRoute(builder: (context) => Addpage(),),
                 );
                 if (newstudent !=null){
                  setState(() {
                    students.add(newstudent);
                  });
                 }
              },
              child: Icon(Icons.add),
              ),
              SizedBox(height: 20,),
              
            ],
          ),
        ),
      ),
    );
  }
}
