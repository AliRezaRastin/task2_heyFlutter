import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w_tasks/expansionPanel.dart';
import 'package:w_tasks/hero_animation_example.dart';
import 'package:w_tasks/main.dart';
import 'package:w_tasks/myDashboard.dart';
import 'package:w_tasks/providers/colorProvider.dart';
import 'package:w_tasks/providers/tabProvider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ColorProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TabProvider(),
        ),
      ],
      child: MaterialApp(home: AlertExample()),
    ),
  );
}

class AlertExample extends StatefulWidget {
  const AlertExample({super.key});

  @override
  State<AlertExample> createState() => _AlertExampleState();
}

class _AlertExampleState extends State<AlertExample> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Alert Dialog Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExpansionTak(),
                        ));
                  },
                  child: Text('Expansion panel')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Hero_Example(),
                        ));
                  },
                  child: Text('design 7')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyApp(),
                        ));
                  },
                  child: Text('Task1 2 3 ')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Dashbord(),
                        ));
                  },
                  child: Text('My Dashboard')),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Reset Setting ? '),
                        content: Text(
                            'This will reset your device to its defualt factory setting.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Closes the dialog
                            },
                            child: Text(
                              'cancel',
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Closes the dialog
                            },
                            child: Text('Accept'),
                          ),
                        ],
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                    },
                  );
                },
                child: Text('Show Alert'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
