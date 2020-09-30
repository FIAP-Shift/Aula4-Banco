import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget buildSvgIcon(String path) => SvgPicture.asset(
  path,
  width: 48,
  height: 48,
);