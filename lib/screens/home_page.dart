import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions:  [
          Padding(
            padding: const EdgeInsets.only(top: 20,right: 20),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'رد کردن',
                style: TextStyle(color: Colors.grey,
                fontFamily: 'Lalezar',
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
