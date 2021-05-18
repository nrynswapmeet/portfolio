import 'package:get/get.dart';

class ProjectController extends GetxController {
  var projects = [].obs;

  @override
  void onInit() {
    projects.assignAll([
      {
        "img": 'assets/images/lime_logo.png',
        "title": 'LimeLi8',
        'desc':
            'Mr.Dhobi-G provides you with the greatest laundry experience you can ever have. Mr.Dhobi-G helps you to find the nearby laundry or the laundry of your choice In Local Area.',
        'techList': 'JAVA - XML - FIREBASE - SKETCH - PHOTOSHOP',
        'color': '0xD7222222'
      },
      {
        "img": 'assets/images/lime_logo.png',
        "title": 'LimeLi',
        'desc':
            'Mr.Dhobi-G provides you with the greatest laundry experience you can ever have. Mr.Dhobi-G helps you to find the nearby laundry or the laundry of your choice In Local Area.',
        'techList': 'JAVA - XML - FIREBASE - SKETCH - PHOTOSHOP',
        'color': '0xD7222222'
      },
    ]);
    super.onInit();
  }
}
