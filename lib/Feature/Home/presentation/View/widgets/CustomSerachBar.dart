import 'package:bag/Core/Uitls/MyTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomSearchBar extends StatefulWidget {
  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar>
    with SingleTickerProviderStateMixin {
  bool _isSearchBarOpen = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleSearchBar() {
    setState(() {
      _isSearchBarOpen = !_isSearchBarOpen;
      if (_isSearchBarOpen) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22),
      decoration: BoxDecoration(
        color: MyTheme.greyColorBackGround,
        borderRadius: BorderRadius.circular(33),
      ),
      child: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              final offsetAnimation =
                  Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
                      .animate(animation);
              return ClipRect(
                child: SlideTransition(
                  position: offsetAnimation,
                  child: child,
                ),
              );
            },
            child: IconButton(
              key: ValueKey(_isSearchBarOpen),
              icon: _isSearchBarOpen
                  ? const Icon(
                      Icons.clear,
                      color: Colors.black,
                    )
                  : const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
              onPressed: _toggleSearchBar,
            ),
          ),
        ],
        title: _isSearchBarOpen
            ? TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.white.withOpacity(0.1),
                  filled: true,
                ),
                onFieldSubmitted: (value) {},
              )
            : const Text(
                'Custom App Bar',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
      ),
    );
  }
}
