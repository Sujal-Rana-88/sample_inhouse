import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final VoidCallback onMenuTap;
  final VoidCallback onSearchTap;
  final VoidCallback onPrintTap;
  final VoidCallback onPeopleTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.onMenuTap,
    required this.onSearchTap,
    required this.onPrintTap,
    required this.onPeopleTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      color: Colors.cyan.shade400,
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: onMenuTap,
          ),
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: onSearchTap,
          ),
          SizedBox(width: 48), // Space for the floating action button
          IconButton(
            icon: const Icon(
              Icons.print,
              color: Colors.black,
            ),
            onPressed: onPrintTap,
          ),
          IconButton(
            icon: const Icon(
              Icons.people,
              color: Colors.black,
            ),
            onPressed: onPeopleTap,
          ),
        ],
      ),
    );
  }
}
