import 'package:flutter/material.dart';

import 'models/item.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todo App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  var items  = new List<Item>();

  HomePage() {
    items = [];
    items.add(Item(title: "Banana", done: false));
    items.add(Item(title: "Abacate", done: true));
    items.add(Item(title: "Laranja", done: false));
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var newTaskCtrl = TextEditingController();

  void add() {
    if(newTaskCtrl.text.isEmpty) return;
    
    setState(() {
      widget.items.add(
        Item(
          title: newTaskCtrl.text, 
          done: false,
        )
      );
      newTaskCtrl.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    // newTaskCtrl.value //Serve para controlar...
    return Scaffold(
      appBar: AppBar(
        // leading: Text("Oi"),
        // title: Text("Todo List"),
        title: TextFormField(
          controller: newTaskCtrl,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            labelText: "Nova Tarefa",
            labelStyle: TextStyle(
              color: Colors.white
            ),
          ),
        ),
        // actions: <Widget>[
        //   Icon(Icons.plus_one),
        // ],
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext ctxt, int index){
          final item = widget.items[index];

          return CheckboxListTile(
            title: Text(item.title),
            key: Key(item.title), //Este valor deve ser único. Portanto, use algo que não vá se repetir. Crie e use um ID.
            value: item.done,
            onChanged: (value) {
              setState(() {
                item.done = value;
              });
            },
          );
        },
      ),
      // body: Container(
      //   child: Center(
      //     child: Text("Olá mundo"),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: add,
        child: Icon(Icons.add),
        backgroundColor: Colors.orange,
      ),
    );
  }
}