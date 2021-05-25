import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:laxminarayan_portfolio/constants.dart';
import 'package:laxminarayan_portfolio/default_button.dart';
import 'package:laxminarayan_portfolio/project_controller.dart';

import 'size_config.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final ProjectController projectController = Get.put(ProjectController());

  AnimationController _colorAnimationController;
  Animation _bgColorTween, _iconColorTween;
  final fontSize = 14.0;
  final FontWeight fontWeight = FontWeight.w800;

  bool _scrollListener(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.axis == Axis.vertical) {
      _colorAnimationController.animateTo(scrollInfo.metrics.pixels / 100);
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    _colorAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    _bgColorTween =
        ColorTween(begin: Color(0xFF000000), end: Color(0xFFFFFFFFF))
            .animate(_colorAnimationController);
    _iconColorTween =
        ColorTween(end: Color(0xFF000000), begin: Color(0xFFFFFFFFF))
            .animate(_colorAnimationController);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(100, 100),
        child: AnimatedBuilder(
          animation: _colorAnimationController,
          builder: (context, child) => Container(
            height: 70,
            width: double.infinity,
            color: _bgColorTween.value,
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
            child: Row(
              children: [
                Text(
                  'nryn',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: _iconColorTween.value),
                ),
                Spacer(
                  flex: 2,
                ),
                buildAppBarAction('Home'),
                buildAppBarAction('About'),
                buildAppBarAction('Portfolio'),
              ],
            ),
          ),
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: _scrollListener,
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildIntro(),
              SizedBox(height: 80),
              buildAbout(),
              SizedBox(height: 80),
              Container(
                color: Colors.black,
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 80),
                    Text(
                      'PORTFOLIO',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    Text(
                      'Check what I\'ve been doing lately.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 30),
                    Wrap(
                      direction: Axis.vertical,
                      alignment: WrapAlignment.center,
                      spacing: 16,
                      runSpacing: 16,
                      children: List.generate(
                        projectController.projects.length,
                        (index) => InkWell(
                          onTap: () {},
                          onHover: (value) {
                            if (value) {
                              projectController.projects[index]['color'] =
                                  '0xFF4CAF50';
                            } else {
                              projectController.projects[index]['color'] =
                                  '0xD7222222';
                            }
                            projectController.projects.refresh();
                          },
                          child: Obx(
                            () => buildProjectCard(
                                projectController.projects[index]),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProjectCard(project) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      width: Get.width * 0.6,
      padding: EdgeInsets.all(30),
      color: Color(int.parse(project['color'])),
      child: SizeConfig.screenWidth >= 600
          ? Row(
              children: [
                Image.asset(
                  project['img'],
                  width: getProportionateScreenWidth(60),
                  height: getProportionateScreenWidth(60),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        project['title'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        project['desc'],
                        overflow: TextOverflow.fade,
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Tech Stacks:',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        project['techList'],
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          : Column(
              children: [
                Image.asset(
                  project['img'],
                  // height: 80,
                  width: getProportionateScreenWidth(80),
                ),
                SizedBox(height: 16),
                Text(
                  project['title'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  project['desc'],
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Tech Stacks:',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
                Text(
                  project['techList'],
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
    );
  }

  Container buildIntro() {
    return Container(
      height: Get.height - 70,
      width: double.infinity,
      color: Colors.black,
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 1200),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Image.asset('assets/images/banner.png'),
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText.rich(
                      TextSpan(
                        text: 'Hello, I\'m',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: SizeConfig.screenWidth <= 600 ? 40 : 50,
                        ),
                        children: <TextSpan>[
                          // TextSpan(
                          //   text: '\nI\'m',
                          // ),
                          TextSpan(
                            text: '\nLaxminarayan.',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor,
                            ),
                          ),
                          TextSpan(
                            text: '\nA mobile application developer',
                            style: TextStyle(
                              fontSize: SizeConfig.screenWidth <= 600 ? 10 : 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    DefaultButton(
                      text: 'DOWNLOAD RESUME',
                      press: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildAbout() {
    return Container(
      // height: Get.height + 70,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 30),
      constraints: BoxConstraints(maxWidth: 1200),
      child: Center(
        child: SelectableText.rich(
          TextSpan(
            text: 'ABOUT ME',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
            children: <TextSpan>[
              TextSpan(
                text: '\nIf you’re wondering who I am...',
                style: TextStyle(
                  fontSize: fontSize,
                ),
              ),
              TextSpan(
                text: '\n\nI\'m',
                style: TextStyle(
                  fontSize: fontSize,
                ),
              ),
              TextSpan(
                text: ' Laxminarayan,',
                style:
                    TextStyle(fontSize: fontSize, fontWeight: FontWeight.w700),
              ),
              TextSpan(
                text: ' a 22years old self-taught',
                style: TextStyle(
                  fontSize: fontSize,
                  // fontWeight: FontWeight.w900
                ),
              ),
              TextSpan(
                text: ' Mobile Application Developer',
                style:
                    TextStyle(fontSize: fontSize, fontWeight: FontWeight.w700),
              ),
              TextSpan(
                text: ', from Bhubaneswar.',
                style: TextStyle(
                  fontSize: fontSize,
                  // fontWeight: FontWeight.w700
                ),
              ),
              TextSpan(
                text:
                    '\n\nI started using a smartphone when I was in the 6th standard, then the apps in it attracted me, and was curious how these apps are being made. Since then I decided to build my career in the IT field.',
                style: TextStyle(
                  fontSize: fontSize,
                  // fontWeight: FontWeight.w700
                ),
              ),
              TextSpan(
                text:
                    '\n\nIn August 2017, I took admission to Computer Science & Engineering in Orissa Engineering College, thought now I would learn about the technology in college, where I competed for 2years, but I only learned basic JAVA programming language,',
                style: TextStyle(
                  fontSize: fontSize,
                  // fontWeight: FontWeight.w700
                ),
              ),
              TextSpan(
                text: '\nI wasn\'t learning and improving, I felt stuck.',
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
              ),
              TextSpan(
                text:
                    '\n\nIn July 2019, We had a super cyclone-hit Odisha. Everything almost destructed. Schools, colleges had to shut down for the reconstruction. I got a chance to start learning & developing apps. So, I woke up early morning to study JAVA, Android. I quickly started to',
                style: TextStyle(
                  fontSize: fontSize,
                  // fontWeight: fontWeight
                ),
              ),
              TextSpan(
                text: ' love Android.',
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
              ),
              TextSpan(
                text:
                    ' I have been studying application development full time ever since.',
                style: TextStyle(
                  fontSize: fontSize,
                  // fontWeight: fontWeight,
                ),
              ),
              TextSpan(
                text: '\n\nDuring this time, I took online courses like ',
                style: TextStyle(
                  fontSize: fontSize,
                  // fontWeight: fontWeight,
                ),
              ),
              TextSpan(
                text:
                    'The Complete Android Oreo Developer Course - Build 23 Apps!, Android Studio Tutorial',
                style: TextStyle(
                  fontSize: fontSize,
                  // fontWeight: fontWeight,
                  decoration: TextDecoration.underline,
                ),
              ),
              TextSpan(
                text: ' and watched countless youtube videos about android.',
                style: TextStyle(
                  fontSize: fontSize,
                  // fontWeight: fontWeight,
                  // decoration: TextDecoration.underline,
                ),
              ),
              TextSpan(
                text:
                    '\n\nLuckily after some months, I got my first freelancing project where I could learn new things and apply all the knowledge that I collected from all the sources. This project indeed got me the confidence to accomplish a task within a deadline, though the app is beginner-level, but learned a lot about real-world problems & solutions. Since then I keep developing myself.',
                style: TextStyle(
                  fontSize: fontSize,
                  // fontWeight: fontWeight,
                  // decoration: TextDecoration.underline,
                ),
              ),
              TextSpan(
                text: '\n\nSlowly Steadily, I am shifting myself to ',
                style: TextStyle(
                  fontSize: fontSize,
                  // fontWeight: fontWeight,
                  // decoration: TextDecoration.underline,
                ),
              ),
              TextSpan(
                text: 'Flutter',
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  // decoration: TextDecoration.underline,
                ),
              ),
              TextSpan(
                text:
                    ' because I found it is much easy and less code can produce good results in less time.',
                style: TextStyle(
                  fontSize: fontSize,
                  // fontWeight: fontWeight,
                  // decoration: TextDecoration.underline,
                ),
              ),
              TextSpan(
                text: '\n\nMy current stack of languages/technologies is:',
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  // decoration: TextDecoration.underline,
                ),
              ),
              TextSpan(
                text:
                    '\nFlutter - Dart - JAVA - Android - XML - Sketch - Photoshop - Firebase - Git - GitHub',
                style: TextStyle(
                  fontSize: fontSize,
                  // fontWeight: fontWeight,
                  // decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget buildAppBarAction(String name) {
    return Container(
      margin: EdgeInsets.all(16),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Text(
          name,
          style: TextStyle(fontSize: 16, color: _iconColorTween.value),
        ),
      ),
    );
  }
}
