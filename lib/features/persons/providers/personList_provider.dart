import 'dart:async';

import 'package:expensetracker/features/categories/controller/category_controller.dart';
import 'package:expensetracker/features/categories/models/categoryView_model.dart';
import 'package:expensetracker/features/categories/models/category_model.dart';
import 'package:expensetracker/features/persons/controller/personController.dart';
import 'package:expensetracker/features/persons/models/person_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final personListProvider =
    AutoDisposeAsyncNotifierProvider<PersonListNotifer, List<PersonModel>>(
  () => PersonListNotifer(),
);

class PersonListNotifer extends AutoDisposeAsyncNotifier<List<PersonModel>> {
  List<PersonModel> _orginalState = [];

  @override
  FutureOr<List<PersonModel>> build() {
    return fetchPersons();
  }

  Future<List<PersonModel>> fetchPersons() async {
    final persons =
        await ref.read(personControllerProvider.notifier).fetchPersons();
    _orginalState = persons;
    return persons;
  }

  void filterPersons(String query) {
    if (query.isEmpty) {
      state = AsyncValue.data(_orginalState);
    } else {
      final filteredPersons = _orginalState.where((personModel) {
        return personModel.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
      state = AsyncValue.data(filteredPersons);
    }
  }
}
