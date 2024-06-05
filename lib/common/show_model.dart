import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:taskify/model/taskify_model.dart';
import 'package:taskify/provider/date_time_provider.dart';
import 'package:taskify/provider/radio_provider.dart';
import 'package:taskify/provider/service_provider.dart';

import '../constants/app_styles.dart';

import '../widgets/date_time_widget.dart';
import '../widgets/radio_list_widget.dart';
import '../widgets/text_field_widget.dart';

import 'dart:developer' as developer;

class AddNewTaskModel extends ConsumerWidget {
  AddNewTaskModel({
    super.key,
  });

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

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
          const SizedBox(
            height: 12,
          ),
          const Text(
            'Tittle Task',
            style: AppStyles.headingOne,
          ),
          const SizedBox(
            height: 6,
          ),
          TextFieldWidget(
            hintText: 'Add Task Name',
            maxLine: 1,
            txtController: titleController,
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            'Description',
            style: AppStyles.headingOne,
          ),
          const SizedBox(
            height: 6,
          ),
          TextFieldWidget(
            hintText: 'Add Description',
            maxLine: 5,
            txtController: descriptionController,
          ),
          const SizedBox(
            height: 12,
          ),
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
          const SizedBox(
            height: 12,
          ),
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
              const SizedBox(
                width: 22,
              ),
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
          const SizedBox(
            height: 12,
          ),
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
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
              ),
              const SizedBox(
                width: 22,
              ),
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
                  onPressed: () {
                    final getRadioValue = ref.read(radioProvider);
                    String category = '';

                    switch (getRadioValue) {
                      case 1:
                        category = 'Learning';
                        break;

                      case 2:
                        category = 'Working';
                        break;

                      case 3:
                        category = 'General';
                        break;

                      // default:
                    }

                    ref.read(serviceProvider).addNewTask(TaskifyModel(
                          titleTask: titleController.text,
                          description: descriptionController.text,
                          category: category,
                          dateTask: ref.read(dateProvider),
                          timeTask: ref.read(timeProvider),
                          isDone: false,
                        ));

                    developer.log('Data is saved');

                    titleController.clear();
                    descriptionController.clear();
                    ref.read(radioProvider.notifier).update((state) => 0);
                    Navigator.pop(context);
                  },
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
