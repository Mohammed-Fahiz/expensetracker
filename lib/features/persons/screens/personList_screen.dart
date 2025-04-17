import 'package:expensetracker/core/custom_widgets/customTextField_widget.dart';
import 'package:expensetracker/core/custom_widgets/loader.dart';
import 'package:expensetracker/core/error_handling/error_text.dart';
import 'package:expensetracker/core/utils/formatTime.dart';
import 'package:expensetracker/features/lend-borrow/screens/lendBorrow_screen.dart';
import 'package:expensetracker/features/lend-borrow/widgets/totalLendBorrow_card.dart';
import 'package:expensetracker/features/persons/models/person_model.dart';
import 'package:expensetracker/features/persons/providers/personList_provider.dart';
import 'package:expensetracker/features/persons/widgets/addOrEditPerson_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';

class PersonListScreen extends ConsumerStatefulWidget {
  static const routeName = "/personList";
  const PersonListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PersonListScreenState();
}

class _PersonListScreenState extends ConsumerState<PersonListScreen> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Person List"),
          actions: [
            IconButton(
              icon: const Icon(LineIcons.plusCircle),
              onPressed: () async {
                await addEditPersonSheet(
                  context: context,
                  personModel: null,
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(0.02.sw),
            child: Column(
              children: [
                Container(
                  height: 0.15.sh,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(0),
                  ),
                  padding: EdgeInsets.all(0.01.sh),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TotalLendBorrowCardWidget(
                        title: "Lended Amount ",
                        amount: "0.00",
                      ),
                      TotalLendBorrowCardWidget(
                        title: "Borrowed Amount",
                        amount: "0.00",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 0.01.sh),
                CustomTextFieldWidget(
                  controller: searchController,
                  labelText: "Search Person",
                  onChanged: (value) {
                    ref.read(personListProvider.notifier).filterPersons(value);
                  },
                ),
                SizedBox(
                  height: 0.01.sh,
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final asyncValue = ref.watch(personListProvider);
                    return asyncValue.when(
                      data: (personList) {
                        if (personList.isEmpty) {
                          return const Center(
                            child: Text("No Person Found"),
                          );
                        }
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: personList.length,
                          itemBuilder: (BuildContext context, int index) {
                            final person = personList[index];
                            final updatedTime = FormatTimeFunctions
                                .convertIsoToDateAndTimeFormatted(
                              isoDate: person.updatedTime,
                            );
                            return GestureDetector(
                              onTap: () async {
                                context.push(LendBorrowScreen.routeName);
                              },
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: 0.01.sw),
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minHeight: 0.1.sh,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(0.02.sw),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 0.6.sw,
                                          child: Text(
                                            person.name,
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Updated: $updatedTime",
                                          style: TextStyle(fontSize: 12.sp),
                                        ),
                                        SizedBox(
                                          width: 0.6.sw,
                                          child: Text(
                                            "Notes: ${person.notes}",
                                            style: TextStyle(fontSize: 12.sp),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      error: (error, stackTrace) {
                        return ErrorText(errorText: error);
                      },
                      loading: () {
                        return const Loader();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> addEditPersonSheet({
    required BuildContext context,
    required PersonModel? personModel,
  }) async {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return AddEditPersonSheet(
          personModel: personModel,
        );
      },
    );
  }
}
