import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class SampleItemDetailsView extends StatelessWidget {
  const SampleItemDetailsView({Key? key}) : super(key: key);

  static const routeName = '/student_details';

  @override
  Widget build(BuildContext context) {
    final String name = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(
            20.0,
          ),
          padding: const EdgeInsets.all(
            20.0,
          ),
          child: ListView(
            children: [
              Text(
                'Student Name: $name',
                style: const TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
