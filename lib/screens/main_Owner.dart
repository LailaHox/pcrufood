import 'package:flutter/material.dart';

import '../utility/signOut.dart';

class MainOwner extends StatefulWidget {
  const MainOwner({super.key});

  @override
  State<MainOwner> createState() => _MainOwnerState();
}

class _MainOwnerState extends State<MainOwner> {
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
