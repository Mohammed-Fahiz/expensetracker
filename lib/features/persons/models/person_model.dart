// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PersonModel {
  final int? id;
  final String name;
  final String notes;
  final String createdTime;
  final String updatedTime;
  final int isActive;
  PersonModel({
    this.id,
    required this.name,
    required this.notes,
    required this.createdTime,
    required this.updatedTime,
    required this.isActive,
  });

  PersonModel copyWith({
    int? id,
    String? name,
    String? notes,
    String? createdTime,
    String? updatedTime,
    int? isActive,
  }) {
    return PersonModel(
      id: id ?? this.id,
      name: name ?? this.name,
      notes: notes ?? this.notes,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'notes': notes,
      'createdTime': createdTime,
      'updatedTime': updatedTime,
      'isActive': isActive,
    };
  }

  factory PersonModel.fromMap(Map<String, dynamic> map) {
    return PersonModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      notes: map['notes'] as String,
      createdTime: map['createdTime'] as String,
      updatedTime: map['updatedTime'] as String,
      isActive: map['isActive'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonModel.fromJson(String source) =>
      PersonModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PersonModel(id: $id, name: $name, notes: $notes, createdTime: $createdTime, updatedTime: $updatedTime, isActive: $isActive)';
  }

  @override
  bool operator ==(covariant PersonModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.notes == notes &&
        other.createdTime == createdTime &&
        other.updatedTime == updatedTime &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        notes.hashCode ^
        createdTime.hashCode ^
        updatedTime.hashCode ^
        isActive.hashCode;
  }
}
