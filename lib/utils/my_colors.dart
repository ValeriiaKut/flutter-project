import 'dart:ui';

class MyColors {
  static final blackColor = HexColor('#0E0E0E');
  static final whiteColor = HexColor('#FFFFFF');
  static final purpleColor = HexColor('#471AA0');
  static final lilacColor = HexColor('#BB84E8');
  static final violetColor = HexColor('#9747FF');
  static final grayColor = HexColor('##4D000000');
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor){
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if(hexColor.length==6){
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}