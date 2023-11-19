import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
/*
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
*/
  
  return Scaffold(

    // we can use builder or Orientation Builder; both are same

/*    body: Builder(
      builder: (context) {
        if(mediaQuery.orientation == Orientation.portrait) {
          return portraitWidget(mediaQuery.size);
        }else {
          return landscapeWidget(mediaQuery.size);
        }
      },
    ),*/


  // we can use builder or Orientation Builder; both are same

    body: OrientationBuilder(
      builder: (context, orientation) {
        if(orientation == Orientation.portrait) {
          return portraitWidget(mediaQuery.size);
        }else {
          return landscapeWidget(mediaQuery.size);
        }
      },
    ),
  );

  }

  Widget portraitWidget(Size size) {
    return Center(
      child: Container(
        width: size.width * 0.8,
        height: size.height * 0.8,
        decoration: BoxDecoration(
          color: Colors.purple,
        ),
        child: Center(
          child: Text(
            "Portrait",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

    );
  }

  Widget landscapeWidget(Size size) {
    return Center(
      child: Container(
        width: size.width * 0.8,
        height: size.height * 0.8,
        decoration: BoxDecoration(
          color: Colors.yellow,
        ),
        child: Center(
          child: Text(
            "Landscape",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
