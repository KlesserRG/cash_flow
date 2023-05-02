import 'package:flutter/material.dart';
import 'package:text_rpg_two/ui/theme/images.dart';
import 'package:text_rpg_two/ui/theme/seasons/seasons_path.dart';

abstract class Seasons {
  static final Map<String, Season> allSeasons = {
    SeasonsPath.spring: const Season(
      index: 0,
      mainColor: Colors.pink,
      secondColor: Colors.amber,
      imgUrl: Images.springBG,
    ),
    SeasonsPath.summer: const Season(
      index: 1,
      mainColor: Colors.green,
      secondColor: Colors.lime,
      imgUrl: Images.summerBG,
    ),
    SeasonsPath.autumn: const Season(
      index: 2,
      mainColor: Colors.red,
      secondColor: Colors.brown,
      imgUrl: Images.autumBG,
    ),
    SeasonsPath.winter: const Season(
      index: 3,
      mainColor: Colors.cyan,
      secondColor: Colors.blueGrey,
      imgUrl: Images.winterBG,
    ),
  };
}

class Season {
  final int index;
  final Color mainColor;
  final Color secondColor;
  final String imgUrl;
  const Season({
    required this.index,
    required this.mainColor,
    required this.imgUrl,
    this.secondColor = Colors.black,
  });
}
