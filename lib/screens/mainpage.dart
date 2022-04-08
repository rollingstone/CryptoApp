import 'package:crypto/screens/home.dart';
import 'package:crypto/screens/page2.dart';
import 'package:crypto/screens/page3.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MainPage());

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Page2(),
    Page3(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // very important as noted
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: _selectedIndex == 0
                    ? const Color(0xff273E7D)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(9),
              ),
              margin: const EdgeInsets.only(left: 50),
              child: Image.asset('assets/icons/Home.png'),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: _selectedIndex == 1
                    ? const Color(0xff273E7D)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(9),
              ),
              child: Image.asset('assets/icons/Activity.png'),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: _selectedIndex == 2
                    ? const Color(0xff273E7D)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(9),
              ),
              margin: const EdgeInsets.only(right: 50),
              child: Image.asset('assets/icons/Profile.png'),
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
