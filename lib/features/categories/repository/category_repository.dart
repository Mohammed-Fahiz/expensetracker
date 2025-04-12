import 'package:expensetracker/core/error_handling/handleError_function.dart';
import 'package:expensetracker/core/error_handling/type_defs.dart';
import 'package:expensetracker/core/sqflite_db/databaseHelper.dart';
import 'package:expensetracker/core/sqflite_db/sqfliteDB_constants.dart';
import 'package:expensetracker/features/categories/models/categoryView_model.dart';
import 'package:expensetracker/features/categories/models/category_model.dart';
import 'package:expensetracker/models/icon_models/iconData_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sqflite/sqflite.dart';

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  return CategoryRepository();
});

class CategoryRepository {
  FutureVoid addCategory({required CategoryModel category}) async {
    try {
      final db = await DatabaseHelper().database;

      final existingCategory = await db.query(
        SqfliteTableNames.categoryMaster,
        where: 'categoryName = ? ',
        whereArgs: [category.categoryName],
      );

      if (existingCategory.isNotEmpty) {
        throw "Category already exists";
      }
      await db.insert(
        SqfliteTableNames.categoryMaster,
        category.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return right(null);
    } catch (e) {
      return left(handleError(error: e));
    }
  }

  FutureVoid editCategory({required CategoryModel category}) async {
    try {
      final db = await DatabaseHelper().database;

      final existingCategory = await db.query(
        SqfliteTableNames.categoryMaster,
        where: 'categoryName = ?  AND id != ?',
        whereArgs: [category.categoryName, category.id],
      );

      if (existingCategory.isNotEmpty) {
        throw "Category already exists";
      }
      await db.update(
        SqfliteTableNames.categoryMaster,
        category.toMap(),
        where: 'id = ?',
        whereArgs: [category.id],
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return right(null);
    } catch (e) {
      return left(handleError(error: e));
    }
  }

  FutureEither<List<CategoryViewModel>> fetchCategories() async {
    try {
      final db = await DatabaseHelper().database;

      final List<Map<String, dynamic>> results = await db.rawQuery('''
      SELECT 
        c.id, c.categoryName, c.iconId, c.createdTime, c.updatedTime, c.priority, c.isActive,
        i.id , i.iconCategory, i.name , i.iconCodePoint, i.iconFontFamily
      FROM ${SqfliteTableNames.categoryMaster} c
      LEFT JOIN ${SqfliteTableNames.iconMaster} i ON c.iconId = i.id
      WHERE c.isActive = 1
      ORDER BY c.updatedTime DESC
    ''');

      if (results.isEmpty) {
        return right([]);
      }

      final categoriesWithIcons = results.map((row) {
        final category = CategoryModel.fromMap(row);

        IconDataModel? icon;
        if (row['id'] != null) {
          icon = IconDataModel.fromMap(row);
        }

        return CategoryViewModel(category: category, icon: icon);
      }).toList();

      return right(categoriesWithIcons);
    } catch (e) {
      return left(handleError(error: e));
    }
  }

  FutureEither<List<IconDataModel>> fetchCategoryIcons() async {
    try {
      final db = await DatabaseHelper().database;
      final List<Map<String, dynamic>> maps = await db.query(
        SqfliteTableNames.iconMaster,
      );

      if (maps.isEmpty) {
        return right([]);
      }

      final icons = maps.map((map) => IconDataModel.fromMap(map)).toList();
      return right(icons);
    } catch (e) {
      return left(handleError(error: e));
    }
  }
}
