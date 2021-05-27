import 'package:flutter/widgets.dart';

class SizeConfig {
  static double _screenWidth;
  static double _screenHeight;
  static double _blockWidth = 0;
  static double _blockHeight = 0;

  static double textMultiplier;
  static double imageSizeMultiplier;
  static double heightMultiplier;
  static double widthMultiplier;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  static MediaQueryData _mediaQuery;
  static Orientation orientation;

  void init(BuildContext context) {
    _mediaQuery = MediaQuery.of(context);
    if (orientation == Orientation.portrait) {
      _screenWidth = _mediaQuery.size.width;
      _screenHeight = _mediaQuery.size.height;
      isPortrait = true;
      if (_screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      _screenWidth = _mediaQuery.size.width;
      _screenHeight = _mediaQuery.size.height;
      isPortrait = false;
      isMobilePortrait = false;
    }

    _blockWidth = _screenWidth / 100;
    _blockHeight = _screenHeight / 100;

    textMultiplier = _blockHeight;
    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;

    print(_screenWidth);
  }
}
