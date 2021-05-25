import 'package:flutter/material.dart';

import '../constants.dart';

class IntroLogo extends StatelessWidget {
  const IntroLogo({
    Key key,
    @required Animation iconColorTween,
  })  : _iconColorTween = iconColorTween,
        super(key: key);

  final Animation _iconColorTween;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Text.rich(
        TextSpan(
          text: 'nryn',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: _iconColorTween.value,
            // color: Theme.of(context).textTheme.headline1.color,
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
    );
  }
}
