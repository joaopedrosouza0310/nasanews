import 'package:flutter/material.dart';
import 'package:internet_connectivity_checker/internet_connectivity_checker.dart';

class OnlineReminder extends StatelessWidget {
  final ConnectivityStatus status;

  const OnlineReminder(
    this.status, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 30,
      child: Text(
        status == ConnectivityStatus.online ? 'Online' : 'Offline',
        style: TextStyle(
          color:
              status == ConnectivityStatus.online ? Colors.green : Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
