import 'dart:async';
import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  double size;
  List<String> images;
  List<String> texts;

  SliderWidget({@required this.images, this.texts, @required this.size});

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  PageController _pageController =
  PageController(initialPage: 1);
  int _currentIndex = 0;
  List _images;
  List _text;
  Timer _timer;
  double _size;

  @override
  void initState() {
    setState(() {
      _images = widget.images;
      _text = widget.texts;
      _size = widget.size;
    });
    print(_images.asMap());
    if (_images.length > 0) {
      _setTimer();
    }
    super.initState();
  }

  _setTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 1500), (_) {
      _pageController.animateToPage(
        _currentIndex + 1,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    List addedImages = [];
    if (_images.length > 0) {
      addedImages
        ..add(_images[_images.length - 1])
        ..addAll(_images)
        ..add(_images[0]);
    }
    return AspectRatio(
      aspectRatio: _size != null ? _size: 16 / 9,
      child: Stack(
        children: [
          NotificationListener(
            onNotification: (ScrollNotification notification) {
              if (notification.depth == 0 &&
                  notification is ScrollStartNotification) {
                if (notification.dragDetails != null) {
                  _timer.cancel();
                }
              } else if (notification is ScrollEndNotification) {
                _timer.cancel();
                _setTimer();
              }
              return true;
            },
            child: _images.length > 0
                ? PageView(
              physics: BouncingScrollPhysics(),
              controller: _pageController,
              onPageChanged: (page) {
                int newIndex;
                if (page == addedImages.length - 1) {
                  newIndex = 1;
                  _pageController.jumpToPage(newIndex);
                } else if (page == 0) {
                  newIndex = addedImages.length - 2;
                  _pageController.jumpToPage(newIndex);
                } else {
                  newIndex = page;
                }
                setState(() {
                  _currentIndex = newIndex;
                });
              },
              children: addedImages
                  .map((item) => Container(
                //margin: EdgeInsets.all(10),
                height: double.infinity,

                child: Container(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image(
                        image: AssetImage(item),
                        //fit: BoxFit.cover,
                      )
                  ),
                ),
              ))
                  .toList(),
            )
                : Container(),
          ),
          Positioned(
            bottom: 15,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _images
                  .asMap()
                  .map((i, v) => MapEntry(
                  i,
                  Container(
                    width: 6,
                    height: 6,
                    margin: EdgeInsets.only(left: 2, right: 2),
                    decoration: ShapeDecoration(
                      color: _currentIndex == i + 1
                          ? Colors.red
                          : Colors.white,
                      shape: CircleBorder(),
                    ),
                  )))
                  .values
                  .toList(),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

