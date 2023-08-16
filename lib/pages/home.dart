// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Emotion {
  final String image, title;
  final Color color;
  Emotion({required this.image, required this.color, required this.title});
}

final List<Emotion> demoData = [
  Emotion(
      image: "assets/images/Happy.png",
      color: Color.fromRGBO(239, 93, 168, 1),
      title: 'Happy'),
  Emotion(
      image: "assets/images/Calm.png",
      color: Color.fromRGBO(174, 175, 247, 1),
      title: 'Angry'),
  Emotion(
      image: "assets/images/angry.png",
      color: Color.fromRGBO(160, 227, 226, 1),
      title: 'Calm'),
  Emotion(
      image: "assets/images/Relax.png",
      color: Color.fromRGBO(240, 158, 84, 1),
      title: 'Relax'),
  Emotion(
      image: "assets/images/Happy.png",
      color: Color.fromRGBO(239, 93, 168, 1),
      title: 'Happy'),
  Emotion(
      image: "assets/images/angry.png",
      color: Color.fromRGBO(174, 175, 247, 1),
      title: 'Angry'),
  Emotion(
      image: "assets/images/Calm.png",
      color: Color.fromRGBO(160, 227, 226, 1),
      title: 'Calm'),
  Emotion(
      image: "assets/images/Relax.png",
      color: Color.fromRGBO(240, 158, 84, 1),
      title: 'Relax'),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color.fromRGBO(255, 255, 255, 1),
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MenuBar(),
              Wishes(),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 26),
                child: Text(
                  "How are you feeling today?",
                  style: TextStyle(
                    color: Color.fromRGBO(55, 27, 52, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ListViewSection(),
              //  SizedBox(height:26 ),
              CardSession(),
              Padding(
                padding: const EdgeInsets.only(top: 26, left: 25),
                child: Row(
                  children: [
                    JournalLibraryCard(
                        image: 'assets/images/ion_journal.png', title: 'Journal'),
                    SizedBox(
                      width: 15,
                    ),
                    JournalLibraryCard(
                        image: 'assets/images/ic_round-article.png',
                        title: 'Library'),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              CardText(),
              PlanExpired()
            ],
          ),
        ),
      ),
      bottomNavigationBar: Stack(
        children: [
          Container(
            height: 85,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              currentIndex: selectedIndex,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: Colors.amber[800],
              unselectedItemColor: Colors.black,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 32),
                  label: 'Time',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.video_call, size: 32),
                  label: 'Folder',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.message, size: 32),
                  label: 'Folder',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.people, size: 32),
                  label: 'Folder',
                ),
              ],
            ),
          ),
          Positioned(
            left: 40.0 + (selectedIndex*100),
            top: 0,
            child: Container(
              width: 12,
              height: 7, // Increased indicator height
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16)),
                color: Colors.amber[800],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlanExpired extends StatelessWidget {
  const PlanExpired({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, top: 26),
        child: Stack(
          children: [
            Container(
              height: 151,
              width: 325,
              decoration: BoxDecoration(
                color: Color.fromRGBO(85, 160, 111, 1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Plan Expired",
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 22,
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: 169,
                      child: Text(
                        "Get back chat access and session credits",
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    RichText(
                      text: TextSpan(
                          text: 'Buy More',
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                          children: [
                            WidgetSpan(
                                child: SizedBox(
                              width: 5,
                            )),
                            WidgetSpan(
                                child: Image.asset(
                              'assets/images/arrowback.png',
                              width: 17,
                              height: 17,
                            )),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                right: 28,
                top: 44,
                child: Image.asset(
                  "assets/images/MeditationIcon.png",
                  width: 80,
                  height: 62,
                ))
          ],
        ));
  }
}

class CardText extends StatelessWidget {
  const CardText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Container(
        height: 70,
        width: 324,
        decoration: BoxDecoration(
            color: Color.fromRGBO(244, 244, 244, 1),
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Row(
            children: [
              SizedBox(
                width: 248,
                child: Text(
                  '“It is better to conquer yourself than to win a thousand battles”',
                  style: TextStyle(
                    color: Color.fromRGBO(112, 112, 112, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Image.asset(
                'assets/images/doublecomma.png',
                width: 24,
                height: 24,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class JournalLibraryCard extends StatelessWidget {
  const JournalLibraryCard({
    super.key,
    required this.image,
    required this.title,
  });
  final String image, title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      width: 155,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color.fromRGBO(244, 243, 241, 1)),
      child: Row(
        children: [
          SizedBox(
            width: 15,
          ),
          Image.asset(
            image,
            width: 22,
            height: 21,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            title,
            style: TextStyle(
              color: Color.fromRGBO(87, 57, 38, 1),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}

class CardSession extends StatelessWidget {
  const CardSession({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            height: 151,
            width: 325,
            decoration: BoxDecoration(
              color: Color.fromRGBO(254, 243, 231, 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 23),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "1 on 1 Sessions",
                      style: TextStyle(
                          color: Color.fromRGBO(87, 57, 38, 1),
                          fontSize: 22,
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: 199,
                      child: Text(
                        'Let’s open up to the things that matter the most ',
                        style: TextStyle(
                            color: Color.fromRGBO(87, 57, 38, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    RichText(
                      text: TextSpan(
                          text: 'Book Now',
                          style: TextStyle(
                              color: Color.fromRGBO(254, 130, 53, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                          children: [
                            WidgetSpan(
                                child: Image.asset(
                              'assets/images/calender.png',
                              width: 17,
                              height: 17,
                            )),
                          ]),
                    ),
                  ]),
            ),
          ),
          Positioned(
              left: 220,
              top: 40,
              child: Image.asset(
                'assets/images/MeetupIcon.png',
                width: 85,
                height: 80,
              ))
        ],
      ),
    );
  }
}

class ListViewSection extends StatelessWidget {
  const ListViewSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 146,
      child: Expanded(
        child: ListView(
          padding: const EdgeInsets.only(left: 26, top: 26),
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          children: demoData.map((emotion) {
            return Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Column(
                children: [
                  Container(
                    height: 62,
                    width: 60,
                    decoration: BoxDecoration(
                      color: emotion.color,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: IconButton(
                      onPressed: () {
                        // Handle the onPressed action for each emotion
                      },
                      icon: Image.asset(
                        emotion.image,
                        width: 33.2,
                        height: 33.2,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    emotion.title,
                    style: TextStyle(
                      color: Color.fromRGBO(130, 130, 130, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class Wishes extends StatelessWidget {
  const Wishes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 26.0, top: 6),
      child: RichText(
          text: TextSpan(
              text: "Good Afternoon\n",
              style: TextStyle(
                color: Color.fromRGBO(55, 27, 52, 1),
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
              children: [
            TextSpan(
              text: "Sarina!",
              style: TextStyle(
                color: Color.fromRGBO(55, 27, 52, 1),
                fontWeight: FontWeight.w700,
              ),
            )
          ])),
    );
  }
}

class MenuBar extends StatelessWidget {
  const MenuBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/images/profile.png',
                width: 35,
                height: 35,
              )),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/images/bell.png',
                    width: 34, height: 24),
              ),
              Positioned(
                left: 26,
                top: 6,
                child: Container(
                  width: 21,
                  height: 21,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.orange),
                  child: Center(
                    child: Text(
                      '3',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
