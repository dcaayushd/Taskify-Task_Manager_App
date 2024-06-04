import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskify/provider/date_time_provider.dart';
import 'package:taskify/provider/radio_provider.dart';

import '../constants/app_styles.dart';

import '../widgets/date_time_widget.dart';
import '../widgets/radio_list_widget.dart';
import '../widgets/text_field_widget.dart';

class AddNewTaskModel extends ConsumerWidget {
  const AddNewTaskModel({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final radioCategory = ref.watch(radioProvider);
    final dateProv = ref.watch(dateProvider);
    final timeProv = ref.watch(timeProvider);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      height: MediaQuery.of(context).size.height * 0.70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: double.infinity,
            child: Text(
              'New Task Todo',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Divider(
            thickness: 1.2,
            color: Colors.grey.shade200,
          ),
          const Gap(12),
          const Text(
            'Tittle Task',
            style: AppStyles.headingOne,
          ),
          const Gap(6),
          const TextFieldWidget(
            hintText: 'Add Task Name',
            maxLine: 1,
          ),
          const Gap(12),
          const Text(
            'Description',
            style: AppStyles.headingOne,
          ),
          const Gap(6),
          const TextFieldWidget(
            hintText: 'Add Description',
            maxLine: 5,
          ),
          const Gap(12),
          const Text(
            'Category',
            style: AppStyles.headingOne,
          ),
          Row(
            children: [
              Expanded(
                child: RadioListWidget(
                  titleRadio: 'Learning',
                  categoryColor: Colors.green.shade700,
                  valueInput: 1,
                  onChangedValue: () => ref.read(radioProvider.notifier).update(
                        (state) => 1,
                      ),
                ),
              ),
              Expanded(
                child: RadioListWidget(
                  titleRadio: 'Working',
                  categoryColor: Colors.blue.shade700,
                  valueInput: 2,
                  onChangedValue: () => ref.read(radioProvider.notifier).update(
                        (state) => 2,
                      ),
                ),
              ),
              Expanded(
                child: RadioListWidget(
                  titleRadio: 'General',
                  categoryColor: Colors.amberAccent.shade700,
                  valueInput: 3,
                  onChangedValue: () => ref.read(radioProvider.notifier).update(
                        (state) => 3,
                      ),
                ),
              ),
            ],
          ),
          const Gap(12),
          //Date and Time Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DateAndTimeWidget(
                titleText: 'Date',
                // valueText: 'DD/MM/YYYY',
                valueText: dateProv,
                iconSection: CupertinoIcons.calendar,
                onTap: () async {
                  final getValue = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2023),
                    lastDate: DateTime(2030),
                  );

                  if (getValue != null) {
                    final format = DateFormat.yMd();
                    // print(format.format(getValue));
                    ref.read(dateProvider.notifier).update(
                          (state) => format.format(getValue),
                        );
                  }
                },
              ),
              const Gap(22),
              DateAndTimeWidget(
                titleText: 'Time',
                // valueText: 'HH : MM',
                valueText: timeProv,
                iconSection: CupertinoIcons.clock,
                onTap: () async {
                  final getTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (getTime != null) {
                    ref.read(timeProvider.notifier).update(
                          (state) => getTime.format(context),
                        );
                  }
                },
              ),
            ],
          ),
          const Gap(12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue.shade800,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: BorderSide(
                        color: Colors.blue.shade800,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                      )),
                  onPressed: () {},
                  child: const Text('Cancel'),
                ),
              ),
              const Gap(20),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade800,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      // side: BorderSide(
                      //   color: Colors.blue.shade800,
                      // ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                      )),
                  onPressed: () {},
                  child: const Text('Create'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
