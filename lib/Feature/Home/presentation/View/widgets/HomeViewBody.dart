import 'package:bag/Core/Uitls/MyTheme.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  bool _isVisible = false;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            onTap: _toggleVisibility,
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: MyTheme.greyColorBackGround),
              child: Row(
                children: [
                  AnimatedContainer(
                      duration: const Duration(milliseconds: 600),
                      transform: Matrix4.translationValues(
                          _isVisible ? 10 : 350, 2, 0),
                      child: const Icon(
                        Icons.search,
                        size: 28,
                      )),
                  Text('data'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
// material top bar 
