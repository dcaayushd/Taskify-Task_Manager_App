import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/radio_provider.dart';

class RadioListWidget extends ConsumerWidget {
  const RadioListWidget({
    super.key,
    required this.titleRadio,
    required this.valueInput,
    required this.categoryColor,
    required this.onChangedValue,
  });

  final String titleRadio;
  final Color categoryColor;
  final int valueInput;
  final VoidCallback onChangedValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radio = ref.watch(radioProvider);
    return Material(
      child: Theme(
        data: ThemeData(unselectedWidgetColor: categoryColor),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            // borderRadius: BorderRadius.circular(8),
          ),
          child: RadioListTile(
            activeColor: categoryColor,
            contentPadding: EdgeInsets.zero,
            title: Transform.translate(
              offset: const Offset(-22, 0),
              child: Text(
                titleRadio,
                style: TextStyle(
                  //Font Size not necessary if you define shorter words for category
                  fontSize: 11.5,
                  color: categoryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            value: valueInput,
            groupValue: radio,
            onChanged: (value) => onChangedValue(),
          ),
        ),
      ),
    );
  }
}
