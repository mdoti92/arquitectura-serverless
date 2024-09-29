import 'package:firestore/widgets/add_task_form.dart';
import 'package:firestore/widgets/task_list.dart';
import 'package:flutter/material.dart';

class SeconClassScreen extends StatelessWidget {
  const SeconClassScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        actions: [
          IconButton(
              onPressed: () => showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => const AddTaskForm()),
              icon: const Icon(Icons.add))
        ],
      ),
      body: TaskList(),
    );
  }
}
