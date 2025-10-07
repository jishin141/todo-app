import 'package:flutter/material.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoList(),
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final List<String> _todoItems = [];

  void _addTodoItem(String task) {
    if (task.isNotEmpty) {
      setState(() => _todoItems.add(task));
    }
  }

  void _removeTodoItem(int index) {
    setState(() => _todoItems.removeAt(index));
  }

  void _promptAddTodoItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('New task'),
          content: TextField(
            autofocus: true,
            onSubmitted: (val) {
              _addTodoItem(val);
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: _todoItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_todoItems[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _removeTodoItem(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _promptAddTodoItem,
        tooltip: 'Add task',
        child: Icon(Icons.add),
      ),
    );
  }
}
