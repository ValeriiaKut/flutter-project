import 'dart:ui';

class MyColors {
  static final blackColor = HexColor('#0E0E0E');
  static final whiteColor = HexColor('#FFFFFF');
  static final purpleColor = HexColor('#471AA0');
  static final lilacColor = HexColor('#BB84E8');
  static final violetColor = HexColor('#9747FF');
  static final grayColor = HexColor('##4D000000');
  static final peachColor = HexColor('#FFDAB9');
  static final blueColor = HexColor('#B0E0E6');
  static final pinkColor = HexColor('#FFC0CB');
  static final lemonColor = HexColor('#FFFACD');
  static final coralColor = HexColor('#F4A896');
  static final petuniaColor = HexColor('#E0BBE4');
  static final greenColor = HexColor('#D8F3DC');
  static final lightColor = HexColor('#F7E4E4');
  static final granyColor = HexColor('#F5F5F5');
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