import 'package:flutter/material.dart';

class MainMember extends StatefulWidget {
  const MainMember({super.key});

  @override
  State<MainMember> createState() => _MainMemberState();
}

class _MainMemberState extends State<MainMember> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PCRU FOOD'),
      ),
    );
  }
}
