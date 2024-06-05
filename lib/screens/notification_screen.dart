import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskify/constants/app_styles.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: AppStyles.appBarTitleOne,
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.bell,
              size: 100.0,
              color: Colors.grey,
            ),
            SizedBox(height: 20.0),
            Text('Notifications', style: AppStyles.headingOne
                // TextStyle(
                //   fontSize: 24.0,
                //   fontWeight: FontWeight.bold,
                // ),
                ),
          ],
        ),
      ),
    );
  }
}
