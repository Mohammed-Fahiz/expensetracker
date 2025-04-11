// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CategoryModel {
  final int? id;
  final String categoryName;
  final String iconCodePoint;
  final String iconFamily;
  final String createdTime;
  final String updatedTime;
  final int priority;
  final int isActive;
  CategoryModel({
    this.id,
    required this.categoryName,
    required this.iconCodePoint,
    required this.iconFamily,
    required this.createdTime,
    required this.updatedTime,
    required this.priority,
    required this.isActive,
  });

  CategoryModel copyWith({
    int? id,
    String? categoryName,
    String? iconCodePoint,
    String? iconFamily,
    String? createdTime,
    String? updatedTime,
    int? priority,
    int? isActive,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      categoryName: categoryName ?? this.categoryName,
      iconCodePoint: iconCodePoint ?? this.iconCodePoint,
      iconFamily: iconFamily ?? this.iconFamily,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      priority: priority ?? this.priority,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'categoryName': categoryName,
      'iconCodePoint': iconCodePoint,
      'iconFamily': iconFamily,
      'createdTime': createdTime,
      'updatedTime': updatedTime,
      'priority': priority,
      'isActive': isActive,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] != null ? map['id'] as int : null,
      categoryName: map['categoryName'] as String,
      iconCodePoint: map['iconCodePoint'] as String,
      iconFamily: map['iconFamily'] as String,
      createdTime: map['createdTime'] as String,
      updatedTime: map['updatedTime'] as String,
      priority: map['priority'] as int,
      isActive: map['isActive'] as int,
    );
  }

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.categoryName == categoryName &&
        other.iconCodePoint == iconCodePoint &&
        other.iconFamily == iconFamily &&
        other.createdTime == createdTime &&
        other.updatedTime == updatedTime &&
        other.priority == priority &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        categoryName.hashCode ^
        iconCodePoint.hashCode ^
        iconFamily.hashCode ^
        createdTime.hashCode ^
        updatedTime.hashCode ^
        priority.hashCode ^
        isActive.hashCode;
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CategoryModel(id: $id, categoryName: $categoryName, iconCodePoint: $iconCodePoint, iconFamily: $iconFamily, createdTime: $createdTime, updatedTime: $updatedTime, priority: $priority, isActive: $isActive)';
  }
}
