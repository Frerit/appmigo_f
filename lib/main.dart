// Flutter code sample for material.BottomNavigationBar.1

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets and the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].
//
// ![A scaffold with a bottom navigation bar containing three bottom navigation
// bar items. The first one is selected.](https://flutter.github.io/assets-for-api-docs/assets/material/bottom_navigation_bar.png)

import 'package:flutter/material.dart';

import 'pages/home/home.dart';
import 'pages/location/location.dart';
import 'pages/notification/notification.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  Widget _callContainerPage(int currentPage) {
      switch (currentPage) {
        case 0:
          return HomePage();
        case 1:
          return LocationPage();
        case 2:
          return null;

        case 3:
          return NotificationPage();

        case 4:
          return NotificationPage();
        default:
          return null;
      }
  }

  Widget _appBarcontainer() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
//      leading: Builder(
//          builder: (BuildContext contex) {
//              return  IconButton(
//                icon: Icon(
//                    Icons.menu,
//                    color: Colors.grey),
//                onPressed: () {
//                },
//              );
//          }),
      actions: <Widget>[
        IconButton(
          icon: Icon(
              Icons.more_vert,
              color: Colors.grey),
          onPressed: () {

          },
        ),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _callContainerPage(_selectedIndex),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () { },
        backgroundColor: Colors.deepPurpleAccent,
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        iconSize: 23,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        items: [
         new BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            title: Text(''),
          ),
         new BottomNavigationBarItem(
           icon: Icon(Icons.location_on),
           title: Text(''),
          ),
         new BottomNavigationBarItem(
           icon: Icon(Icons.dashboard, color: Colors.transparent),
           title: Text(''),
         ),
         new BottomNavigationBarItem(
            icon: new Stack(children: <Widget>[
              new Icon(Icons.notifications),
              new Positioned(
                  top: -1.0,
                  right: -1.0,
                  child: new Stack(
                    children: <Widget>[
                      new Icon(
                        Icons.brightness_1,
                        size: 12.0,
                        color: const Color(0xFF2845E7),
                      ),
                    ],
                  )
                )
              ]
            ),
            title: Text(''),
          ),
         new BottomNavigationBarItem(
           icon: Icon(Icons.account_circle),
           title: Text(''),
         ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
}
