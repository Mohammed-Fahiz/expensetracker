import 'package:expensetracker/core/error_handling/failure.dart';
import 'package:logger/web.dart';
import 'package:sqflite/sqflite.dart';

Failure handleError({required Object error}) {
  if (error is DatabaseException) {
    if (error.isSyntaxError()) {
      return Failure(errMSg: "Database syntax error: $error");
    } else if (error.isOpenFailedError()) {
      return Failure(errMSg: "Failed to open database: $error");
    } else if (error.isDatabaseClosedError()) {
      return Failure(errMSg: "Database is closed: $error");
    } else {
      return Failure(errMSg: "Database error: $error");
    }
  } else {
    return Failure(errMSg: error.toString());
  }
}

void logError(dynamic error) {
  Logger().t(error.toString());
}
