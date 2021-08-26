import 'dart:ui';

import 'package:magic/style/color.dart';
import 'package:magic/style/size.dart';
import 'package:magic/style/theme.dart';

var magicTheme = MagicTheme(magicColor: magicColor, magicSize: magicSize);

var magicSize = MagicSize(tBase: 14, xBase: 12);
var magicColor = MagicColor(
    red: const Color(0xFFF15E27),
    colorful: const Color(0xFF3165D5),
    black: const Color(0xFF262D40),
    highlight: const Color(0xFF20BFC3),
    white: const Color(0xFFF3F5F7),
    colorfulReverse: false);
