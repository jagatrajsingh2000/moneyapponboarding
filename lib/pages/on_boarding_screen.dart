// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moneyapponboarding/pages/pageView.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreen();
}

// OnBoarding content Model
class OnBoard {
  final String image, title, description;

  OnBoard({
    required this.image,
    required this.title,
    required this.description,
  });
}

// OnBoarding content list
final List<OnBoard> demoData = [
  OnBoard(
    image: "assets/images/group1.png",
    title: "Welcome to SmartBank",
    description: "Managing your money has never been so easy.",
  ),
  OnBoard(
    image: "assets/images/group2.png",
    title: "Welcome to SmartBank",
    description: "Spend smarter every day, all from one app.",
  ),
  OnBoard(
    image: "assets/images/group3.png",
    title: "Welcome to SmartBank",
    description: "Safe and secure international transactions ",
  ),
];

class _OnBoardingScreen extends State<OnBoardingScreen> {

  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color.fromRGBO(255, 255, 255, 1),
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 26, 16, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  demoData[_pageIndex].title,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 13,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(128, 140, 145, 1),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  height: 120,
                  child: Text(
                    demoData[_pageIndex].description,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 34,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(12, 33, 44, 1),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 38,
            ),
            OnBoardingPageView(pageController: _pageController, onChange: (pageIndex) {
              setState(() {
                  _pageIndex = pageIndex;
              });
            
            },),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    demoData.length,
                    (index) => Padding(
                          padding: EdgeInsets.only(right: 4),
                          child: dotIndicator(index),
                        ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 43,
              width: 343,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Sign up"),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Color.fromRGBO(43, 97, 115, 1),
                  // padding: EdgeInsets.symmetric(horizontal: 150.0, vertical: 21.5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            SizedBox(
              height: 43,
              width: 343,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(231, 234, 235, 1),
                  // padding: EdgeInsets.symmetric(horizontal: 150.0, vertical: 21.5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  elevation: 0,
                ),
                child: Text(
                  "Log In",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Spacer()
          ]),
        ));
  }

  Row dotIndicator(int index) {
    return Row(children: [
      Container(
          height: 6,
          width: index == _pageIndex ? 24 : 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: index == _pageIndex
                ? Color.fromRGBO(39, 145, 181, 1)
                : Color.fromRGBO(214, 218, 219, 1),
          ))
    ]);
  }
}
