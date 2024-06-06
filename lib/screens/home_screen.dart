// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:taskify/widgets/calender_widget.dart';
// import '../screens/notification_screen.dart';
// import '../common/show_model.dart';
// import '../provider/service_provider.dart';
// import '../widgets/card_todo_list_widget.dart';

// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({
//     super.key,
//   });

//   String _getGreeting() {
//     final hour = DateTime.now().hour;
//     if (hour < 12) {
//       return 'Good Morning';
//     } else if (hour < 17) {
//       return 'Good Afternoon';
//     } else if (hour < 20) {
//       return 'Good Evening';
//     } else {
//       return 'Good Night';
//     }
//   }

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final taskifyData = ref.watch(fetchStreamProvider);
//     final greeting = _getGreeting();

//     return Scaffold(
//       backgroundColor: Colors.grey.shade200,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         title: ListTile(
//           leading: CircleAvatar(
//             backgroundColor: Colors.amber.shade200,
//             radius: 25,
//             child: Image.asset('assets/images/my-avatar.png'),
//           ),
//           title: Text(
//             greeting,
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.amber.shade700,
//             ),
//           ),
//           subtitle: const Text(
//             'Aayush Dc',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             ),
//           ),
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 20,
//             ),
//             child: Row(
//               children: [
//                 IconButton(
//                   onPressed: () {
//                     showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return const CalenderWidget();
//                       },
//                     );
//                   },
//                   icon: const Icon(
//                     CupertinoIcons.calendar,
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: () => Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const NotificationScreen(),
//                     ),
//                   ),
//                   icon: const Icon(
//                     CupertinoIcons.bell,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 30),
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 12,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Today\'s Task',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                           color: Colors.black,
//                         ),
//                       ),
//                       Text(
//                         'Tuesday, 04 June',
//                         style: TextStyle(
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFFD5E8FA),
//                       foregroundColor: Colors.blue.shade400,
//                       elevation: 0,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     onPressed: () => showModalBottomSheet(
//                       isScrollControlled: true,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                       context: context,
//                       builder: (context) => AddNewTaskModel(),
//                     ),
//                     child: const Text(
//                       '+ New Task',
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 20,
//               ),

//               // Handling different states of taskifyData
//               taskifyData.when(
//                 data: (data) => ListView.builder(
//                   itemCount: data.length,
//                   shrinkWrap: true,
//                   itemBuilder: (context, index) =>
//                       CardTodoListWidget(getIndex: index),
//                 ),
//                 loading: () => const CircularProgressIndicator(),
//                 error: (error, stack) => Text('Error: $error'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:taskify/screens/profile_screen.dart';
import 'package:taskify/widgets/calender_widget.dart';
import '../model/taskify_model.dart';
import '../screens/notification_screen.dart';
import '../common/show_model.dart';
import '../provider/service_provider.dart';
import '../widgets/card_todo_list_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final DateTime _currentDate = DateTime.now();

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else if (hour < 20) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  String _filter = 'open';

  @override
  Widget build(BuildContext context) {
    final taskifyData = ref.watch(fetchStreamProvider);
    final greeting = _getGreeting();

    String formattedDate = DateFormat('EEEE, dd MMMM').format(_currentDate);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: ListTile(
          leading: InkWell(
            radius: 25,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
            child: CircleAvatar(
              backgroundColor: Colors.amber.shade200,
              radius: 25,
              child: Image.asset('assets/images/my-avatar.png'),
            ),
          ),
          title: Text(
            greeting,
            style: TextStyle(
              fontSize: 12,
              color: Colors.amber.shade700,
            ),
          ),
          subtitle: const Text(
            'Aayush Dc',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const CalenderWidget();
                      },
                    );
                  },
                  icon: const Icon(
                    CupertinoIcons.calendar,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationScreen(),
                    ),
                  ),
                  icon: const Icon(
                    CupertinoIcons.bell,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Today\'s Task',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        formattedDate,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD5E8FA),
                      foregroundColor: Colors.blue.shade400,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () => showModalBottomSheet(
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      context: context,
                      builder: (context) => AddNewTaskModel(),
                    ),
                    child: const Text(
                      '+ New Task',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              taskifyData.when(
                data: (data) {
                  int allCount = data.length;
                  int openCount = data
                      .where((task) => !task.isDone && !task.isArchived)
                      .length;
                  int closedCount = data.where((task) => task.isDone).length;
                  int archivedCount =
                      data.where((task) => task.isArchived).length;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCategoryItem('Open', openCount, 'open'),
                      _buildCategoryItem('Closed', closedCount, 'closed'),
                      _buildCategoryItem('Archived', archivedCount, 'archived'),
                      _buildCategoryItem('All', allCount, 'all'),
                    ],
                  );
                },
                loading: () => const CircularProgressIndicator(),
                error: (error, stack) => Text('Error: $error'),
              ),
              const SizedBox(
                height: 20,
              ),
              taskifyData.when(
                data: (data) {
                  final filteredTasks = _filterTasks(data, _filter);
                  return ListView.builder(
                    itemCount: filteredTasks.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final task = filteredTasks[index];
                      return Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.horizontal,
                        background: Container(
                          color: Colors.blue,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Icon(CupertinoIcons.archivebox,
                              color: Colors.white),
                        ),
                        secondaryBackground: _filter == 'archived'
                            ? Container(
                                color: Colors.red,
                                alignment: Alignment.centerRight,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: const Icon(
                                  CupertinoIcons.delete,
                                  color: Colors.white,
                                ),
                              )
                            : Container(
                                color: Colors.red,
                                alignment: Alignment.centerRight,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: const Icon(
                                  CupertinoIcons.delete,
                                  color: Colors.white,
                                ),
                              ),
                        onDismissed: (direction) {
                          if (_filter == 'all' ||
                              _filter == 'open' ||
                              _filter == 'closed' &&
                                  direction == DismissDirection.startToEnd) {
                            ref.read(serviceProvider).archiveTask(task.docID);
                          } else if (_filter == 'archived' &&
                              direction == DismissDirection.startToEnd) {
                            // Unarchive task
                            ref.read(serviceProvider).unArchiveTask(task.docID);
                          } else if (direction == DismissDirection.endToStart) {
                            ref.read(serviceProvider).deleteTask(task.docID);
                          }
                        },
                        child: CardTodoListWidget(getIndex: index),
                      );
                    },
                  );
                },
                loading: () => const CircularProgressIndicator(),
                error: (error, stack) => Text('Error: $error'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String label, int count, String filter) {
    bool isSelected = _filter == filter;
    return GestureDetector(
      onTap: () {
        setState(() {
          _filter = filter;
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.blue : Colors.grey,
            ),
          ),
          const SizedBox(width: 4),
          Container(
            height: 20,
            width: 30,
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue : Colors.grey.shade500,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                count.toString(),
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<TaskifyModel> _filterTasks(List<TaskifyModel> tasks, String filter) {
    switch (filter) {
      case 'open':
        return tasks.where((task) => !task.isDone && !task.isArchived).toList();
      case 'closed':
        return tasks.where((task) => task.isDone).toList();
      case 'archived':
        return tasks.where((task) => task.isArchived).toList();
      case 'all':
      default:
        return tasks;
    }
  }
}
