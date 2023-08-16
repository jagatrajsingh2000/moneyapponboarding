// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final formKey = GlobalKey<FormState>();

  DateTime? _selectedDate;
    XFile? image;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color.fromRGBO(255, 255, 255, 1),
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color.fromRGBO(249, 250, 250, 1),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/Backarrow.png',
                width: 20,
                height: 18,
              ),
              MyProfile(image: image, onImageTap: () => getImage(ImageSource.gallery)),
              const SizedBox(
                height: 5,
              ),
              Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        color: Color.fromRGBO(255, 255, 255, 1),
                        child: TextFieldInput(
                          label: 'Legal First Name',
                          hintText: "Jagat",
                        ),
                      ),
                      TextFieldInput(
                        label: 'Legal Last Name',
                        hintText: "Raj",
                      ),
                      TextFormField(
                          onTap: () => _selectDate(context),
                          decoration: InputDecoration(
                            labelText: "Select Date",
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w200,
                            ),
                            hintText: '2000-12-12',
                            hintStyle: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(0, 0, 0, .5),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
                            border: InputBorder.none,
                            // Remove focused properties
                            focusedBorder: InputBorder.none,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                          readOnly: true,
                          controller: TextEditingController(
                            text: _selectedDate != null
                                ? "${_selectedDate?.toLocal()}".split(' ')[0]
                                : "",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "null";
                            } else {
                              return null;
                            }
                          }),
                           TextFieldInput(
                        label: 'Country of origin',
                        hintText: "United States ",
                      ),
                      TextFieldInput(
                        label: 'Postcode and City',
                        hintText: "W1W 7LT London ",
                      ),
                       TextFieldInput(
                        label: 'Street and number',
                        hintText: "Great Portland Street, 1B ",
                      ),
                       TextFieldInput(
                        label: 'Email',
                        hintText: "sample@gmail.com ",
                      ),
                      
                      SizedBox(height: 20,), 
                      
                      SizedBox(
                        height: 48,
                        width: 358,
                        
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: ElevatedButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (formKey.currentState!.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Processing Data')),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                          backgroundColor:Color.fromRGBO(83, 160, 110, 1),
                          
                                            ),
                            child: const Text('Submit',style: TextStyle(color: Colors.white),),
                            
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        )),
      ),
    );
  }
}

class TextFieldInput extends StatelessWidget {
  const TextFieldInput({
    super.key,
    required this.label,
    required this.hintText,
    this.selectDate,
  });
  final String label, hintText;
  final DateTime? selectDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      color: Color.fromRGBO(255, 255, 255, 1),
      child: TextFormField(
        decoration: InputDecoration(
          label: Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w200,
            ),
          ),

          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(0, 0, 0, .5),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          border: InputBorder.none,
          // Remove focused properties
          focusedBorder: InputBorder.none,
          floatingLabelBehavior: FloatingLabelBehavior.always,

          // focusedErrorBorder: ,
          // focusedLabelStyle: ,
          // focusColor: ,
          // focusedBorder: ,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
    );
  }
}

class MyProfile extends StatelessWidget {
  const MyProfile({
    super.key,
    required this.image,
    required this.onImageTap,
  });
  final XFile? image;
  final VoidCallback onImageTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "My Profile",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              Text(
                "Personal details",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(142, 142, 142, 1)),
              )
            ],
          ),
          Stack(
            children: [
              InkWell(
                onTap: onImageTap,
                child: Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(56),
                      color: Color.fromARGB(142, 142, 142, 1)),
                  child: image != null?ClipOval(
                          child: Image.file(
                            File(image!.path),
                            fit: BoxFit.cover,
                            width: 56,
                            height: 56,
                          ),
                        ):
                      Center(
                    child: Text(
                      "AK",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(21, 20, 31, 1)),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 2,
                bottom: 0,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(83, 160, 110, 1)),
                  child: Center(
                      child: Icon(
                    Icons.camera_alt_rounded,
                    size: 10,
                    color: Colors.white,
                  )),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
