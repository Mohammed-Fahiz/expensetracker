import 'package:flutter_riverpod/flutter_riverpod.dart';

final lendBorrowControllerProvider =
    NotifierProvider<LendBorrowController, bool>(
  () => LendBorrowController(),
);

class LendBorrowController extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }
}
