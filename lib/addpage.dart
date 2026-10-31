import 'package:flutter/material.dart';

class Addpage extends StatefulWidget {
  const new({super.key});

  @override
  State<Addpage> createState() => _AddpageState();
}

class _AddpageState extends State<Addpage> {
  final namecontroller=TextEditingController();
  final agecontroller=TextEditingController();
  final classcontroller=TextEditingController();
  final addresscontroller=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(padding:EdgeInsets.all(20),
          child:Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
             children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blue,
              ),
              SizedBox(height: 10,),
              Text("Add image",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              ),
              SizedBox(height: 20,),
              Padding(padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name",
                  style: TextStyle(
                    fontWeight:FontWeight.bold,
                  ),
                  ),
                  TextField(
                    controller: namecontroller,
                   decoration: InputDecoration(
                    hintText: "Enter your name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                   ),   
        
                  ),
                  SizedBox(height: 10,),
                  Text("Age",
                  style: TextStyle(
                    fontWeight:FontWeight.bold,
                  ),
                  ),
                  TextField(
                    controller: agecontroller,
                   decoration: InputDecoration(
                    hintText: "Enter your age",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                   ),   
        
                  ),
                  SizedBox(height: 10,),
                  Text("Class",
                  style: TextStyle(
                    fontWeight:FontWeight.bold,
                  ),
                  ),
                  TextField(
                    controller: classcontroller,
                   decoration: InputDecoration(
                    hintText: "Enter your class",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                   ),   
        
                  ),
                  SizedBox(height: 10,),
                  Text("Address",
                  style: TextStyle(
                    fontWeight:FontWeight.bold,
                  ),
                  ),
                  TextField(
                    controller: addresscontroller,
                    maxLines: 3,
                   decoration: InputDecoration(
                    hintText: "Enter your address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                   ),   
        
                  ),

                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     ElevatedButton(onPressed: (){
                      Map<String,dynamic> student ={
                        "name":namecontroller.text,
                        "age":int.tryParse(agecontroller.text)??0,
                        "class":int.tryParse(classcontroller.text)??0,
                        "address":addresscontroller.text,
                      };
                      Navigator.pop(context,
                      student
                      );
                     },
                     
                     style:ElevatedButton.styleFrom(
                      elevation: 3,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                     )  ,
                     child: Text("Add Student") 
                     ),
                    ]
                    
                  )
                ],
              ),
              )
             ],
            ),
          ),
          ),
        ),
      ),
    );
  }
}