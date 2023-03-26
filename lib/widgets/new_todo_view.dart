// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_todo_app_with_sharedpreferences/model/todo.dart';

class NewTodoView extends StatefulWidget {
  final Todo item;
  const NewTodoView({super.key, required this.item});

  @override
  State<NewTodoView> createState() => _NewTodoViewState();
}

class _NewTodoViewState extends State<NewTodoView> {
  late TextEditingController titleController;
  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(
        // ignore: prefer_null_aware_operators,
        text: widget.item != null ? widget.item.title : null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.item != null ? 'Edit todo' : 'New todo',
          key: const Key('new-item-title'),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: titleController,
              autofocus: true,
              onSubmitted: (value) => submit(),
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(
              height: 14.0,
            ),
            ElevatedButton(
              child: const Text(
                'Save',
              ),
              onPressed: () {
                setState(() {
                  submit();
                });
                
              },
            )
          ],
        ),
      ),
    );
  }

  void submit() {
    Navigator.of(context).pop(titleController.text);
  }
}
