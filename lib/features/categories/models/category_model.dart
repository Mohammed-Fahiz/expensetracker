// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CategoryModel {
  final String categoryName;
  final String categoryIcon;
  final String mainCategoryId;
  final String createdTime;
  final String updatedTime;
  final int priority;
  final int isActive;
  CategoryModel({
    required this.categoryName,
    required this.categoryIcon,
    required this.mainCategoryId,
    required this.createdTime,
    required this.updatedTime,
    required this.priority,
    required this.isActive,
  });

  CategoryModel copyWith({
    String? categoryName,
    String? categoryIcon,
    String? mainCategoryId,
    String? createdTime,
    String? updatedTime,
    int? priority,
    int? isActive,
  }) {
    return CategoryModel(
      categoryName: categoryName ?? this.categoryName,
      categoryIcon: categoryIcon ?? this.categoryIcon,
      mainCategoryId: mainCategoryId ?? this.mainCategoryId,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      priority: priority ?? this.priority,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryName': categoryName,
      'categoryIcon': categoryIcon,
      'mainCategoryId': mainCategoryId,
      'createdTime': createdTime,
      'updatedTime': updatedTime,
      'priority': priority,
      'isActive': isActive,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      categoryName: map['categoryName'] as String,
      categoryIcon: map['categoryIcon'] as String,
      mainCategoryId: map['mainCategoryId'] as String,
      createdTime: map['createdTime'] as String,
      updatedTime: map['updatedTime'] as String,
      priority: map['priority'] as int,
      isActive: map['isActive'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CategoryModel(categoryName: $categoryName, categoryIcon: $categoryIcon, mainCategoryId: $mainCategoryId, createdTime: $createdTime, updatedTime: $updatedTime, priority: $priority, isActive: $isActive)';
  }

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;

    return other.categoryName == categoryName &&
        other.categoryIcon == categoryIcon &&
        other.mainCategoryId == mainCategoryId &&
        other.createdTime == createdTime &&
        other.updatedTime == updatedTime &&
        other.priority == priority &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return categoryName.hashCode ^
        categoryIcon.hashCode ^
        mainCategoryId.hashCode ^
        createdTime.hashCode ^
        updatedTime.hashCode ^
        priority.hashCode ^
        isActive.hashCode;
  }
}
