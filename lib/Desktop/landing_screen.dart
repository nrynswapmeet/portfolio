// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laxminarayan_portfolio/Components/dark_button.dart';
import 'package:laxminarayan_portfolio/Components/intro_logo.dart';
import 'package:laxminarayan_portfolio/Controller/resource_controller.dart';
import 'package:laxminarayan_portfolio/Controller/theme_controller.dart';
import 'package:laxminarayan_portfolio/Util/responsive.dart';
import 'package:laxminarayan_portfolio/Util/util.dart';
import 'package:laxminarayan_portfolio/constants.dart';
import 'package:laxminarayan_portfolio/default_button.dart';

import '../size_config.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen>
    with TickerProviderStateMixin {
  final homeKey = new GlobalKey();
  final aboutMeKey = new GlobalKey();
  final projectKey = new GlobalKey();
  final contactMeKey = new GlobalKey();

  final ResourceController resourceController = Get.put(ResourceController());
  final ThemeController themeController = Get.find();

  AnimationController _colorAnimationController;
  Animation _bgColorTween, _iconColorTween;
  final fontSize = 14.0;
  final FontWeight fontWeight = FontWeight.w800;

  bool _scrollListener(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.axis == Axis.vertical) {
      _colorAnimationController.animateTo(scrollInfo.metrics.pixels / 5);
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    _colorAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    _bgColorTween = ColorTween(
      begin: Theme.of(context).scaffoldBackgroundColor,
      end: Theme.of(context).textTheme.headline1.color,
    ).animate(_colorAnimationController);
    _iconColorTween = ColorTween(
      end: Theme.of(context).scaffoldBackgroundColor,
      begin: Theme.of(context).textTheme.headline1.color,
    ).animate(_colorAnimationController);

    return Scaffold(
      drawer: Responsive.isMobile(context)
          ? Drawer(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: Get.height * 0.05),
                    Container(
                      height: 50,
                      child: Text.rich(
                        TextSpan(
                          text: 'nryn',
                          style: GoogleFonts.roboto(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.bodyText1.color,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '.',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height * 0.05),
                    GestureDetector(
                        onTap: () {
                          Scrollable.ensureVisible(homeKey.currentContext,
                              duration: Duration(seconds: 1));
                          Navigator.of(context).pop();
                        },
                        child: buildAppBarAction('Home')),
                    GestureDetector(
                      onTap: () {
                        Scrollable.ensureVisible(aboutMeKey.currentContext,
                            duration: Duration(seconds: 1));
                        Navigator.of(context).pop();
                      },
                      child: buildAppBarAction('About'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Scrollable.ensureVisible(projectKey.currentContext,
                            duration: Duration(seconds: 1));
                        Navigator.of(context).pop();
                      },
                      child: buildAppBarAction('Projects'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Scrollable.ensureVisible(contactMeKey.currentContext,
                            duration: Duration(seconds: 1));
                        Navigator.of(context).pop();
                      },
                      child: buildAppBarAction('Contact Me'),
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/Icon awesome-moon.svg',
                        color: _iconColorTween.value,
                      ),
                      onPressed: () {
                        if (themeController.isDark.value) {
                          Get.changeThemeMode(ThemeMode.light);
                          themeController.isDark.value = false;
                        } else {
                          Get.changeThemeMode(ThemeMode.dark);
                          themeController.isDark.value = true;
                        }
                      },
                    ),
                    Spacer(),
                    Text(
                      'COPYRIGHT © 2021, LAXMINARAYAN',
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .color
                            .withOpacity(.4),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            )
          : null,
      appBar: PreferredSize(
        preferredSize: Size(100, 100),
        child: AnimatedBuilder(
          animation: _colorAnimationController,
          builder: (context, child) => Container(
            height: 70,
            width: double.infinity,
            color: _bgColorTween.value,
            padding: EdgeInsets.only(
              left: Get.width * 0.1,
              right: Get.width * 0.05,
            ),
            child: (Responsive.isDesktop(context) ||
                    Responsive.isTablet(context))
                ? Row(
                    children: [
                      IntroLogo(iconColorTween: _iconColorTween),
                      Spacer(
                        flex: 2,
                      ),
                      GestureDetector(
                          onTap: () {
                            Scrollable.ensureVisible(homeKey.currentContext,
                                duration: Duration(seconds: 1));
                          },
                          child: buildAppBarAction('Home')),
                      GestureDetector(
                        onTap: () {
                          Scrollable.ensureVisible(aboutMeKey.currentContext,
                              duration: Duration(seconds: 1));
                        },
                        child: buildAppBarAction('About'),
                      ),
                      GestureDetector(
                        onTap: () {
                          Scrollable.ensureVisible(projectKey.currentContext,
                              duration: Duration(seconds: 1));
                        },
                        child: buildAppBarAction('Portfolio'),
                      ),
                      GestureDetector(
                        onTap: () {
                          Scrollable.ensureVisible(contactMeKey.currentContext,
                              duration: Duration(seconds: 1));
                        },
                        child: buildAppBarAction('Contact Me'),
                      ),
                      DarkButton(
                        iconColorTween: _iconColorTween,
                      ),
                    ],
                  )
                : Row(
                    children: [
                      IntroLogo(iconColorTween: _iconColorTween),
                      Spacer(),
                      IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: _iconColorTween.value,
                          ),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          })
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
              buildIntro(homeKey),
              aboutMePage(aboutMeKey),
              aboutProjectPage(projectKey),
              contactMePage(contactMeKey)
            ],
          ),
        ),
      ),
    );
  }

  Widget contactMePage(Key key) {
    return Center(
      key: key,
      child: Container(
        constraints: BoxConstraints(maxWidth: 1200),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        padding: Responsive.isMobile(context)
            ? EdgeInsets.all(16)
            : EdgeInsets.symmetric(horizontal: 84),
        height: Get.height - 70,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 30),
            BuildHeading(
              context: context,
              title: 'CONTACT ME',
            ),
            SizedBox(height: 20),
            Text(
              'If you want to talk, you can find me at:',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: Get.height * 0.15),
            GestureDetector(
              onTap: () {
                Utility().launchURL('mailto:laxminarayan1998@icloud.com');
              },
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Text(
                  'laxminarayan1998@icloud.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).textTheme.bodyText1.color,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Utility().launchURL('tel:+919776229989');
              },
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Text(
                  '+91 977 622 9989',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).textTheme.bodyText1.color,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 10),
            Wrap(
              alignment: WrapAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: List.generate(
                resourceController.socialLinks.length,
                (index) => MakeIcon(
                  path: resourceController.socialLinks[index]['icon'],
                  url: resourceController.socialLinks[index]['url'],
                ),
              ),

              // [
              //   MakeIcon(
              //     path: 'assets/icons/facebook_icon.svg',
              //   ),
              //   MakeIcon(
              //     path: 'assets/icons/instagram_icon.svg',
              //   ),
              //   MakeIcon(
              //     path: 'assets/icons/github_icon.svg',
              //   ),
              //   MakeIcon(
              //     path: 'assets/icons/linkedin_icon.svg',
              //   ),
              // ],
            ),
            Spacer(
              flex: 2,
            ),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: 0,
                  child: Text(
                    'MOBILE APPLICATION DEVELOPER',
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).textTheme.bodyText1.color,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: SvgPicture.asset(
                    'assets/icons/nryn_logo.svg',
                    width: 200,
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(
              'COPYRIGHT © 2021, LAXMINARAYAN',
              style: TextStyle(
                fontSize: 12,
                color:
                    Theme.of(context).textTheme.bodyText1.color.withOpacity(.4),
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget aboutProjectPage(Key key) {
    return Center(
      key: key,
      child: Container(
        constraints: BoxConstraints(maxWidth: 1200),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        padding: Responsive.isMobile(context)
            ? EdgeInsets.all(16)
            : EdgeInsets.symmetric(horizontal: 84),
        // height: Get.height - 70,
        width: double.infinity,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 30),
              BuildHeading(
                context: context,
                title: '\nPORTFOLIO',
              ),
              SizedBox(height: 20),
              Text(
                'Check what I’ve been doing lately.',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.left,
              ),
              FutureBuilder(
                future: resourceController.getProjects(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ProjectList(
                        index: index,
                        projUrl: resourceController.projectsList[index].projUrl,
                        projImage:
                            resourceController.projectsList[index].projImage,
                        projDesc:
                            resourceController.projectsList[index].projDesc,
                        projName:
                            resourceController.projectsList[index].projName,
                        techsUsed: resourceController.projectsList[index].tech,
                      );
                    },
                    itemCount: resourceController.projectsList.length,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget aboutMePage(Key key) {
    return Container(
      key: key,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      padding: Responsive.isMobile(context)
          ? EdgeInsets.symmetric(horizontal: 50)
          : EdgeInsets.symmetric(horizontal: 84),
      // height: Get.height - 70,
      constraints: BoxConstraints(minHeight: Get.height - 70, maxWidth: 1200),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BuildHeading(
            context: context,
            title: '\nABOUT ME',
          ),
          paraOne(),
          paraTwo(),
          paraThree(),
          paraFour(),
          paraFive(),
          paraSix(),
          paraSeven(),
          paraEight(),
          paraNine(),
          paraTen(),
          paraEleven(),
        ],
      ),
    );
  }

  Text paraEleven() {
    return Text(
      'Flutter - Dart - JAVA - Android - XML - Sketch - XD - Photoshop - Firebase - Git - GitHub',
      style: TextStyle(
        fontSize: 16,
        color: const Color(0xff37ad6b),
        fontWeight: FontWeight.w700,
      ),
      textAlign: TextAlign.center,
    );
  }

  Text paraTen() {
    return Text(
      'My current stack of languages/technologies is:\n',
      style: TextStyle(
        fontSize: 16,
        color: Theme.of(context).textTheme.bodyText1.color,
        fontWeight: FontWeight.w700,
      ),
      textAlign: TextAlign.justify,
    );
  }

  Text paraNine() {
    return Text.rich(
      TextSpan(
        style: TextStyle(
            fontSize: 16, color: Theme.of(context).textTheme.bodyText1.color),
        children: [
          TextSpan(
            text:
                'I always want to learn more, do more, and be more. I’m also a firm believer that we should ',
          ),
          WidgetSpan(
              child:
                  RatatedContainer(title: 'never settle.', latoFamily: true)),
          TextSpan(
            text: '\n',
          ),
        ],
      ),
      textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
      textAlign: TextAlign.justify,
    );
  }

  Text paraEight() {
    return Text.rich(
      TextSpan(
        style: TextStyle(
            fontSize: 16, color: Theme.of(context).textTheme.bodyText1.color),
        children: [
          TextSpan(
            text: 'Slowly Steadily, I am shifting myself to ',
          ),
          WidgetSpan(
              child: RatatedContainer(title: 'Flutter', latoFamily: true)),
          TextSpan(
            text:
                ', because I found it is much easy and less code can produce good results in less time.\n',
          ),
        ],
      ),
      textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
      textAlign: TextAlign.justify,
    );
  }

  Text paraSeven() {
    return Text(
      'Luckily after some months, I got my first freelancing project where I could learn new things and apply all the knowledge that I have collected from all the sources. This project indeed got me the confidence to accomplish a task within a deadline, though the app is beginner-level, but learned a lot about real-world problems & solutions. Since then I keep developing myself.\n',
      style: TextStyle(
          fontSize: 16, color: Theme.of(context).textTheme.bodyText1.color),
      textAlign: TextAlign.justify,
    );
  }

  Text paraSix() {
    return Text.rich(
      TextSpan(
        style: TextStyle(
            fontSize: 16, color: Theme.of(context).textTheme.bodyText1.color),
        children: [
          TextSpan(text: 'During this time, I took online courses like '),
          TextSpan(
            text: 'The Complete Android Oreo Developer Course - Build 23 Apps!',
            style: TextStyle(
                // fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline),
          ),
          TextSpan(
            text: ', ',
            style: TextStyle(
                // fontWeight: FontWeight.w600,
                ),
          ),
          TextSpan(
            text: 'Android Studio Tutorial',
            style: TextStyle(
              // fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
          ),
          TextSpan(
            text: ' and watched countless YouTube videos about android.\n',
          ),
        ],
      ),
      textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
      textAlign: TextAlign.justify,
    );
  }

  Text paraFive() {
    return Text(
        'In July 2019, We had a super cyclone struck Odisha. Everything almost destructed. Schools, colleges had to shut down for the reconstruction. I got a chance to stay in home, start learning & developing apps. So, I woke up early morning to study JAVA, Android. I quickly started to love Android. I have been studying application development full time ever since.\n',
        style: TextStyle(
            fontSize: 16, color: Theme.of(context).textTheme.bodyText1.color),
        textAlign: TextAlign.justify);
  }

  Text paraFour() {
    return Text.rich(
        TextSpan(
          style: TextStyle(
              fontSize: 16, color: Theme.of(context).textTheme.bodyText1.color),
          children: [
            TextSpan(text: 'In August 2017, I took admission to '),
            TextSpan(
              text: 'Computer Science & Engineering',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            TextSpan(text: ' in '),
            TextSpan(
                text: 'Orissa Engineering College',
                style: TextStyle(fontWeight: FontWeight.w800)),
            TextSpan(
                text:
                    ', thought now I would learn about the technology in college, where I competed for 2years, but I only learned basic JAVA programming language,'),
            TextSpan(
              text: ' I wasn’t learning and improving, I felt stuck.\n',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
          ],
        ),
        textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
        textAlign: TextAlign.justify);
  }

  Text paraThree() {
    return Text(
      'I started using a smartphone when I was in the 6th standard, then the apps in it attracted me, and was curious how these apps are being made. Since then I decided to build my career in the IT field.\n',
      style: TextStyle(
          fontSize: 16, color: Theme.of(context).textTheme.bodyText1.color),
      textAlign: TextAlign.justify,
    );
  }

  Text paraTwo() {
    return Text.rich(
      TextSpan(
        style: TextStyle(
            fontSize: 16, color: Theme.of(context).textTheme.bodyText1.color),
        children: [
          TextSpan(
            text: 'I\'m ',
          ),
          WidgetSpan(
              child: RatatedContainer(
            title: 'Laxminarayan',
            latoFamily: true,
          )),
          TextSpan(
            text: ', who ',
          ),
          TextSpan(
            text: 'a 23 years old self-taught ',
          ),
          WidgetSpan(
              child:
                  RatatedContainer(title: 'App Developer', latoFamily: true)),
          TextSpan(
            text: ', from ',
          ),
          WidgetSpan(
              child: RatatedContainer(title: 'Bhubaneswar', latoFamily: true)),
          TextSpan(
            text: '.\n',
          ),
        ],
      ),
      textAlign: TextAlign.justify,
    );
  }

  Text paraOne() {
    return Text.rich(
      TextSpan(
        style: TextStyle(
            fontSize: 16, color: Theme.of(context).textTheme.bodyText1.color),
        children: [
          TextSpan(text: 'If you’re '),
          TextSpan(
            text: 'wondering',
            style: TextStyle(
              fontWeight: FontWeight.w800,
            ),
          ),
          TextSpan(text: ' who '),
          TextSpan(text: 'I am', style: TextStyle(fontWeight: FontWeight.w800)),
          TextSpan(text: '…\n'),
        ],
      ),
      textAlign: TextAlign.justify,
    );
  }

  Widget buildIntro(Key key) {
    return Stack(
      children: [
        Container(
          key: key,
          height: Get.height - 70,
          width: double.infinity,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Responsive.isMobile(context)
                  ? Positioned(
                      bottom: 0,
                      right: -60,
                      child: Opacity(
                        opacity: .4,
                        child: Image.asset(
                          'assets/images/MY_IMAGE.png',
                          height: Get.height * 0.9,
                        ),
                      ),
                    )
                  : Container(),
              Center(
                child: Container(
                  height: Get.height * 0.4,
                  width: double.infinity,
                  decoration: new BoxDecoration(
                    gradient: new LinearGradient(
                      colors: [
                        const Color(0x00FFFFFF),
                        const Color(0xFF606085).withOpacity(0.67),
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp,
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 1200),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        left: Responsive.isMobile(context) ? 52 : 82,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello, I’m',
                              style: TextStyle(
                                fontSize:
                                    Responsive.isMobile(context) ? 18 : 28,
                                color:
                                    Theme.of(context).textTheme.headline1.color,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text.rich(
                              TextSpan(
                                style: TextStyle(
                                  fontSize:
                                      Responsive.isMobile(context) ? 20 : 40,
                                  color: const Color(0xff37ad6b),
                                ),
                                children: [
                                  TextSpan(
                                    text: 'LAXMINARAYAN',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' DAS',
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .headline1
                                          .color,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: RatatedContainer(
                                      title: 'App Developer',
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' based in Bhubaneswar',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .color,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
                            Text.rich(
                              TextSpan(
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: const Color(0xffa6b1bb),
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Got a project? ',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .color,
                                    ),
                                  ),
                                  WidgetSpan(
                                    child: GestureDetector(
                                      onTap: () {
                                        Scrollable.ensureVisible(
                                            contactMeKey.currentContext,
                                            duration: Duration(seconds: 1));
                                      },
                                      child: MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: Text(
                                          'Let’s talk.',
                                          style: TextStyle(
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w600,
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .color,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 18),
                            DefaultButton(
                              text: 'DOWNLOAD RESUME',
                              press: () {
                                String url =
                                    'https://github.com/laxminarayan1998/portfolio_data/raw/main/Laxminarayan%20Resume.pdf';
                                html.AnchorElement anchorElement =
                                    new html.AnchorElement(href: url);
                                anchorElement.download = url;
                                anchorElement.click();
                              },
                            )
                          ],
                        ),
                      ),
                      (Responsive.isDesktop(context) ||
                              Responsive.isTablet(context))
                          ? Positioned(
                              bottom: 0,
                              right: 82,
                              child: Image.asset(
                                'assets/images/MY_IMAGE.png',
                                height: Get.height * 0.8,
                              ),
                            )
                          : Container()
                      // Positioned(
                      //     bottom: 0,
                      //     right: -60,
                      //     child: Image.asset(
                      //       'assets/images/MY_IMAGE.png',
                      //       height: Get.height * 0.8,
                      //     ),
                      //   )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildAppBarAction(String name) {
    return Container(
      margin: EdgeInsets.all(16),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Text(
          name,
          style: TextStyle(
            fontSize: 16,
            color: _iconColorTween.value,
          ),
        ),
      ),
    );
  }
}

class MakeIcon extends StatefulWidget {
  final String path;
  final String url;
  const MakeIcon({
    Key key,
    @required this.path,
    @required this.url,
  }) : super(key: key);

  @override
  _MakeIconState createState() => _MakeIconState();
}

class _MakeIconState extends State<MakeIcon> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHover = false;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 20),
        child: Container(
          height: 35,
          decoration: isHover
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                      BoxShadow(
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .color
                            .withAlpha(20),
                        blurRadius: 6.0,
                        spreadRadius: 0.0,
                        offset: Offset(0.0, 2.0),
                      ),
                    ])
              : BoxDecoration(),
          child: OutlinedButton(
            onPressed: () async {
              Utility().launchURL(widget.url);
            },
            style: OutlinedButton.styleFrom(
              shape: CircleBorder(),
              side: BorderSide(
                width: 1.5,
                color: isHover
                    ? kPrimaryColor
                    : Theme.of(context)
                        .textTheme
                        .bodyText1
                        .color
                        .withOpacity(.6),
              ),
            ),
            child: SvgPicture.asset(
              widget.path,
              height: 16,
              color: isHover
                  ? kPrimaryColor
                  : Theme.of(context).textTheme.bodyText1.color.withOpacity(.6),
            ),
          ),
        ),
      ),
    );
  }
}

class ProjectList extends StatefulWidget {
  final String projName;
  final String projImage;
  final String projDesc;
  final String projUrl;
  final dynamic techsUsed;
  final int index;
  const ProjectList({
    Key key,
    this.projName,
    this.projImage,
    this.projDesc,
    this.techsUsed,
    this.index,
    this.projUrl,
  }) : super(key: key);

  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    var imgForDesktop = Expanded(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Opacity(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Image.asset(widget.projImage,
                    color: Theme.of(context).textTheme.bodyText1.color),
              ),
              opacity: 0.2),
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  widget.projImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
    var imgForTablet = Stack(
      clipBehavior: Clip.none,
      children: [
        Opacity(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Image.asset(
                widget.projImage,
                color: Theme.of(context).textTheme.bodyText1.color,
                width: Get.width * 0.4,
              ),
            ),
            opacity: 0.2),
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                widget.projImage,
                fit: BoxFit.cover,
                width: Get.width * 0.4,
              ),
            ),
          ),
        ),
      ],
    );
    var descForDesktop = Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${widget.projDesc}',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).textTheme.bodyText1.color,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 16),
          Row(
            // alignment: WrapAlignment.center,
            children: List.generate(
              widget.techsUsed.length,
              (index) => buildTechUsedList(
                widget.techsUsed[index]['icon'],
                widget.techsUsed[index]['name'],
              ),
            ),
          ),
          SizedBox(height: 20),
          TextButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xFF37AD6B)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            // color: kPrimaryColor,
            onPressed: () {
              Utility().launchURL(widget.projUrl);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 6),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.link,
                    color: Colors.white,
                  ),
                  Text(
                    'VISIT',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
    var descForTablet = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '${widget.projDesc}',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).textTheme.bodyText1.color,
          ),
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          // alignment: WrapAlignment.center,
          children: List.generate(
            widget.techsUsed.length,
            (index) => buildTechUsedList(
              widget.techsUsed[index]['icon'],
              widget.techsUsed[index]['name'],
            ),
          ),
        ),
        SizedBox(height: 20),
        TextButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xFF37AD6B)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          // color: kPrimaryColor,
          onPressed: () {
            Utility().launchURL(widget.projUrl);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 6),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.link,
                  color: Colors.white,
                ),
                Text(
                  'VISIT',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHover = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.all(20),
        color: !isHover
            ? Color(0xFF37AD6B).withOpacity(.17)
            : Color(0xFF37AD6B).withOpacity(.27),
        padding: EdgeInsets.all(26),
        // height: 100,
        width: double.infinity,
        child: Column(
          children: [
            RatatedContainer(title: '${widget.projName}'),
            SizedBox(height: 16),
            Responsive.isDesktop(context)
                ? widget.index % 2 == 0
                    ? Row(
                        children: [
                          imgForDesktop,
                          descForDesktop,
                        ],
                      )
                    : Row(
                        children: [
                          descForDesktop,
                          imgForDesktop,
                        ],
                      )
                : Column(
                    children: [
                      imgForTablet,
                      descForTablet,
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Container buildTechUsedList(String img, String name) {
    return Container(
      child: Row(
        children: [
          IconUsed(
            img: img,
            title: '$name',
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}

class ProjectListTablet extends StatelessWidget {
  final String projName;
  final String projImage;
  final String projDesc;
  final String projUrl;
  final dynamic techsUsed;
  final int index;
  const ProjectListTablet({
    Key key,
    this.projName,
    this.projImage,
    this.projDesc,
    this.techsUsed,
    this.index,
    this.projUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var img = Stack(
      clipBehavior: Clip.none,
      children: [
        Opacity(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Image.asset(
                projImage,
                color: Theme.of(context).textTheme.bodyText1.color,
                width: Get.width * 0.4,
              ),
            ),
            opacity: 0.2),
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                projImage,
                fit: BoxFit.cover,
                width: Get.width * 0.4,
              ),
            ),
          ),
        ),
      ],
    );
    var desc = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '$projDesc',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).textTheme.bodyText1.color,
          ),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            techsUsed.length,
            (index) => buildTechUsedList(
              techsUsed[index]['icon'],
              techsUsed[index]['name'],
            ),
          ),
        ),
        SizedBox(height: 20),
        TextButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xFF37AD6B)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          // color: kPrimaryColor,
          onPressed: () {
            Utility().launchURL(projUrl);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 6),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.link,
                  color: Colors.white,
                ),
                Text(
                  'VISIT',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
    return Container(
      margin: EdgeInsets.all(20),
      color: Color(0xFF37AD6B).withOpacity(.27),
      padding: EdgeInsets.all(30),
      // height: 100,
      width: double.infinity,
      child: Column(
        children: [
          RatatedContainer(title: '$projName'),
          SizedBox(height: 16),
          Column(
            children: [
              img,
              desc,
            ],
          ),
        ],
      ),
    );
  }

  Container buildTechUsedList(String img, String name) {
    return Container(
      child: Row(
        children: [
          IconUsed(
            img: img,
            title: '$name',
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}

class IconUsed extends StatelessWidget {
  final String title;
  final String img;
  const IconUsed({
    Key key,
    @required this.title,
    @required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          img,
          height: 20,
          color: Theme.of(context).textTheme.bodyText1.color,
        ),
        SizedBox(height: 6),
        Text(
          title,
          style: TextStyle(
            fontSize: 10,
            color: Theme.of(context).textTheme.bodyText1.color,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.left,
        )
      ],
    );
  }
}

class BuildHeading extends StatelessWidget {
  final String title;

  const BuildHeading({
    Key key,
    @required this.context,
    @required this.title,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$title',
      style: TextStyle(
        fontSize: 26,
        color: Theme.of(context).textTheme.headline1.color,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.left,
    );
  }
}

class RatatedContainer extends StatelessWidget {
  final String title;
  final bool latoFamily;
  const RatatedContainer(
      {Key key, @required this.title, this.latoFamily = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.translationValues(0, 2, 0),
      child: Transform.rotate(
        angle: -(3.0 * (3.14) / 180.0),
        child: Container(
          color: kPrimaryColor,
          padding: EdgeInsets.all(2),
          child: Transform.rotate(
            angle: (3.0 * (3.14) / 180.0),
            child: Text(
              '$title',
              style: TextStyle(
                fontFamily: latoFamily ? 'Lato' : null,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
