// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:laxminarayan_portfolio/Components/about_me_screen.dart';
// import 'package:laxminarayan_portfolio/Components/app_bar_action.dart';
// import 'package:laxminarayan_portfolio/Components/contact_screen.dart';
// import 'package:laxminarayan_portfolio/Components/dark_button.dart';
// import 'package:laxminarayan_portfolio/Components/intro_logo.dart';
// import 'package:laxminarayan_portfolio/Controller/resource_controller.dart';
// import 'package:laxminarayan_portfolio/Util/util.dart';
// import 'package:laxminarayan_portfolio/constants.dart';
// import 'package:laxminarayan_portfolio/default_button.dart';

// import '../size_config.dart';

// class TabletScreen extends StatefulWidget {
//   @override
//   _TabletScreenState createState() => _TabletScreenState();
// }

// class _TabletScreenState extends State<TabletScreen>
//     with TickerProviderStateMixin {
//   final homeKey = new GlobalKey();
//   final aboutMeKey = new GlobalKey();
//   final projectKey = new GlobalKey();
//   final contactMeKey = new GlobalKey();

//   final ResourceController resourceController = Get.put(ResourceController());

//   AnimationController _colorAnimationController;
//   Animation _bgColorTween, _iconColorTween;
//   final fontSize = 14.0;
//   final FontWeight fontWeight = FontWeight.w800;

//   bool _scrollListener(ScrollNotification scrollInfo) {
//     if (scrollInfo.metrics.axis == Axis.vertical) {
//       _colorAnimationController.animateTo(scrollInfo.metrics.pixels / 5);
//       return true;
//     }
//     return false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     _colorAnimationController =
//         AnimationController(vsync: this, duration: Duration(seconds: 0));
//     _bgColorTween = ColorTween(
//       begin: Theme.of(context).scaffoldBackgroundColor,
//       end: Theme.of(context).textTheme.headline1.color,
//     ).animate(_colorAnimationController);
//     _iconColorTween = ColorTween(
//       end: Theme.of(context).scaffoldBackgroundColor,
//       begin: Theme.of(context).textTheme.headline1.color,
//     ).animate(_colorAnimationController);

//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size(100, 100),
//         child: AnimatedBuilder(
//           animation: _colorAnimationController,
//           builder: (context, child) => Container(
//             height: 70,
//             width: double.infinity,
//             color: _bgColorTween.value,
//             padding: EdgeInsets.only(
//               left: Get.width * 0.1,
//               right: Get.width * 0.05,
//             ),
//             child: Row(
//               children: [
//                 IntroLogo(iconColorTween: _iconColorTween),
//                 Spacer(
//                   flex: 2,
//                 ),
//                 GestureDetector(
//                     onTap: () {
//                       Scrollable.ensureVisible(homeKey.currentContext,
//                           duration: Duration(seconds: 1));
//                     },
//                     child: AppBarAction(
//                         iconColorTween: _iconColorTween, name: 'Home')),
//                 GestureDetector(
//                   onTap: () {
//                     Scrollable.ensureVisible(aboutMeKey.currentContext,
//                         duration: Duration(seconds: 1));
//                   },
//                   child: AppBarAction(
//                       iconColorTween: _iconColorTween, name: 'About'),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Scrollable.ensureVisible(projectKey.currentContext,
//                         duration: Duration(seconds: 1));
//                   },
//                   child: AppBarAction(
//                       iconColorTween: _iconColorTween, name: 'Project'),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Scrollable.ensureVisible(contactMeKey.currentContext,
//                         duration: Duration(seconds: 1));
//                   },
//                   child: AppBarAction(
//                       iconColorTween: _iconColorTween, name: 'Contact Me'),
//                 ),
//                 DarkButton(
//                   iconColorTween: _iconColorTween,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       body: NotificationListener<ScrollNotification>(
//         onNotification: _scrollListener,
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               IntroScreen(context: context, introKey: homeKey),
//               AboutMeScreen(context: context, aboutKey: aboutMeKey),
//               ProjectScreen(
//                   context: context, resourceController: resourceController),
//               ContactScreen(
//                 context: context,
//                 resourceController: resourceController,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ProjectScreen extends StatelessWidget {
//   const ProjectScreen({
//     Key key,
//     @required this.context,
//     @required this.resourceController,
//   }) : super(key: key);

