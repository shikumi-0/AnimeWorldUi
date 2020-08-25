import 'package:flutter/material.dart';
import 'animation/fadeAnimation.dart';
import 'package:page_transition/page_transition.dart';
import 'homePage.dart';

class StarterPage extends StatefulWidget {
  @override
  _StarterPageState createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;
  bool _textVisible = true;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    _animation = Tween<double>(
      begin: 1.0,
      end: 25.0,
    ).animate(_animationController);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTap() {
    setState(() {
      _textVisible = false;
    });
    _animationController.forward().then((f) => Navigator.pushReplacement(
        context,
        PageTransition(child: HomePage(), type: PageTransitionType.fade)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/222.jpg'), fit: BoxFit.cover),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.7),
                Colors.black.withOpacity(0.3)
              ],
              begin: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                  child: FadeAnimation(
                    1,
                    Text(
                      'Welcome Otaku!!',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 100, 0),
                  child: FadeAnimation(
                    1.3,
                    Text(
                      'Hope you find everything you have been searching for..',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 20,
                          height: 1.5),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                FadeAnimation(
                    1,
                    ScaleTransition(
                      scale: _animation,
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
                              _onTap();
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
                    )),
                SizedBox(
                  height: 30,
                ),
                FadeAnimation(
                  2.2,
                  Text(
                    'Omae wa mō shinde iru',
                    style: TextStyle(color: Colors.white.withOpacity(0.8)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
