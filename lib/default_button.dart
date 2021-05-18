import 'package:flutter/material.dart';

import 'constants.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function press;
  const DefaultButton({
    Key key,
    this.press,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(kSecondaryColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      // color: kPrimaryColor,
      onPressed: press,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 8),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
