import 'package:flutter/material.dart';
import 'VolunteerHomePage.dart';


class VolunteerDashboard extends StatefulWidget {
  const VolunteerDashboard({Key? key}) : super(key: key);
  static String id = 'volenteer-dashboard';
  @override
  _VolunteerDashboardState createState() => _VolunteerDashboardState();
}

class _VolunteerDashboardState extends State<VolunteerDashboard> {

  dynamic loggedinUser = "";

  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;

  // List of widgets, on changing tab index of list will change and widget at that index will be rendered.
  static List<Widget> _widgetOptions = <Widget>[
    VolunteerHomePage(), // 1st page
    Text('Profile'),   // 2nd page
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Volunteer Dashboard'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),   // widegt from list will be rendered
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Requests',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}




