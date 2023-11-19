import 'dart:ui';

import 'package:flutter/material.dart';

class PracticePage extends StatelessWidget {
  const PracticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Design Example'),
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth < 600) {
              return _buildSmallScreenUI();
            } else {
              return _buildLargeScreenUI();
            }
          },
        ),
      ),
    );
  }

  Widget _buildSmallScreenUI() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 400,
            width: 300,
            color: Colors.red,
            child: Text('Small Screen UI 1'),
          ),
          Container(
            height: 300,
            width: 200,
            color: Colors.purple,
            child: Text('Small Screen UI 2'),
          ),
        ],
      ),
    );
  }

  Widget _buildLargeScreenUI() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 400,
            width: 300,
            color: Colors.yellow,
            child: Text('Big Screen UI 1'),
          ),
          Container(
            height: 300,
            width: 200,
            color: Colors.pinkAccent,
            child: Text('Big Screen UI 2'),
          ),
        ],
      ),
    );
  }
}
