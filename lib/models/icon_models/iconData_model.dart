// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class IconDataModel {
  final String name;
  final IconData icon;
  IconDataModel({
    required this.name,
    required this.icon,
  });

  IconDataModel copyWith({
    String? name,
    IconData? icon,
  }) {
    return IconDataModel(
      name: name ?? this.name,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'icon': icon.codePoint,
    };
  }

  factory IconDataModel.fromMap(Map<String, dynamic> map) {
    return IconDataModel(
      name: map['name'] as String,
      icon: IconData(map['icon'] as int, fontFamily: 'MaterialIcons'),
    );
  }

  String toJson() => json.encode(toMap());

  factory IconDataModel.fromJson(String source) =>
      IconDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'IconDataModel(name: $name, icon: $icon)';

  @override
  bool operator ==(covariant IconDataModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.icon == icon;
  }

  @override
  int get hashCode => name.hashCode ^ icon.hashCode;
}
