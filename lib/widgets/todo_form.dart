import 'package:flutter/material.dart';

class TodoForm extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSaveTodo;

  const TodoForm(
      {Key key,
      this.title = "",
      this.description = "",
      @required this.onChangedTitle,
      @required this.onChangedDescription,
      @required this.onSaveTodo})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          initialValue: title,
          onChanged: onChangedTitle,
          validator: (value) {
            if (value.isEmpty) {
              return "Title can't be empty";
            }
            return null;
          },
          cursorHeight: 24,
          cursorColor: Colors.pink,
          decoration: InputDecoration(
              hintText: "Title",
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink, width: 2))),
        ),
        SizedBox(height: 10),
        TextFormField(
          initialValue: description,
          onChanged: onChangedDescription,
          cursorHeight: 24,
          maxLines: 3,
          cursorColor: Colors.pink,
          decoration: InputDecoration(
              hintText: "description",
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink, width: 2))),
        ),
        SizedBox(height: 20),
        InkWell(
          onTap: onSaveTodo,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            height: 45,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text("Save",
                  style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ),
        ),
      ],
    );
  }
}
