import 'package:flutter/material.dart';

class CircularIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CircularIconButton({
    required this.icon,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  _CircularIconButtonState createState() => _CircularIconButtonState();
}

class _CircularIconButtonState extends State<CircularIconButton> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected; // Toggle selected state
        });
        if (widget.onPressed != null) {
          widget.onPressed!(); // Call the onPressed callback if provided
        }
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.all(8), // Add margin between buttons
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _isSelected ? Colors.white : Colors.transparent,
          border: Border.all(
            color: Colors.white,
            width: 1, // Always have a thin border
          ),
        ),
        child: Icon(
          widget.icon,
          size: 28,
          color: _isSelected ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}
