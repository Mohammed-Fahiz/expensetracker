// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class IconDataModel {
  final int? id;
  final String iconCategory;
  final String name;
  final int iconCodePoint;
  final String iconFontFamily;

  IconDataModel({
    this.id,
    required this.iconCategory,
    required this.name,
    required this.iconCodePoint,
    required this.iconFontFamily,
  });

  IconDataModel copyWith({
    int? id,
    String? iconCategory,
    String? name,
    int? iconCodePoint,
    String? iconFontFamily,
  }) {
    return IconDataModel(
      id: id ?? this.id,
      iconCategory: iconCategory ?? this.iconCategory,
      name: name ?? this.name,
      iconCodePoint: iconCodePoint ?? this.iconCodePoint,
      iconFontFamily: iconFontFamily ?? this.iconFontFamily,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'iconCategory': iconCategory,
      'name': name,
      'iconCodePoint': iconCodePoint,
      'iconFontFamily': iconFontFamily,
    };
  }

  factory IconDataModel.fromMap(Map<String, dynamic> map) {
    return IconDataModel(
      id: map['id'] != null ? map['id'] as int : null,
      iconCategory: map['iconCategory'] as String,
      name: map['name'] as String,
      iconCodePoint: map['iconCodePoint'] as int,
      iconFontFamily: map['iconFontFamily'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory IconDataModel.fromJson(String source) =>
      IconDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'IconDataModel(id: $id, iconCategory: $iconCategory, name: $name, iconCodePoint: $iconCodePoint, iconFontFamily: $iconFontFamily)';
  }

  @override
  bool operator ==(covariant IconDataModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.iconCategory == iconCategory &&
        other.name == name &&
        other.iconCodePoint == iconCodePoint &&
        other.iconFontFamily == iconFontFamily;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        iconCategory.hashCode ^
        name.hashCode ^
        iconCodePoint.hashCode ^
        iconFontFamily.hashCode;
  }
}
