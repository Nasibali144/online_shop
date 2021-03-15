import 'package:flutter/material.dart';
import 'package:online_shop/pages/registration_with_phone.dart';
import 'package:online_shop/utils/strings.dart';

class IntroPage extends StatefulWidget {
  static final String id = 'intro_page';

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            alignment: Alignment.centerRight,
            width: double.infinity,
            padding: EdgeInsets.only(
              top: 50,
              right: 30,
            ),
            child: Text(
              "O'zbek",
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
          ),

          //
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  currentIndex = page;
                });
              },
              children: [
                makePage(
                  image: 'assets/images/intro_1.jpg',
                  content: Strings.stepOneContent,
                  title: Strings.stepOneTitle,
                ),
                makePage(
                  image: 'assets/images/intro_2.jpg',
                  content: Strings.stepTwoContent,
                  title: Strings.stepTwoTitle,
                ),
                makePage(
                  image: 'assets/images/intro_3.jpg',
                  content: Strings.stepThreeContent,
                  title: Strings.stepThreeTitle,
                ),
              ],
            ),
          ),
          //

          Container(
            height: 70,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.grey[50],
                border: Border.symmetric(vertical: BorderSide())),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: currentIndex != 2 ? Text(
                  "O'TKAZIB YUBORISH",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ) : SizedBox.shrink(),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildIndicator(),
                  ),
                ),
                Expanded(
                  child: currentIndex != 2 ? IconButton(
                    padding: EdgeInsets.only(right: 15),
                    alignment: Alignment.centerRight,
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      // Sign in pagega o'tadi
                    },
                  ) : GestureDetector(
                    child: Text(
                      "KEYINGI",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      textAlign: TextAlign.right,
                    ),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, RegistrationPage.id);
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget makePage({image, title, content}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(image),
          fit: BoxFit.cover,
          height: 250,
        ),
        SizedBox(
          height: 80,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w200),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            content,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(microseconds: 300),
      height: 6,
      width: isActive ? 20 : 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(5)),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}
