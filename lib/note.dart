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
      body: SingleChildScrollView(
        child: Center(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final minWidthThreshold = 300.0; // Define your minimum width

              if (constraints.maxWidth < minWidthThreshold) {
                return _buildSmallScreenUI();
              } else {
                return _buildResponsiveUI();
              }
            },
          ),
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
            height: 200,
            width: 200,
            color: Colors.red,
            child: Text('Potriat Screen Color 1'),
          ),
          Container(
            height: 200,
            width: 150,
            color: Colors.purple,
            child: Text('Potriat Screen Color 2'),
          ),
        ],
      ),
    );
  }

  Widget _buildResponsiveUI() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 200,
            color: Colors.yellow,
            child: Text('Landscape Screen Color 1'),
          ),
          Container(
            height: 200,
            width: 150,
            color: Colors.pinkAccent,
            child: Text('Landscape Screen Color 2'),
          ),
          Container(
            height: 200,
            width: 200,
            color: Colors.purple,
            child: Text('Landscape Screen Color 3'),
          ),
          Container(
            height: 200,
            width: 150,
            color: Colors.blue,
            child: Text('Landscape Screen Color 4'),
          ),
        ],
      ),
    );
  }
}
