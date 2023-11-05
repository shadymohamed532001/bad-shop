import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

class popmenu extends StatelessWidget {
  final List<String> menuItems = ['Item 1', 'Item 2', 'Item 3'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dropdown Menu Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dropdown Menu Demo'),
          leading: PopupMenuButton<String>(
            onSelected: (value) {
              // Do something with the selected value
            },
            itemBuilder: (BuildContext context) {
              return menuItems
                  .map((String item) =>
                      PopupMenuItem<String>(value: item, child: Text(item)))
                  .toList();
            },
            child: IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.bars,
                color: Colors.black,
                size: 20,
              ),
              onPressed: () {},
            ),
          ),
        ),
        body: const Center(
          child: Text('Press the menu icon.'),
        ),
      ),
    );
  }
}
