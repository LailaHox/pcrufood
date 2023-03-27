import 'package:flutter/material.dart';

import '../utility/signOut.dart';

class MainRider extends StatefulWidget {
  const MainRider({super.key});

  @override
  State<MainRider> createState() => _MainRiderState();
}

class _MainRiderState extends State<MainRider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PCRU FOOD'), actions: <Widget>[
        IconButton(
            onPressed: () => signOut(),
            icon: Icon(
              Icons.exit_to_app_outlined,
            ))
      ]),
    );
  }
}