//   final BuildContext context;
//   final ResourceController resourceController;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       key: key,
//       child: Container(
//         constraints: BoxConstraints(maxWidth: 1200),
//         decoration: BoxDecoration(
//           color: Theme.of(context).scaffoldBackgroundColor,
//         ),
//         padding: EdgeInsets.symmetric(horizontal: 84),
//         // height: Get.height - 70,
//         width: double.infinity,
//         child: SingleChildScrollView(
//           physics: NeverScrollableScrollPhysics(),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               SizedBox(height: 30),
//               BuildHeading(
//                 context: context,
//                 title: 'PORTFOLIO',
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'Check what I’ve been doing lately.',
//                 style: TextStyle(
//                   fontSize: 16,
//                 ),
//                 textAlign: TextAlign.left,
//               ),
//               ListView.builder(
//                 shrinkWrap: true,
//                 itemBuilder: (context, index) {
//                   return ProjectList(
//                     index: index,
//                     projUrl: resourceController.projectsList[index]['projUrl'],
//                     projImage: resourceController.projectsList[index]
//                         ['projImage'],
//                     projDesc: resourceController.projectsList[index]
//                         ['projDesc'],
//                     projName: resourceController.projectsList[index]
//                         ['projName'],
//                     techsUsed: resourceController.projectsList[index]
//                         ['techsUsed'],
//                   );
//                 },
//                 itemCount: resourceController.projectsList.length,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class IntroScreen extends StatelessWidget {
//   const IntroScreen({
//     @required this.context,
//     this.introKey,
//   });

