import 'package:expensetracker/models/icon_models/iconData_model.dart';
import 'package:expensetracker/models/icon_models/iconPick_model.dart';
import 'package:line_icons/line_icons.dart';

class IconDataContants {
  static List<IconPickModel> iconPickList = [
    IconPickModel(
      category: 'Entertainment',
      icons: [
        IconDataModel(name: 'Movie', icon: LineIcons.film),
        IconDataModel(name: 'TV', icon: LineIcons.television),
        IconDataModel(name: 'Music', icon: LineIcons.music),
        IconDataModel(name: 'Game', icon: LineIcons.gamepad),
      ],
    ),
    IconPickModel(
      category: 'Food & Drink',
      icons: [
        IconDataModel(name: 'Food', icon: LineIcons.utensils),
        IconDataModel(name: 'Coffee', icon: LineIcons.coffee),
        IconDataModel(name: 'Beer', icon: LineIcons.beer),
      ],
    ),
    IconPickModel(
      category: 'Shopping',
      icons: [
        IconDataModel(name: 'Shopping', icon: LineIcons.shoppingBag),
        IconDataModel(name: 'Shopping2', icon: LineIcons.shoppingCart),
        IconDataModel(name: 'Gift', icon: LineIcons.gift),
      ],
    ),
    IconPickModel(
      category: 'Travel',
      icons: [
        IconDataModel(name: 'Plane', icon: LineIcons.plane),
        IconDataModel(name: 'Hotel', icon: LineIcons.hotel),
        IconDataModel(name: 'Map', icon: LineIcons.mapMarked),
      ],
    ),
  ];
}
