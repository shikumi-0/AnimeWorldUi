import 'package:flutter/material.dart';
import 'package:app_102/animation/fadeAnimation.dart';

class BuildStarterButton extends StatelessWidget {
  final Animation<double> animation;
  final Function onTap;
  BuildStarterButton({this.animation, this.onTap});
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      1,
      ScaleTransition(
        scale: animation,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(colors: [
              Colors.yellow,
              Colors.orange,
            ]),
          ),
          child: FadeAnimation(
            2,
            MaterialButton(
              focusElevation: 10.0,
              onPressed: () {
                onTap();
              },
              minWidth: double.infinity,
              child: Text(
                'Let\'s Go!!',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
