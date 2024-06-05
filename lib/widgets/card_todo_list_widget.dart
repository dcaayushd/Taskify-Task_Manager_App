import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardTodoListWidget extends StatelessWidget {
  const CardTodoListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.green.shade700,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
            width: 20,
          ),

          //Wrapped with a container
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    'Learning Web Development',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text(
                    'Learning topic HTML and CSS',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  trailing: Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      activeColor: Colors.blue,
                      shape: const CircleBorder(),
                      // value: false,
                      value: true,
                      onChanged: (value) => print(value),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -12),
                  child: Column(
                    children: [
                      Divider(
                        thickness: 1.5,
                        color: Colors.grey.shade200,
                      ),
                      const Row(
                        children: [
                          Text('Today'),
                          Gap(12),
                          Text('09:15PM - 11:45PM')
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
