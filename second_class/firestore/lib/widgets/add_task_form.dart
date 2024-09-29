import 'package:firestore/logic/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddTaskForm extends StatefulWidget {
  const AddTaskForm({super.key});

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _Lable(),
        const SizedBox(
          height: 50,
        ),
        _NameForm(nameController: nameController),
        const SizedBox(
          height: 50,
        ),
        _DescriptionForm(descriptionController: descriptionController),
        const SizedBox(
          height: 50,
        ),
        _AddButton(
          nameController: nameController,
          descriptionController: descriptionController,
        ),
      ],
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton(
      {required this.nameController,
      required this.descriptionController,
      super.key});

  final TextEditingController nameController;
  final TextEditingController descriptionController;

  Future<void> _addTask() async {
    await FirestoreService.addTask(
        name: nameController.text, description: descriptionController.text);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => _addTask(), child: const Text('Add task'));
  }
}

class _Lable extends StatelessWidget {
  const _Lable({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(50),
      child: Text('Add new task'),
    );
  }
}

class _NameForm extends StatelessWidget {
  const _NameForm({required this.nameController, super.key});

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: nameController,
      decoration: const InputDecoration(
        labelText: 'name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}

class _DescriptionForm extends StatelessWidget {
  const _DescriptionForm({required this.descriptionController, super.key});

  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: descriptionController,
      decoration: const InputDecoration(
        labelText: 'description',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