//   final BuildContext context;
//   final Key introKey;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       key: introKey,
//       height: Get.height - 70,
//       width: double.infinity,
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           Center(
//             child: Container(
//               height: Get.height * 0.4,
//               width: double.infinity,
//               decoration: new BoxDecoration(
//                 gradient: new LinearGradient(
//                   colors: [
//                     const Color(0x00FFFFFF),
//                     const Color(0xFF606085).withOpacity(0.67),
//                   ],
//                   begin: const FractionalOffset(0.0, 0.0),
//                   end: const FractionalOffset(1.0, 0.0),
//                   stops: [0.0, 1.0],
//                   tileMode: TileMode.clamp,
//                 ),
//               ),
//             ),
//           ),
//           Center(
//             child: Container(
//               constraints: BoxConstraints(maxWidth: 1200),
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Positioned(
//                     left: 82,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Hello, I’m',
//                           style: TextStyle(
//                             fontSize: 28,
//                             color: Theme.of(context).textTheme.bodyText1.color,
//                             fontWeight: FontWeight.w500,
//                           ),
//                           textAlign: TextAlign.left,
//                         ),
//                         Text.rich(
//                           TextSpan(
//                             style: TextStyle(
//                               fontSize: 40,
//                               color: const Color(0xff37ad6b),
//                             ),
//                             children: [
//                               TextSpan(
//                                 text: 'LAXMINARAYAN',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: ' DAS',
//                                 style: TextStyle(
//                                   color: Theme.of(context)
//                                       .textTheme
//                                       .bodyText1
//                                       .color,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           textHeightBehavior: TextHeightBehavior(
//                             applyHeightToFirstAscent: false,
//                           ),
//                           textAlign: TextAlign.left,
//                         ),
//                         RichText(
//                           text: TextSpan(
//                             children: [
//                               WidgetSpan(
//                                 child: RatatedContainer(
//                                   title: 'App Developer',
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: ' based in Bhubaneswar',
//                                 style: TextStyle(
//                                   fontFamily: 'Lato',
//                                   color: Theme.of(context)
//                                       .textTheme
//                                       .bodyText2
//                                       .color,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text.rich(
//                           TextSpan(
//                             style: TextStyle(
//                               fontFamily: 'Lato',
//                               color: const Color(0xffa6b1bb),
//                             ),
//                             children: [
//                               TextSpan(
//                                 text: 'Got a project? ',
//                                 style: TextStyle(
//                                   fontFamily: 'Lato',
//                                   color: Theme.of(context)
//                                       .textTheme
//                                       .bodyText2
//                                       .color,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: 'Let’s talk.',
//                                 style: TextStyle(
//                                   fontFamily: 'Lato',
//                                   fontWeight: FontWeight.w600,
//                                   color: Theme.of(context)
//                                       .textTheme
//                                       .bodyText1
//                                       .color,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           textHeightBehavior: TextHeightBehavior(
//                               applyHeightToFirstAscent: false),
//                           textAlign: TextAlign.left,
//                         ),
//                         SizedBox(height: 18),
//                         DefaultButton(
//                           text: 'DOWNLOAD RESUME',
//                           press: () {},
//                         )
//                       ],
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     right: 82,
//                     child: Image.asset(
//                       'assets/images/MY_IMAGE.png',
//                       height: Get.height * 0.8,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MakeIcon extends StatefulWidget {
//   final String path;
//   final String url;
//   const MakeIcon({
//     Key key,
//     @required this.path,
//     @required this.url,
//   }) : super(key: key);

//   @override
//   _MakeIconState createState() => _MakeIconState();
// }

// class _MakeIconState extends State<MakeIcon> {
//   bool isHover = false;

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (event) {
//         setState(() {
//           isHover = true;
//         });
//       },
//       onExit: (event) {
//         setState(() {
//           isHover = false;
//         });
//       },
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 4, vertical: 20),
//         child: Container(
//           height: 35,
//           decoration: isHover
//               ? BoxDecoration(
//                   borderRadius: BorderRadius.circular(50),
//                   boxShadow: [
//                       BoxShadow(
//                         color: Theme.of(context)
//                             .textTheme
//                             .headline1
//                             .color
//                             .withAlpha(20),
//                         blurRadius: 6.0,
//                         spreadRadius: 0.0,
//                         offset: Offset(0.0, 2.0),
//                       ),
//                     ])
//               : BoxDecoration(),
//           child: OutlinedButton(
//             onPressed: () async {
//               Utility().launchURL(widget.url);
//             },
//             style: OutlinedButton.styleFrom(
//               shape: CircleBorder(),
//               side: BorderSide(width: 1.5, color: Colors.green),
//             ),
//             child: SvgPicture.asset(
//               widget.path,
//               height: 16,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ProjectList extends StatelessWidget {
//   final String projName;
//   final String projImage;
//   final String projDesc;
//   final String projUrl;
//   final dynamic techsUsed;
//   final int index;
//   const ProjectList({
//     Key key,
//     this.projName,
//     this.projImage,
//     this.projDesc,
//     this.techsUsed,
//     this.index,
//     this.projUrl,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var img = Stack(
//       clipBehavior: Clip.none,
//       children: [
//         Opacity(
//             child: Padding(
//               padding: const EdgeInsets.all(14.0),
//               child: Image.asset(projImage,
//                   color: Theme.of(context).textTheme.headline1.color),
//             ),
//             opacity: 0.2),
//         ClipRect(
//           child: BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Image.asset(
//                 projImage,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//     var desc = Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           '$projDesc',
//           style: TextStyle(
//             fontSize: 14,
//             color: Theme.of(context).textTheme.headline1.color,
//           ),
//           textAlign: TextAlign.left,
//         ),
//         SizedBox(height: 16),
//         Row(
//           children: List.generate(
//             techsUsed.length,
//             (index) => buildTechUsedList(
//               techsUsed[index]['icon'],
//               techsUsed[index]['name'],
//             ),
//           ),
//         ),
//         SizedBox(height: 20),
//         TextButton(
//           style: ButtonStyle(
//             backgroundColor:
//                 MaterialStateProperty.all<Color>(Color(0xFF37AD6B)),
//             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//               RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//             ),
//           ),
//           // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//           // color: kPrimaryColor,
//           onPressed: () {
//             Utility().launchURL(projUrl);
//           },
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: 22, vertical: 6),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(
//                   Icons.link,
//                   color: Colors.white,
//                 ),
//                 Text(
//                   'VISIT',
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//     return Container(
//       margin: EdgeInsets.all(20),
//       color: Color(0xFF37AD6B).withOpacity(.27),
//       padding: EdgeInsets.all(30),
//       // height: 100,
//       width: double.infinity,
//       child: Column(
//         children: [
//           RatatedContainer(title: '$projName'),
//           SizedBox(height: 16),
//           Column(
//             children: [
//               img,
//               desc,
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Container buildTechUsedList(String img, String name) {
//     return Container(
//       child: Row(
//         children: [
//           IconUsed(
//             img: img,
//             title: '$name',
//           ),
//           SizedBox(width: 10),
//         ],
//       ),
//     );
//   }
// }

// class IconUsed extends StatelessWidget {
//   final String title;
//   final String img;
//   const IconUsed({
//     Key key,
//     @required this.title,
//     @required this.img,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SvgPicture.asset(
//           img,
//           height: 20,
//           color: Theme.of(context).textTheme.headline1.color,
//         ),
//         SizedBox(height: 6),
//         Text(
//           title,
//           style: TextStyle(
//             fontSize: 10,
//             color: Theme.of(context).textTheme.headline1.color,
//             fontWeight: FontWeight.w400,
//           ),
//           textAlign: TextAlign.left,
//         )
//       ],
//     );
//   }
// }

// class BuildHeading extends StatelessWidget {
//   final String title;

//   const BuildHeading({
//     Key key,
//     @required this.context,
//     @required this.title,
//   }) : super(key: key);

//   final BuildContext context;

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       '$title',
//       style: TextStyle(
//         fontSize: 26,
//         color: Theme.of(context).textTheme.headline1.color,
//         fontWeight: FontWeight.w500,
//       ),
//       textAlign: TextAlign.left,
//     );
//   }
// }

// class RatatedContainer extends StatelessWidget {
//   final String title;
//   final bool latoFamily;
//   const RatatedContainer(
//       {Key key, @required this.title, this.latoFamily = false})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Transform(
//       transform: Matrix4.translationValues(0, 2, 0),
//       child: Transform.rotate(
//         angle: -(3.0 * (3.14) / 180.0),
//         child: Container(
//           color: kPrimaryColor,
//           padding: EdgeInsets.all(2),
//           child: Transform.rotate(
//             angle: (3.0 * (3.14) / 180.0),
//             child: Text(
//               '$title',
//               style: TextStyle(
//                 fontFamily: latoFamily ? 'Lato' : null,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
