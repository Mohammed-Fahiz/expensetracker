import 'package:flutter_riverpod/flutter_riverpod.dart';

final LendBorrowRepositoryProvider = Provider<LendBorrowRepository>((ref) {
  return LendBorrowRepository();
});

class LendBorrowRepository {}
