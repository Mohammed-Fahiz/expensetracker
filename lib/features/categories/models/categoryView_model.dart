// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:expensetracker/features/categories/models/category_model.dart';
import 'package:expensetracker/models/icon_models/iconData_model.dart';

class CategoryViewModel {
  final CategoryModel category;
  final IconDataModel? icon;

  CategoryViewModel({
    required this.category,
    this.icon,
  });

  CategoryViewModel copyWith({
    CategoryModel? category,
    IconDataModel? icon,
  }) {
    return CategoryViewModel(
      category: category ?? this.category,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'category': category.toMap(),
      'icon': icon?.toMap(),
    };
  }

  factory CategoryViewModel.fromMap(Map<String, dynamic> map) {
    return CategoryViewModel(
      category: CategoryModel.fromMap(map['category'] as Map<String, dynamic>),
      icon: map['icon'] != null
          ? IconDataModel.fromMap(map['icon'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryViewModel.fromJson(String source) =>
      CategoryViewModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CategoryViewModel(category: $category, icon: $icon)';

  @override
  bool operator ==(covariant CategoryViewModel other) {
    if (identical(this, other)) return true;

    return other.category == category && other.icon == icon;
  }

  @override
  int get hashCode => category.hashCode ^ icon.hashCode;
}
