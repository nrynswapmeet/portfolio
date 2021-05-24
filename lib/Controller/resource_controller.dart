import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:laxminarayan_portfolio/Model/project.dart';

class ResourceController extends GetxController {
  var projectsList = <Project>[].obs;

  getProjects() async {
    var url = Uri.parse(
        'https://raw.githubusercontent.com/laxminarayan1998/portfolio_data/main/api_data.json');

    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as List;
      projectsList.clear();
      extractedData.forEach((element) {
        projectsList.add(Project(
          projName: element['projName'],
          projDesc: element['projDesc'],
          projImage: element['projImage'],
          projUrl: element['projUrl'],
          tech: element['techsUsed'],
        ));
      });
      projectsList.refresh();
    } catch (error) {
      print(error.toString());
    }
  }

  var socialLinks = [
    {
      'icon': 'assets/icons/facebook_icon.svg',
      'url': 'https://www.facebook.com/laxminarayan1998/'
    },
    {
      'icon': 'assets/icons/instagram_icon.svg',
      'url': 'https://www.instagram.com/laxminarayan_1998/'
    },
    {
      'icon': 'assets/icons/github_icon.svg',
      'url': 'https://github.com/laxminarayan1998'
    },
    {
      'icon': 'assets/icons/linkedin_icon.svg',
      'url': 'https://www.linkedin.com/in/laxminarayan1998/'
    },
    {
      'icon': 'assets/icons/youtube_icon.svg',
      'url': 'https://www.youtube.com/c/LaxminarayanDas'
    },
  ].obs;
  // var projectsList = [
  //   {
  //     'projName': 'Laxminarayan Portfolio',
  //     'projImage': 'assets/images/laxminarayan_portfolio_img.png',
  //     'projUrl': '',
  //     'projDesc':
  //         'This very website you\'re now watching. I wanted something fast and with good SEO for my portfolio, so a static website generator like Gatsby seemed like the best fit. It reads data from markdown files, so it\'s super easy for me to keep adding Portfolio items as I keep developing stuff. It also has a cool dark mode switch since I couldn\'t decide between a dark or light design.',
  //     'techsUsed': [
  //       {
  //         'icon': 'assets/icons/flutter_icon.svg',
  //         'name': 'FLUTTER',
  //       },
  //       {
  //         'icon': 'assets/icons/firebase_icon.svg',
  //         'name': 'FIREBASE',
  //       },
  //       {
  //         'icon': 'assets/icons/dart_icon.svg',
  //         'name': 'DART',
  //       },
  //       {
  //         'icon': 'assets/icons/sketch_icon.svg',
  //         'name': 'SKETCH',
  //       },
  //     ]
  //   },
  //   {
  //     'projName': 'My Manager (Trag Sales4you)',
  //     'projImage': 'assets/images/my_manager.png',
  //     'projUrl':
  //         'https://play.google.com/store/apps/details?id=com.nryn.tragsales4you',
  //     'projDesc':
  //         'A Hotel Management Solution called My Manager. It helps you track each and every sales and expense report, increases profitability but also makes operations more efficient while you are enjoying your good coffee at home.',
  //     'techsUsed': [
  //       {
  //         'icon': 'assets/icons/flutter_icon.svg',
  //         'name': 'FLUTTER',
  //       },
  //       {
  //         'icon': 'assets/icons/firebase_icon.svg',
  //         'name': 'FIREBASE',
  //       },
  //       {
  //         'icon': 'assets/icons/dart_icon.svg',
  //         'name': 'DART',
  //       },
  //       {
  //         'icon': 'assets/icons/xd_iocn.svg',
  //         'name': 'ADOBE XD',
  //       },
  //     ]
  //   },
  //   {
  //     'projName': 'Bubbles Water Delivery',
  //     'projImage': 'assets/images/bubbles_water.png',
  //     'projUrl':
  //         'https://play.google.com/store/apps/details?id=com.bubblebbsr.bubble_client',
  //     'projDesc':
  //         'It is an app through which customers/Dealers can place orders of water bottles. Then the admin receives the order and assigns it to its delivery boy in the delivery app.',
  //     'techsUsed': [
  //       {
  //         'icon': 'assets/icons/flutter_icon.svg',
  //         'name': 'FLUTTER',
  //       },
  //       {
  //         'icon': 'assets/icons/firebase_icon.svg',
  //         'name': 'FIREBASE',
  //       },
  //       {
  //         'icon': 'assets/icons/dart_icon.svg',
  //         'name': 'DART',
  //       },
  //       {
  //         'icon': 'assets/icons/xd_iocn.svg',
  //         'name': 'ADOBE XD',
  //       },
  //     ]
  //   }
  // ].obs;
}
