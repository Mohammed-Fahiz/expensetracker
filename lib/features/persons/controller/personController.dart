import 'package:expensetracker/core/custom_widgets/custom_snackBar.dart';
import 'package:expensetracker/features/persons/models/person_model.dart';
import 'package:expensetracker/features/persons/providers/personList_provider.dart';
import 'package:expensetracker/features/persons/repository/personRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final personControllerProvider = NotifierProvider<PersonController, bool>(
  () => PersonController(),
);

class PersonController extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  Future<void> addPerson(
      {required PersonModel personModel, required BuildContext context}) async {
    state = true;
    final res = await ref
        .read(PersonRepositoryProvider)
        .addPerson(personModel: personModel);
    state = false;
    res.fold(
      (l) {
        showSnackBar(content: l.errMSg, context: context, color: Colors.red);
      },
      (r) {
        context.pop();
        showSnackBar(
          content: "${personModel.name} added succesfully",
          context: context,
          color: Colors.green,
        );
        ref.invalidate(personListProvider);
      },
    );
  }

  Future<void> updatePerson(
      {required PersonModel personModel, required BuildContext context}) async {
    state = true;
    final res = await ref
        .read(PersonRepositoryProvider)
        .updatePerson(personModel: personModel);
    state = false;
    res.fold((l) {
      showSnackBar(content: l.errMSg, context: context, color: Colors.red);
    }, (r) {
      context.pop();
      showSnackBar(
        content: "${personModel.name} updated succesfully",
        context: context,
        color: Colors.green,
      );
      ref.invalidate(personListProvider);
    });
  }

  Future<List<PersonModel>> fetchPersons() async {
    final res = await ref.read(PersonRepositoryProvider).getAllPersons();
    return res.fold(
      (l) => throw Exception(l.errMSg),
      (persons) => persons,
    );
  }
}
