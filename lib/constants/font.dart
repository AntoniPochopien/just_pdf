import 'package:flutter/material.dart';

class Font {
  //regular base
  static const _baseDark = TextStyle();

  //sizes
  static const _h2 = 24.0;
  static const _h4 = 20.0;
  static const _h5 = 14.0;

  //dark
  static final h2Dark = _baseDark.copyWith(fontSize: _h2);
  static final h4Dark = _baseDark.copyWith(fontSize: _h4);
  static final h5Dark = _baseDark.copyWith(fontSize: _h5);

  //dark bold
  static final h2DarkBold =
      _baseDark.copyWith(fontSize: _h2, fontWeight: FontWeight.bold);
  static final h4DarkBold = _baseDark.copyWith(fontSize: _h4, fontWeight: FontWeight.bold);
  static final h5DarkBold =
      _baseDark.copyWith(fontSize: _h5, fontWeight: FontWeight.bold);
}
