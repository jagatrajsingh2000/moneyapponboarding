import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class Login {
  final  String title, description, label, text, linktext;
  final TextEditingController controller;
  Login({
    required this.title,
    required this.description,
    required this.label,
    required this.text,
    required this.linktext,
    required this.controller
  });
}

// OnBoarding content list
final List<Login> demoData = [
  Login(
    title: "Name",
    description: "Enter your Name",
    label:'Name',
    text:"",
    linktext:"",
    controller:TextEditingController()
  ),
  Login(
    title: "Login",
    description: "Enter the email address you use to sign in to SmartBank.",
    label:'Email address',
    text:"Don't have an account",
    linktext:"Sign Up",
    controller:TextEditingController()
  ),
  Login(
    title: "Country",
    description: "Enter the Country",
    label:'Country',
    text:"",
    linktext:"",
    controller:TextEditingController()
  ),
];
class Loginsignup extends StatefulWidget {
  const Loginsignup({super.key});

  @override
  State<Loginsignup> createState() => _LoginsignupState();
}

class _LoginsignupState extends State<Loginsignup> {
  double _width = 50;
  final _height = 5.0;
  var emailController = TextEditingController();
  Color _color = Colors.blue;
  final BorderRadiusGeometry _borderRadius = BorderRadius.circular(12);
  int currentTextIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 150,
                            height: _height,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(217, 217, 217, 1),
                              borderRadius: _borderRadius,
                            ),
                          ),
                          AnimatedContainer(
                            width: _width,
                            height: _height,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(39, 145, 181, 1),
                              borderRadius: _borderRadius,
                            ),
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastOutSlowIn,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if(currentTextIndex !=0){
                      currentTextIndex =
                            currentTextIndex - 1;
                      }
                      if (_width > 50) {
                          _width = _width - 50;
                        }
                    });
                    
                  },
                  icon: Image.asset(
                    'assets/images/Backarrow.png',
                    width: 16,
                    height: 14,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    demoData[currentTextIndex].title,
                    style:
                        const TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    demoData[currentTextIndex].description,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(19, 47, 56, 1)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Center(
              child: SizedBox(
                height: 56,
                width: 343,
                child: InputField(
                  inController: demoData[currentTextIndex].controller,
                  labelText: demoData[currentTextIndex].label,
                  icon: const Icon(Icons.line_weight),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: demoData[currentTextIndex].text,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                  children: [
                    TextSpan(
                      text: demoData[currentTextIndex].linktext,
                      style: const TextStyle(
                        color: Color.fromRGBO(39, 145, 181, 1),
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Handle link/button tap
                        },
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: SizedBox(
                height: 43,
                width: 343,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (_width < 150) {
                          _width = _width + 50;
                        }
                        currentTextIndex =
                            (currentTextIndex + 1) % demoData.length;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _color,
                    ),
                    child: const Text('Continue'),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.inController,
    required this.labelText,
    required this.icon,
  });

  final TextEditingController inController;
  final String labelText;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: inController,
      decoration: InputDecoration(
        hintText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      keyboardType: TextInputType.text,
    );
  }
}
