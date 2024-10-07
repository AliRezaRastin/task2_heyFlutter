import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:w_tasks/componets/item.dart';

class ExpansionTak extends StatefulWidget {
  const ExpansionTak({super.key});

  @override
  State<ExpansionTak> createState() => _ExpansionTakState();
}

class _ExpansionTakState extends State<ExpansionTak> {
  static const body = 'some text here ';

  final List<Item> items = [
    Item(title: 'panel 1', header: body, isExpanded: false),
    Item(title: 'panel 2', header: body, isExpanded: false),
    Item(title: 'panel 3', header: body, isExpanded: false),
    Item(title: 'panel 4', header: body, isExpanded: false),
    Item(title: 'panel 5', header: body, isExpanded: false),
    Item(title: 'panel 6', header: body, isExpanded: false),
    Item(title: 'panel 7', header: body, isExpanded: false),
    Item(title: 'panel 8', header: body, isExpanded: false),
    Item(title: 'panel 9', header: body, isExpanded: false),
    Item(title: 'panel 10', header: body, isExpanded: false),
    Item(title: 'panel 11', header: body, isExpanded: false),
    Item(title: 'panel 12', header: body, isExpanded: false),
    Item(title: 'panel 13', header: body, isExpanded: false),
    Item(title: 'panel 14', header: body, isExpanded: false),
    Item(title: 'panel 15', header: body, isExpanded: false),
    Item(title: 'panel 16', header: body, isExpanded: false),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_rounded),
          ),
          centerTitle: true,
          title: Text('Expanision Pane List'),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: ExpansionPanelList(
            expansionCallback: (index, isExpanded) => setState(() {
              items[index].isExpanded = !isExpanded;
            }),
            children: items
                .map((item) => ExpansionPanel(
                    canTapOnHeader: true,
                    isExpanded: item.isExpanded,
                    headerBuilder: (context, isExpanded) => ListTile(
                          title: Text(item.title),
                        ),
                    body: ListTile(
                      title: Text(item.header),
                    )))
                .toList(),
          ),
        ),
      ),
    );
  }
}
