import 'package:expensetracker/core/error_handling/handleError_function.dart';
import 'package:expensetracker/core/error_handling/type_defs.dart';
import 'package:expensetracker/core/sqflite_db/databaseHelper.dart';
import 'package:expensetracker/core/sqflite_db/sqfliteDB_constants.dart';
import 'package:expensetracker/features/persons/models/person_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sqflite/sqflite.dart';

final PersonRepositoryProvider = Provider<PersonRepository>((ref) {
  return PersonRepository();
});

class PersonRepository {
  FutureVoid addPerson({required PersonModel personModel}) async {
    try {
      final db = await DatabaseHelper().database;

      final List<Map<String, dynamic>> result = await db.query(
        SqfliteTableNames.personMaster,
        where: 'name = ?',
        whereArgs: [personModel.name],
      );
      if (result.isNotEmpty) {
        throw 'Person with this name already exists';
      }

      await db.insert(
        SqfliteTableNames.personMaster,
        personModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      return right(null);
    } catch (e) {
      return left(handleError(error: e));
    }
  }

  FutureVoid updatePerson({required PersonModel personModel}) async {
    try {
      final db = await DatabaseHelper().database;

      final List<Map<String, dynamic>> result = await db.query(
        SqfliteTableNames.personMaster,
        where: 'name = ? AND id != ?',
        whereArgs: [personModel.name, personModel.id],
      );
      if (result.isNotEmpty) {
        throw 'Person with this name already exists';
      }

      await db.update(
        SqfliteTableNames.personMaster,
        personModel.toMap(),
        where: 'id = ?',
        whereArgs: [personModel.id],
      );

      return right(null);
    } catch (e) {
      return left(handleError(error: e));
    }
  }

  FutureVoid deletePerson({required int id}) async {
    try {
      final db = await DatabaseHelper().database;

      await db.delete(
        SqfliteTableNames.personMaster,
        where: 'id = ?',
        whereArgs: [id],
      );

      return right(null);
    } catch (e) {
      return left(handleError(error: e));
    }
  }

  FutureEither<List<PersonModel>> getAllPersons() async {
    try {
      final db = await DatabaseHelper().database;

      final List<Map<String, dynamic>> result = await db.query(
        SqfliteTableNames.personMaster,
        orderBy: 'name ASC',
      );
      if (result.isEmpty) {
        return right([]);
      }

      final List<PersonModel> persons = result
          .map((person) => PersonModel.fromMap(person))
          .toList()
          .cast<PersonModel>();

      return right(persons);
    } catch (e) {
      return left(handleError(error: e));
    }
  }
}
