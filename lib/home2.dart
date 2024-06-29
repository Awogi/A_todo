import 'package:flutter/material.dart';
import 'Toggle.dart';
import 'home1.dart';

class Todoitem {
  String text;
  bool ischecked;
  Todoitem({required this.text, this.ischecked = false});
}

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<Todoitem> items = [];
  final TextEditingController todos = TextEditingController();

  void deleteitem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  // void addItem(String item) {
  //   setState(() {
  //     items.add(Todoitem(text: itemText));
  //   });
  // }
  void toggleCheck(int index) {
    setState(() {
      items[index].ischecked = !items[index].ischecked;
    });
  }

  void dialogBox() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('What do you want to do ?'),
          content: TextField(
            controller: todos,
            decoration: InputDecoration(hintText: 'Your task'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                todos.clear();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (todos.text.isNotEmpty) {
                  String itemText = todos.text;
                  addItem(todos.text);
                  todos.clear(); //
                }
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void addItem(String item) {
    setState(() {
      items.add(Todoitem(text: item));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: dialogBox,
          child: Icon(Icons.add),
          backgroundColor: const Color.fromARGB(255, 176, 39, 169),
          foregroundColor: Colors.black,
        ),
        appBar: AppBar(
          leading: Icon(Icons.menu),
          centerTitle: true,
          title: Text(
            "ToDo List",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.person),
            ),
          ],
          foregroundColor: Colors.black,
          backgroundColor: const Color.fromARGB(255, 176, 39, 169),
        ),
        backgroundColor: Colors.black,
        body: items.isEmpty
            ? Center(
                child: Text(
                  "No todos yet,try adding one",
                  style: TextStyle(fontSize: 25, color: Colors.purple),
                ),
              )
            : ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: TogglingCircularIcon(
                        ischecked: items[index].ischecked,
                        toggleCheck: () => toggleCheck(index),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: Text(items[index].text,
                          style: TextStyle(color: Colors.white)),
                      tileColor: const Color.fromARGB(255, 176, 39, 169),
                      trailing: GestureDetector(
                        onTap: () => deleteitem(index),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }));
  }
}
