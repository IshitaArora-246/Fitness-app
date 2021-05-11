import 'package:fitness_app/widgets/todo_form.dart';
import 'package:flutter/material.dart';

class ShowTodoDialogBox extends StatefulWidget {
  ShowTodoDialogBox({Key key}) : super(key: key);

  @override
  _ShowTodoDialogBoxState createState() => _ShowTodoDialogBoxState();
}

class _ShowTodoDialogBoxState extends State<ShowTodoDialogBox> {
  String title = "";
  String desc = "";
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Add Todo",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 28, color: Colors.black),
          ),
          SizedBox(height: 10),
          TodoForm(
              onChangedTitle: (title) => setState(() {
                    return this.title = title;
                  }),
              onChangedDesc: (desc) => setState(() {
                    return this.desc = desc;
                  }),
              onSaveTodo: () {})
        ],
      ),
    );
  }
}
