import 'package:firestore/logic/firestore_service.dart';
import 'package:firestore/widgets/task_list.dart';
import 'package:flutter/material.dart';

class SeconClassScreen extends StatelessWidget {
  const SeconClassScreen({super.key, required this.title});

  final String title;

  Future<void> _addTask() async {
    await FirestoreService.addTask(
        name: 'test', description: 'testing firestore');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        actions: [
          IconButton(onPressed: () => _addTask(), icon: const Icon(Icons.add))
        ],
      ),
      body: TaskList(),
    );
  }
}
