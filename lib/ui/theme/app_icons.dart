import 'package:flutter/material.dart';

abstract class AppIcons {
  static const IconData home = Icons.home_outlined;
  static const IconData shop = Icons.shopping_cart_outlined;
  static const IconData gift = Icons.card_giftcard_rounded;
  static const IconData car = Icons.local_taxi_outlined;
  static const IconData web = Icons.public_outlined;
  static const IconData beach = Icons.beach_access_outlined;

  static const String homeIcon = 'home';
  static const String shopIcon = 'shop';
  static const String giftIcon = 'gift';
  static const String carIcon = 'car';
  static const String webIcon = 'web';
  static const String beachIcon = 'beach';

  static const Map<String, IconData> appIcons = {
    homeIcon : home,
    shopIcon : shop,
    giftIcon : gift,
    carIcon : car,
    webIcon : web,
    beachIcon : beach,
  };
}
