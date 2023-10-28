import 'package:flutter/material.dart';

class ButtonList extends StatefulWidget {
  @override
  _ButtonListState createState() => _ButtonListState();
}

class _ButtonListState extends State<ButtonList> {
  int activeButtonIndex = -1;

  void setActiveButton(int index) {
    setState(() {
      activeButtonIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomButton(
          label: 'Button 1',
          isActive: activeButtonIndex == 0,
          onPressed: () {
            setActiveButton(0);
          },
        ),
        CustomButton(
          label: 'Button 2',
          isActive: activeButtonIndex == 1,
          onPressed: () {
            setActiveButton(1);
          },
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onPressed;

  CustomButton({
    required this.label,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              color: isActive ? Colors.blue : Colors.black,
            ),
          ),
          Container(
            width: 40,
            height: isActive ? 2 : 0, // Show/hide line
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
