import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TIcons {
  static IconData getIcon(String iconName) {
    switch (iconName) {
      case 'qrcode':
        return Icons.qr_code_2_outlined;
      case 'card':
        return Iconsax.card;
      case 'facilities':
        return Iconsax.building;
      case 'fare':
        return Iconsax.money_2;
      case 'map':
        return Iconsax.map;
      case 'offers':
        return Iconsax.gift;
      case 'mile':
        return Icons.travel_explore;
      case 'chart':
        return Iconsax.chart;
      case 'home':
        return Iconsax.home;
      case 'history':
        return Iconsax.clock;
      case 'order':
        return Iconsax.receipt;
      case 'user':
        return Iconsax.user;
      default:
        return Icons.error;
    }
  }
}
