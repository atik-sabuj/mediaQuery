import 'package:flutter/material.dart';

class BoxPage extends StatefulWidget {
  const BoxPage({super.key});

  @override
  State<BoxPage> createState() => _BoxPageState();
}

class _BoxPageState extends State<BoxPage> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return Scaffold(
      //appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width > 600 ? 40.0 : 20.0,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  //width: mediaQuery.size.width * 0.7,
                  height: mediaQuery.size.height * 0.10,
                  decoration: const BoxDecoration(
                      color: Colors.purple
                  ),

                ),

                Container(
                  //width: mediaQuery.size.width * 0.7,
                  height: mediaQuery.size.height * 0.40,
                  child: Image.network('https://media.istockphoto.com/id/1137892510/photo/narrow-creeks-with-river-stream-flowing-into-deep-mangrove-jungle-consisting-of-mainly.jpg?s=1024x1024&w=is&k=20&c=XTdkcRAgH4r8ktRJ7yytUqh74tKJkazDfRGlm_O3FOo=',
                  fit: BoxFit.cover,),
                  decoration: const BoxDecoration(
                      color: Colors.yellow
                  ),


                ),

                Container(
                  //width: mediaQuery.size.width * 0.7,
                  height: mediaQuery.size.height * 0.40,
                  child: Image.network('https://media.istockphoto.com/id/619639380/photo/view-of-lake-tana-near-bahir-dar-ethiopia.jpg?s=1024x1024&w=is&k=20&c=4UWNbtR28PM_ar1m-ZdHnQhuPsKXXoc4xkws6O2CMEk=',
                    fit: BoxFit.fill,),
                  decoration: const BoxDecoration(
                      color: Colors.red
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
