// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TagModel {
  final int? id;
  final String tagName;
  final String? tagFor;
  final String createdTime;
  final String updatedTime;
  final int isActive;
  TagModel({
    this.id,
    required this.tagName,
    this.tagFor,
    required this.createdTime,
    required this.updatedTime,
    required this.isActive,
  });

  TagModel copyWith({
    int? id,
    String? tagName,
    String? tagFor,
    String? createdTime,
    String? updatedTime,
    int? isActive,
  }) {
    return TagModel(
      id: id ?? this.id,
      tagName: tagName ?? this.tagName,
      tagFor: tagFor ?? this.tagFor,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'tagName': tagName,
      'tagFor': tagFor,
      'createdTime': createdTime,
      'updatedTime': updatedTime,
      'isActive': isActive,
    };
  }

  factory TagModel.fromMap(Map<String, dynamic> map) {
    return TagModel(
      id: map['id'] != null ? map['id'] as int : null,
      tagName: map['tagName'] as String,
      tagFor: map['tagFor'] != null ? map['tagFor'] as String : null,
      createdTime: map['createdTime'] as String,
      updatedTime: map['updatedTime'] as String,
      isActive: map['isActive'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TagModel.fromJson(String source) =>
      TagModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TagModel(id: $id, tagName: $tagName, tagFor: $tagFor, createdTime: $createdTime, updatedTime: $updatedTime, isActive: $isActive)';
  }

  @override
  bool operator ==(covariant TagModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.tagName == tagName &&
        other.tagFor == tagFor &&
        other.createdTime == createdTime &&
        other.updatedTime == updatedTime &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        tagName.hashCode ^
        tagFor.hashCode ^
        createdTime.hashCode ^
        updatedTime.hashCode ^
        isActive.hashCode;
  }
}
