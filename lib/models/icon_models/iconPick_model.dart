// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:expensetracker/models/icon_models/iconData_model.dart';

class IconPickModel {
  final String category;
  final List<IconDataModel> icons;
  IconPickModel({
    required this.category,
    required this.icons,
  });

  IconPickModel copyWith({
    String? category,
    List<IconDataModel>? icons,
  }) {
    return IconPickModel(
      category: category ?? this.category,
      icons: icons ?? this.icons,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'category': category,
      'icons': icons.map((x) => x.toMap()).toList(),
    };
  }

  factory IconPickModel.fromMap(Map<String, dynamic> map) {
    return IconPickModel(
      category: map['category'] as String,
      icons: List<IconDataModel>.from(
        (map['icons'] as List<int>).map<IconDataModel>(
          (x) => IconDataModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory IconPickModel.fromJson(String source) =>
      IconPickModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'IconPickModel(category: $category, icons: $icons)';

  @override
  bool operator ==(covariant IconPickModel other) {
    if (identical(this, other)) return true;

    return other.category == category && listEquals(other.icons, icons);
  }

  @override
  int get hashCode => category.hashCode ^ icons.hashCode;
}
