// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MainCategoryModel {
  final String? id;
  final String mainCategoryName;
  final String mainCategoryIcon;
  final String createdTime;
  final String updatedTime;
  final int priority;
  final int isActive;
  MainCategoryModel({
    this.id,
    required this.mainCategoryName,
    required this.mainCategoryIcon,
    required this.createdTime,
    required this.updatedTime,
    required this.priority,
    required this.isActive,
  });

  MainCategoryModel copyWith({
    String? id,
    String? mainCategoryName,
    String? mainCategoryIcon,
    String? createdTime,
    String? updatedTime,
    int? priority,
    int? isActive,
  }) {
    return MainCategoryModel(
      id: id ?? this.id,
      mainCategoryName: mainCategoryName ?? this.mainCategoryName,
      mainCategoryIcon: mainCategoryIcon ?? this.mainCategoryIcon,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      priority: priority ?? this.priority,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'mainCategoryName': mainCategoryName,
      'mainCategoryIcon': mainCategoryIcon,
      'createdTime': createdTime,
      'updatedTime': updatedTime,
      'priority': priority,
      'isActive': isActive,
    };
  }

  factory MainCategoryModel.fromMap(Map<String, dynamic> map) {
    return MainCategoryModel(
      id: map['id'] != null ? map['id'] as String : null,
      mainCategoryName: map['mainCategoryName'] as String,
      mainCategoryIcon: map['mainCategoryIcon'] as String,
      createdTime: map['createdTime'] as String,
      updatedTime: map['updatedTime'] as String,
      priority: map['priority'] as int,
      isActive: map['isActive'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory MainCategoryModel.fromJson(String source) =>
      MainCategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MainCategoryModel(id: $id, mainCategoryName: $mainCategoryName, mainCategoryIcon: $mainCategoryIcon, createdTime: $createdTime, updatedTime: $updatedTime, priority: $priority, isActive: $isActive)';
  }

  @override
  bool operator ==(covariant MainCategoryModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.mainCategoryName == mainCategoryName &&
        other.mainCategoryIcon == mainCategoryIcon &&
        other.createdTime == createdTime &&
        other.updatedTime == updatedTime &&
        other.priority == priority &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        mainCategoryName.hashCode ^
        mainCategoryIcon.hashCode ^
        createdTime.hashCode ^
        updatedTime.hashCode ^
        priority.hashCode ^
        isActive.hashCode;
  }
}
