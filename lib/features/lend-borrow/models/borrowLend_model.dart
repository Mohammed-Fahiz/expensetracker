// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BorrowLendModel {
  final int? id;
  final String personId;
  final double amount;
  final String note;
  final int type;
  final String? tag;
  final String createdTime;
  final String updatedTime;
  BorrowLendModel({
    this.id,
    required this.personId,
    required this.amount,
    required this.note,
    required this.type,
    this.tag,
    required this.createdTime,
    required this.updatedTime,
  });

  BorrowLendModel copyWith({
    int? id,
    String? personId,
    double? amount,
    String? note,
    int? type,
    String? tag,
    String? createdTime,
    String? updatedTime,
  }) {
    return BorrowLendModel(
      id: id ?? this.id,
      personId: personId ?? this.personId,
      amount: amount ?? this.amount,
      note: note ?? this.note,
      type: type ?? this.type,
      tag: tag ?? this.tag,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'personId': personId,
      'amount': amount,
      'note': note,
      'type': type,
      'tag': tag,
      'createdTime': createdTime,
      'updatedTime': updatedTime,
    };
  }

  factory BorrowLendModel.fromMap(Map<String, dynamic> map) {
    return BorrowLendModel(
      id: map['id'] != null ? map['id'] as int : null,
      personId: map['personId'] as String,
      amount: map['amount'] as double,
      note: map['note'] as String,
      type: map['type'] as int,
      tag: map['tag'] != null ? map['tag'] as String : null,
      createdTime: map['createdTime'] as String,
      updatedTime: map['updatedTime'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BorrowLendModel.fromJson(String source) =>
      BorrowLendModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BorrowLendModel(id: $id, personId: $personId, amount: $amount, note: $note, type: $type, tag: $tag, createdTime: $createdTime, updatedTime: $updatedTime)';
  }

  @override
  bool operator ==(covariant BorrowLendModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.personId == personId &&
        other.amount == amount &&
        other.note == note &&
        other.type == type &&
        other.tag == tag &&
        other.createdTime == createdTime &&
        other.updatedTime == updatedTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        personId.hashCode ^
        amount.hashCode ^
        note.hashCode ^
        type.hashCode ^
        tag.hashCode ^
        createdTime.hashCode ^
        updatedTime.hashCode;
  }
}
