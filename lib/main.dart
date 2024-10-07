import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:w_tasks/providers/colorProvider.dart';
import 'package:w_tasks/providers/tabProvider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0; // Current selected index

  @override
  Widget drawerItem(String title, Icon icon) {
    return GestureDetector(
      onTap: () {},
      child: ListTile(
        leading: icon,
        title: Text(title),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update selected index
      // Change color if needed (not needed here since we want only the selected icon to be red)
    });
  }

  Widget build(BuildContext context) {
    return Consumer<TabProvider>(builder: (context, provider, child) {
      return MaterialApp(
        title: 'Flutter Demo',
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => Container(
                          //Todo add here your elements
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Back')),
                        ));
              },
              child: Icon(Icons.add),
            ),
            bottomSheet: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 3,
              clipBehavior: Clip.antiAlias,
              color: Theme.of(context).primaryColor,
              child: Container(
                height: 55,
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: _selectedIndex, // Set the current index
                  selectedItemColor: Colors.red, // Color of the selected item
                  unselectedItemColor: Colors.grey, // Color of unselected items
                  onTap: _onItemTapped, // Handle tap on items
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.menu,
                        color: _selectedIndex == 0
                            ? Colors.red
                            : Colors.grey, // Conditional color
                      ),
                      label: 'This',
                      backgroundColor: Colors.grey,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        color: _selectedIndex == 1
                            ? Colors.red
                            : Colors.grey, // Conditional color
                      ),
                      label: 'is',
                    ),
                    //Todo add a text here bettwen the bottomNavbar items with the value of A

                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.grid_view_outlined,
                        color: _selectedIndex == 2
                            ? Colors.red
                            : Colors.grey, // Conditional color
                      ),
                      label: 'Bottom',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        FontAwesomeIcons.circleExclamation,
                        color: _selectedIndex == 3
                            ? Colors.red
                            : Colors.grey, // Conditional color
                      ),
                      label: 'Bar',
                    ),
                  ],
                ),
              ),
            ),
            appBar: AppBar(
              bottom: TabBar(
                onTap: (value) {
                  provider.updateTabContent(value);
                },
                tabs: [
                  Tab(icon: Icon(Icons.directions_car)),
                  Tab(icon: Icon(Icons.directions_transit)),
                  Tab(icon: Icon(Icons.directions_bike)),
                ],
              ),
            ),
            body: Center(child: Text('${provider.tabContent}')),
            drawer: Drawer(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey,
                            maxRadius: 30,
                            minRadius: 20,
                            backgroundImage: AssetImage('assets/avatar.png'),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Ali Reza ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'AliReza-99181@gmail.com',
                              style: TextStyle(fontSize: 12),
                            ),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        drawerItem('My Files ', Icon(Icons.folder)),
                        drawerItem(
                            'Shared with me ', Icon(Icons.supervisor_account)),
                        drawerItem('Starred ', Icon(Icons.star)),
                        drawerItem('Recent ', Icon(Icons.watch_later_outlined)),
                        drawerItem(
                            'Offline ', Icon(Icons.offline_pin_outlined)),
                        drawerItem('Uploads ', Icon(Icons.upload_rounded)),
                        drawerItem('BackUp ', Icon(Icons.cloud_upload)),
                        drawerItem('Trush ', Icon(Icons.delete)),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        drawerItem('Setting & account ', Icon(Icons.settings)),
                      ]),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
