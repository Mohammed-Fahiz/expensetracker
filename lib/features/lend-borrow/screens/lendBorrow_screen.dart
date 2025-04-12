import 'package:expensetracker/core/custom_widgets/customButton_widget.dart';
import 'package:expensetracker/core/custom_widgets/customTextField_widget.dart';
import 'package:expensetracker/features/lend-borrow/widgets/customTab_card.dart';
import 'package:expensetracker/features/lend-borrow/widgets/totalLendBorrow_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LendBorrowScreen extends ConsumerStatefulWidget {
  static const routeName = "/lend-borrow";
  const LendBorrowScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LendBorrowScreenState();
}

class _LendBorrowScreenState extends ConsumerState<LendBorrowScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lend & Borrow'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(05.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 0.18.sh,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0),
                ),
                padding: EdgeInsets.all(0.01.sh),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TotalLendBorrowCardWidget(
                          title: "Lended Amount",
                          amount: "0.00",
                        ),
                        TotalLendBorrowCardWidget(
                          title: "Borrowed Amount",
                          amount: "0.00",
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 0.05.sh,
                          width: 0.3.sw,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(0),
                            border: Border.all(
                              color: Colors.black,
                              width: 0.001.sh,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Add",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 0.01.sw),
                              Icon(
                                Icons.add_circle,
                                size: 0.03.sh,
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 0.01.sh),
              SizedBox(
                child: Row(
                  children: [
                    const CustomTabCardWidget(
                      title: "All",
                    ),
                    SizedBox(width: 0.02.sw),
                    const CustomTabCardWidget(
                      title: "Lendings",
                    ),
                    SizedBox(width: 0.02.sw),
                    const CustomTabCardWidget(
                      title: "Borrowings",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 0.01.sh),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFieldWidget(
                      controller: searchController,
                      labelText: "Search here...",
                    ),
                  ),
                  SizedBox(width: 0.02.sw),
                  Container(
                    height: 0.05.sh,
                    width: 0.1.sw,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(
                        color: Colors.black,
                        width: 0.001.sh,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.filter_1_outlined,
                          size: 0.03.sh,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 0.01.sh),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.002.sh),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: 0.1.sh,
                      ),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(0),
                          border: Border.all(
                            color: Colors.black,
                            width: 0.001.sh,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(0.01.sh),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 0.6.sw,
                                    child: Text(
                                      "Dias valooran",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    "2023-10-10 : 10:00",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                      minWidth: 0.1.sh,
                                    ),
                                    child: Container(
                                      height: 0.02.sh,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(0),
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 0.001.sh,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Lend",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(width: 0.01.sw),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 0.6.sw,
                                    child: Text(
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "150",
                                    style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        height: 0.03.sh,
                                        width: 0.15.sw,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(0),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 0.001.sh,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              "Edit",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(width: 0.01.sw),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 0.01.sh),
                                      Container(
                                        height: 0.03.sh,
                                        width: 0.15.sw,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(0),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 0.001.sh,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              "Delete",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(width: 0.01.sw),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
