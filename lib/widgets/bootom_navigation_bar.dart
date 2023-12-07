import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom BottomNavigationBar')),
      body: const Center(child: Text('This is the body')),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          5,
          (index) => _buildIcon(index),
        ),
      ),
    );
  }

  Widget _buildIcon(int index) {
    IconData? iconData;
    switch (index) {
      case 0:
        iconData = Icons.home;
        break;
      case 1:
        iconData = Icons.search;
        break;
      case 2:
        iconData = Icons.add;
        break;
      case 3:
        iconData = Icons.notifications;
        break;
      case 4:
        iconData = Icons.person;
        break;
    }

    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          color: _selectedIndex == index ? Colors.blue : Colors.grey[300],
          width: 50,
          height: 50,
          child: Icon(
            iconData,
            color: _selectedIndex == index ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
