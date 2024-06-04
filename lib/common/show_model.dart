import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constants/app_styles.dart';

import '../widgets/date_time_widget.dart';
import '../widgets/radio_list_widget.dart';
import '../widgets/text_field_widget.dart';

class AddNewTaskModel extends StatelessWidget {
  const AddNewTaskModel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                ),
              ),
              Expanded(
                child: RadioListWidget(
                  titleRadio: 'Working',
                  categoryColor: Colors.blue.shade700,
                ),
              ),
              Expanded(
                child: RadioListWidget(
                  titleRadio: 'General',
                  categoryColor: Colors.amberAccent.shade700,
                ),
              ),
            ],
          ),

          //Date and Time Section
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DateAndTimeWidget(
                titleText: 'Date',
                valueText: 'DD/MM/YYYY',
                iconSection: CupertinoIcons.calendar,
              ),
              Gap(22),
              DateAndTimeWidget(
                titleText: 'Time',
                valueText: 'HH : MM',
                iconSection: CupertinoIcons.clock,
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
