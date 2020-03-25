import 'package:flutter/material.dart';

List<BottomNavigationBarItem> getBottomNavigationBarItems() {
  return <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      title: const Text('Search'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.group),
      title: const Text('Connect'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: const Text('Profile'),
    ),
  ];
}
