import 'package:firestore/logic/firestore_service.dart';
import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  TaskList({super.key});

  final getTaskFuture = FirestoreService.getTasks();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getTaskFuture,
        builder: (context, snap) {
          if (snap.hasData && snap.data != null) {
            return ListView.builder(
                itemCount: snap.data!.length,
                itemBuilder: (context, index) {
                  final task = snap.data;
                  return ListTile(
                    leading: const CircleAvatar(),
                    title: Text(task![index]['name'] as String),
                    subtitle: Text(task[index]['description'] as String),
                    trailing: const Icon(Icons.delete),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
