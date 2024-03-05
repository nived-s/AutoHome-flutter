import 'package:flutter/material.dart';

class ModesPage extends StatefulWidget {
  const ModesPage({super.key});

  @override
  State<ModesPage> createState() => _ModesPageState();
}

class _ModesPageState extends State<ModesPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.purple,
        child: Text('Modes page'),
      ),
    );
  }
}