import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: mediaQuery.size.width * 0.7,
              height: mediaQuery.size.height * 0.5,
              decoration: const BoxDecoration(
                color: Colors.purple
              ),
            ),

            Container(
              width: mediaQuery.size.width * 0.3,
              height: mediaQuery.size.height * 0.6,
              decoration: const BoxDecoration(
                  color: Colors.yellow
              ),
            ),
          ],
        ),
    );

  }
}
