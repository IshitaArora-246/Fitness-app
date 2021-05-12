import 'package:fitness_app/models/todo_model.dart';
import 'package:fitness_app/provider/todos.dart';
import 'package:fitness_app/widgets/todo_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowTodoDialogBox extends StatefulWidget {
  ShowTodoDialogBox({Key key}) : super(key: key);

  @override
  _ShowTodoDialogBoxState createState() => _ShowTodoDialogBoxState();
}

class _ShowTodoDialogBoxState extends State<ShowTodoDialogBox> {
  final _formKey = GlobalKey<FormState>();
  String title = "";
  String desc = "";
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Add Todo",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.black),
            ),
            SizedBox(height: 20),
            TodoForm(
                onChangedTitle: (title) => setState(() {
                      return this.title = title;
                    }),
                onChangedDesc: (desc) => setState(() {
                      return this.desc = desc;
                    }),
                onSaveTodo: addTodo)
          ],
        ),
      ),
    );
  } 

  void addTodo() {
    final isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    } else {
      final todo = Todo(
        id: DateTime.now().toString(),
        title: title,
        description: desc,
        createdTime: DateTime.now(),
      );

      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.addTodo(todo);

      Navigator.of(context).pop();
    }
  }
}
