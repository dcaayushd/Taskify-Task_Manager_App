import 'package:flutter/material.dart';

class RadioListWidget extends StatelessWidget {
  const RadioListWidget({
    super.key,
    required this.titleRadio,
    required this.categoryColor,
  });

  final String titleRadio;
  final Color categoryColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Theme(
        data: ThemeData(unselectedWidgetColor: categoryColor),
        child:
            // Container(
            //   decoration: BoxDecoration(
            //     color: Colors.grey.shade200,
            //     borderRadius: BorderRadius.circular(8),
            //   ),
            //   child:
            RadioListTile(
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
          value: 1,
          groupValue: 0,
          onChanged: (value) {
            // print('Clicked');
          },
        ),
      ),
      // ),
    );
  }
}
