import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Color(0XFFEFF3F6)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name = '';
  String contact = '';
  String age = '';
  String gender = '';
  String surgeon = '';
  String diagnosis = '';
  String procedure = '';
  String comorbities = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          //physics: ClampingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 40.0, top: 20),
                child: Text("Welcome"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Text(
                  "Please fill the form",
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              CustomInputField(
                hint: 'Patient Name',
                onChanged: (val) {
                  name = val;
                },
              ),
              CustomInputField(
                hint: 'Phone No. #',
                onChanged: (val) {
                  contact = val;
                },
              ),
              CustomInputField(
                hint: 'Age',
                onChanged: (val) {
                  age = val;
                },
              ),
              CustomInputField(
                hint: 'Gender',
                onChanged: (val) {
                  gender = val;
                },
              ),
              CustomInputField(
                hint: 'Surgeon',
                onChanged: (val) {
                  surgeon = val;
                },
              ),
              CustomInputField(
                hint: 'Diagnosis',
                onChanged: (val) {
                  diagnosis = val;
                },
              ),
              CustomInputField(
                hint: 'Procedure',
                onChanged: (val) {
                  procedure = val;
                },
              ),
              CustomInputField(
                hint: 'Comorbities',
                onChanged: (val) {
                  comorbities = val;
                },
              ),
              SizedBox(
                height: 30.0,
              ),

              CustomButton(
                hint: 'Submit',
                onTap: () async {
                  final data = {
                    "patient": {
                      "name": name,
                      "contact": contact,
                      "age": age,
                      "sex": gender,
                    },
                    "surgeon": surgeon,
                    "diagnosis": diagnosis,
                    "procedure": procedure,
                    "comorbities": comorbities,
                  };

                  final response = await Dio().post('http://127.0.0.1:3000/generateDocs', data: data);

                  print(response);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomInputField extends StatelessWidget {
  final String hint;

  const CustomInputField({
    Key? key,
    required this.hint,
    this.onChanged,
  }) : super(key: key);

  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0XFFEFF3F6),
            borderRadius: BorderRadius.circular(100.0),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  offset: Offset(6, 2),
                  blurRadius: 6.0,
                  spreadRadius: 3.0),
              BoxShadow(
                  color: Color.fromRGBO(255, 255, 255, 0.9),
                  offset: Offset(-6, -2),
                  blurRadius: 6.0,
                  spreadRadius: 3.0)
            ]),
        child: Padding(
          padding: const EdgeInsets.only(left: 22.0),
          child: TextField(
            decoration:
                InputDecoration(border: InputBorder.none, hintText: hint),
                onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String hint;

  const CustomButton({
    Key? key,
    required this.hint,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(100.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.blueGrey,
                    offset: Offset(6, 2),
                    blurRadius: 6.0,
                    spreadRadius: 3.0),
                BoxShadow(
                    color: Color.fromRGBO(255, 255, 255, 0.9),
                    offset: Offset(-6, -2),
                    blurRadius: 6.0,
                    spreadRadius: 3.0)
              ]),
          child: Padding(
            padding: const EdgeInsets.only(left: 22.0),
            child: Container(
              height: 50,
              width: double.infinity,
              child: Center(
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white70, fontSize: 24),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
