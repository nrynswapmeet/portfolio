import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:laxminarayan_portfolio/Controller/theme_controller.dart';

class DarkButton extends StatelessWidget {
  final ThemeController themeController = Get.find();
  DarkButton({
    Key key,
    @required Animation iconColorTween,
  })  : _iconColorTween = iconColorTween,
        super(key: key);

  final Animation _iconColorTween;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        'assets/icons/Icon awesome-moon.svg',
        color: _iconColorTween.value,
      ),
      onPressed: () {
        if (themeController.isDark.value) {
          themeController.isDark.value = false;
          Get.changeThemeMode(ThemeMode.light);
        } else {
          themeController.isDark.value = true;
          Get.changeThemeMode(ThemeMode.dark);
        }
      },
    );
  }
}
