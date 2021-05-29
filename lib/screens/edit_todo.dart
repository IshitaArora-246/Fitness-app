import 'package:fitness_app/models/todo_model.dart';
import 'package:fitness_app/provider/todos.dart';
import 'package:fitness_app/widgets/todo_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditTodoPage extends StatefulWidget {
  EditTodoPage({Key key, @required this.todo}) : super(key: key);
  final Todo todo;

  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final _formKey = GlobalKey<FormState>();
  String title;
  String description;

  @override
  void initState() {
    super.initState();
    title = widget.todo.title;
    description = widget.todo.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Todo"),
        actions: [
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                final provider =
                    Provider.of<TodosProvider>(context, listen: false);
                provider.deleteTodo(widget.todo);

                Navigator.of(context).pop();
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: TodoForm(
            title: title,
            description: description,
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedDescription: (description) =>
                setState(() => this.description = description),
            onSaveTodo: saveTodo,
          ),
        ),
      ),
    );
  }

  void saveTodo() {
    final isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<TodosProvider>(context, listen: false);

      provider.updateTodo(widget.todo, title, description);

      Navigator.of(context).pop();
    }
  }
}
