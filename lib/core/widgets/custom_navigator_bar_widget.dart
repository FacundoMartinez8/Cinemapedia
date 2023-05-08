import 'package:flutter/material.dart';

class MyCustomNavigationBar extends StatefulWidget {
  // final int selectedIndex;
  // final Function(int) onItemSelected;

  MyCustomNavigationBar();

  @override
  _MyCustomNavigationBarState createState() => _MyCustomNavigationBarState();
}

class _MyCustomNavigationBarState extends State<MyCustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Buscar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favoritos',
        ),
      ],
    );
  }
}
