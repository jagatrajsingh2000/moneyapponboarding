import 'package:flutter/material.dart';

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


class OnBoardingPageView extends StatefulWidget {
  final PageController pageController;
  final void Function(int pageIndex)?  onChange;
  const OnBoardingPageView({super.key, required this.pageController, this.onChange});

  @override
  State<OnBoardingPageView> createState() => _OnBoardingPageViewState();
}

class _OnBoardingPageViewState extends State<OnBoardingPageView> {
  
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
              height: 300,
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: demoData.length,
                controller: widget.pageController,
                onPageChanged: (index) {
                  setState(() {
                    // OnBoardingPageView.pageIndex = index;
                    // widget.function(index);
                    widget.onChange?.call(index);
                  });
                },
                itemBuilder: (context, index) => Column(
                  children: [
                    Image.asset(demoData[index].image, width: 350, height: 300),
                  ],
                ),
              ),
            );
  }
}