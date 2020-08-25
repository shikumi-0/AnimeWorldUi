import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'animation/fadeAnimation.dart';
import 'anime.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectCategory = 'Shonen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        leading: Icon(null),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.account_circle,
                color: Colors.black,
              ),
              onPressed: () {})
        ],
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10),
                FadeAnimation(
                  1,
                  Text(
                    'Anime World',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      FadeAnimation(1, animeCategory('Shonen')),
                      FadeAnimation(
                          1.2,
                          animeCategory(
                            'Ecchi',
                          )),
                      FadeAnimation(
                          1.4,
                          animeCategory(
                            'Harem',
                          )),
                      FadeAnimation(1.6, animeCategory('Isekai')),
                    ],
                  ),
                ),
                SizedBox(height: 20)
              ],
            ),
          ),
          FadeAnimation(
              1,
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Free anime',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]),
                ),
              )),
          Expanded(
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    FadeAnimation(
                        .4,
                        Anime(
                            image: 'assets/images/four.jpg',
                            animeName: 'My Hero\nAcademia')),
                    FadeAnimation(
                        .4,
                        Anime(
                            image: 'assets/images/eight.jpg',
                            animeName: 'Naruto')),
                    FadeAnimation(
                        .4,
                        Anime(
                            image: 'assets/images/seven.jpg',
                            animeName: 'JoJo\'s Bizarre\nAdventure')),
                    FadeAnimation(
                        .4,
                        Anime(
                            image: 'assets/images/123.jpg',
                            animeName: 'Dragon Ball\nSuper')),
                    FadeAnimation(
                        .4,
                        Anime(
                            image: 'assets/images/twelve.jpg',
                            animeName: 'One Piece')),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      )),
    );
  }

  animeCategory(title) {
    return AspectRatio(
      aspectRatio: switchAspectRatio(title),
      child: InkWell(
        onTap: () {
          selectedCategory(title);
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: switchBoxColor(title),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Container(
            child: MaterialButton(
              elevation: 10.0,
              child: Text(
                title,
                style: switchTextStyle(title),
                textAlign: TextAlign.center,
              ),
//              onPressed: () {
//                selectedCategory(title);
//              },
            ),
          ),
        ),
      ),
    );
  }

  selectedCategory(categoryName) {
    setState(() {
      selectCategory = categoryName;
    });
  }

  switchAspectRatio(categoryName) {
    if (categoryName == selectCategory) {
      return 3 / 1;
    } else {
      return 27 / 10;
    }
  }

  switchBoxColor(categoryName) {
    if (categoryName == selectCategory) {
      return Colors.yellow[700];
    } else {
      return Colors.white;
    }
  }

  switchTextStyle(categoryName) {
    if (categoryName == selectCategory) {
      return TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
    } else {
      return TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w400);
    }
  }
}
