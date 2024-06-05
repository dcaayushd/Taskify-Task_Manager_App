import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:taskify/provider/service_provider.dart';

class CardTodoListWidget extends ConsumerWidget {
  const CardTodoListWidget({
    super.key,
    required this.getIndex,
  });

  final int getIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskifyData = ref.watch(fetchStreamProvider);
    return taskifyData.when(
        data: (taskifyData) {
          Color categoryColor = Colors.white;

          final getCategory = taskifyData[getIndex].category;
          switch (getCategory) {
            case 'Learning':
              categoryColor = Colors.green.shade700;
              break;

            case 'Working':
              categoryColor = Colors.blue.shade700;
              break;
            case 'General':
              categoryColor = Colors.amber.shade700;
              break;
          }

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
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
                    color: categoryColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  width: 20,
                ),
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
                        leading: Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                            activeColor: categoryColor,
                            shape: const CircleBorder(),
                            // value: false,
                            value: taskifyData[getIndex].isDone,
                            onChanged: (value) =>
                                ref.read(serviceProvider).updateTask(
                                      taskifyData[getIndex].docID,
                                      value,
                                    ),
                          ),
                        ),
                        title: Text(
                          taskifyData[getIndex].titleTask,
                          maxLines: 1,
                          style: TextStyle(
                            decoration: taskifyData[getIndex].isDone
                                ? TextDecoration.lineThrough
                                : null,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          taskifyData[getIndex].description,
                          maxLines: 1,
                          style: TextStyle(
                            decoration: taskifyData[getIndex].isDone
                                ? TextDecoration.lineThrough
                                : null,
                            fontSize: 12,
                          ),
                        ),
                        trailing: IconButton(
                            onPressed: () =>
                                ref.read(serviceProvider).deleteTask(
                                      taskifyData[getIndex].docID,
                                    ),
                            icon: const Icon(CupertinoIcons.delete)),
                      ),
                      Transform.translate(
                        offset: const Offset(0, -12),
                        child: Column(
                          children: [
                            Divider(
                              thickness: 1.5,
                              color: Colors.grey.shade200,
                            ),
                            Row(
                              children: [
                                // const Text('Today'),
                                // const Gap(12),
                                Text(taskifyData[getIndex].timeTask),
                                const Gap(12),
                                Text(taskifyData[getIndex].dateTask),
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
        },
        error: (error, stackTrace) => Center(
              child: Text(stackTrace.toString()),
            ),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
