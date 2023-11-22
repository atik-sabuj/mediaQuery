import 'dart:async';

import 'package:charts_painter/chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:noise_meter/noise_meter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_ , child) {

          return MaterialApp(
            title: 'Sonic Sound Meter',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: NoiseMeterApp(),
          );
        }
    );
  }
}

class NoiseMeterApp extends StatefulWidget {
  @override
  _NoiseMeterAppState createState() => _NoiseMeterAppState();
}

class _NoiseMeterAppState extends State<NoiseMeterApp> {
  bool _isRecording = false;
  NoiseReading? _latestReading;
  StreamSubscription<NoiseReading>? _noiseSubscription;
  NoiseMeter? noiseMeter;
  double higestVal=0;
  List<double> noiseList=[];
  Timer? _timer;
  // bool isInsAdLoaded = false;
  // late InterstitialAd interstitialAd;
  late BannerAd bannerAd;
  bool isAdLoaded = false;
  VersionStatus? version;
  String release = '';


  @override
  void initState() {
    //initInterstialAd();
    initBannerAd();
    _checkVersion();
    super.initState();
  }

  @override
  void dispose() {
    _noiseSubscription?.cancel();
    super.dispose();
  }

  void onData(NoiseReading noiseReading) async{

    setState(() {
      _latestReading = noiseReading;
      setHigestValue(_latestReading!.meanDecibel);
    });


  }
  void startContinuousLoop() {
    if (_timer == null || !_timer!.isActive) {
      _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {

        if(noiseList.length>=100){
          noiseList.clear();
        }
        // print('Function called at: ${DateTime.now()}');
        setState(() {
          noiseList.add(_latestReading!.meanDecibel);
        });
      });
    }
  }

  void stopContinuousLoop() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
  }


  void onError(Object error) {
    print(error);
    stop();
  }

  /// Check if microphone permission is granted.
  Future<bool> checkPermission() async => await Permission.microphone.isGranted;

  /// Request the microphone permission.
  Future<void> requestPermission() async =>
      await Permission.microphone.request();

  /// Start noise sampling.
  Future<void> start() async {
    // Create a noise meter, if not already done.
    noiseMeter ??= NoiseMeter();

    // Check permission to use the microphone.
    //
    // Remember to update the AndroidManifest file (Android) and the
    // Info.plist and pod files (iOS).
    if (!(await checkPermission())) await requestPermission();

    // Listen to the noise stream.
    _noiseSubscription = noiseMeter?.noise.listen(onData, onError: onError);
    startContinuousLoop();
    setState(() => _isRecording = true);

    //add
    if (isAdLoaded) {
      print('This is calleddddd 2');
      initBannerAd().show();
    }
  }

  /// Stop sampling.
  void stop() {
    _noiseSubscription?.cancel();
    stopContinuousLoop();
    setState(() => _isRecording = false);
  }



  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(

          body: Center(
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width.w,
                        height: 60.h,
                        margin: EdgeInsets.only(top: 20).r,
                        child: isAdLoaded
                            ? SizedBox(
                          height: bannerAd.size.height.toDouble().h,
                          width: bannerAd.size.width.toDouble().w,
                          child: AdWidget(
                            ad: bannerAd,
                          ),
                        )
                            : SizedBox(),
                      ),
                      Stack(children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 26.0).r,
                          child: SfRadialGauge(
                            animationDuration: 2000,

                            enableLoadingAnimation:true,
                            axes: <RadialAxis>[
                              RadialAxis(minimum: 0, maximum: 160, labelOffset: 20.sp,
                                  interval: 20,
                                  ticksPosition: ElementsPosition.inside,
                                  minorTicksPerInterval: 3,
                                  showLastLabel: true,
                                  axisLineStyle: AxisLineStyle(
                                      thicknessUnit: GaugeSizeUnit.factor,thickness: 0.08),
                                  majorTickStyle: MajorTickStyle(length: 20.w,thickness: 2.5.w,color: Colors.grey),
                                  minorTickStyle: MinorTickStyle(length: 12.w,thickness: 1.5.w,color: Colors.grey),
                                  axisLabelStyle: GaugeTextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14.sp ),

                                  ranges: <GaugeRange>[
                                    GaugeRange(startValue: 0, endValue: 65, color:Colors.green,sizeUnit: GaugeSizeUnit.factor,startWidth: 0.12.w,endWidth: 0.12.w,),
                                    GaugeRange(startValue: 65,endValue: 110,color: Colors.orange,sizeUnit: GaugeSizeUnit.factor,startWidth: 0.12.w,endWidth: 0.12.w,),
                                    GaugeRange(startValue: 110,endValue: 160,color: Colors.red,sizeUnit: GaugeSizeUnit.factor,startWidth: 0.12.w,endWidth: 0.12.w,)

                                    // GaugeRange(startValue: 0, endValue: 160, sizeUnit: GaugeSizeUnit.factor,startWidth: 0.12,endWidth: 0.12,
                                    //     gradient: SweepGradient(
                                    //         colors: const<Color>[Colors.green,Colors.yellow,Colors.red],
                                    //         stops: const<double>[0.0,0.5,0.7])
                                    // )
                                  ],

                                  pointers: <GaugePointer>[
                                    NeedlePointer(value:_latestReading==null?0:_latestReading!.meanDecibel, needleLength: 0.95.h, enableAnimation: true,
                                        animationType: AnimationType.slowMiddle, needleStartWidth: 1.5.w, needleEndWidth: 6.w, needleColor: Colors.red,
                                        knobStyle: KnobStyle(knobRadius: 0.09.r))],
                                  annotations: <GaugeAnnotation>[
                                    GaugeAnnotation(widget: Container(child:
                                    Column(
                                        children: <Widget>[
                                          Text('${_latestReading==null?0:_latestReading!.meanDecibel.toStringAsFixed(2)} db', style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.bold,color: Colors.black)),
                                          SizedBox(height: 20.h),
                                          Text('Max: ${higestVal.toStringAsFixed(0)} db', style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold)),
                                          // SizedBox(height: 10,),
                                          // Text(
                                          //   'Max: ${higestVal.toStringAsFixed(2)} dB',
                                          // ),
                                        ]
                                    )), angle: 90, positionFactor: 1.4)]

                              ),
                            ],

                          ),
                        ),

                        Positioned(
                          bottom: 0.h,
                          right: 0.w,
                          left: 0.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blueAccent,
                                  padding: EdgeInsets.all(16).w,
                                  shape: CircleBorder(),
                                ),
                                onPressed: (){
                                  setState(() {
                                    stop();
                                    noiseList.clear();
                                    _latestReading=null;
                                    higestVal=0.0;
                                  });
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.restart_alt,
                                      color: Colors.white,
                                      size: 30.sp,
                                    ),
                                    //SizedBox(width: 10), // Add some spacing between the icon and text
                                    // Text(
                                    //   _isRecording ? 'Stop' : 'Start',
                                    //   style: TextStyle(
                                    //     fontSize: 20,
                                    //     color: Colors.white,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20.w,),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: _isRecording ? Colors.red : Colors.green,
                                  padding: EdgeInsets.all(16).w,
                                  shape: CircleBorder(),
                                ),
                                onPressed: _isRecording ? stop : start,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      _isRecording ? Icons.stop : Icons.play_arrow_rounded,
                                      color: Colors.white,
                                      size: 30.sp,
                                    ),
                                    //SizedBox(width: 10), // Add some spacing between the icon and text
                                    // Text(
                                    //   _isRecording ? 'Stop' : 'Start',
                                    //   style: TextStyle(
                                    //     fontSize: 20,
                                    //     color: Colors.white,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )

                      ]),
                      Padding(
                        padding: EdgeInsets.only(top: 20,right: 10,bottom: 10,).r,
                        child: Container(height: 280.h,
                          child: LineChart(
                            LineChartData(
                              gridData: FlGridData(show: true),
                              titlesData: FlTitlesData(
                                show: true,
                                // bottomTitles: AxisTitles(),
                                //leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true,),axisNameWidget: Text('speed',style: TextStyle(fontSize: 10),)),
                                topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false,reservedSize: 20.h,),axisNameWidget: Text('Time (seconds)',style: TextStyle(fontSize: 10.sp),)),
                                rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false),axisNameWidget: Text('Sound (db/s)',style: TextStyle(fontSize: 10.sp),)),
                              ),
                              borderData: FlBorderData(show: true),
                              minX: 0,
                              maxX: 100,
                              minY: 40,
                              maxY: 160,

                              lineBarsData: [
                                LineChartBarData(
                                  spots: noiseList.asMap().entries.map((entry) {
                                    return FlSpot(entry.key.toDouble(), entry.value);
                                  }).toList(),
                                  isCurved: true,
                                  dotData: FlDotData(show: false),
                                  belowBarData: BarAreaData(show: false),
                                  color: Colors.red,
                                  barWidth: 2.w,
                                ),
                              ],
                            ),
                          ),),
                      )

                    ])),
          ),
          // floatingActionButton: FloatingActionButton(
          //   backgroundColor: _isRecording ? Colors.red : Colors.green,
          //   child: _isRecording ? Icon(Icons.stop) : Icon(Icons.mic),
          //   onPressed: _isRecording ? stop : start,
          // ),
        ),
      ),
    );
  }


  double setHigestValue(double value1){

    if(higestVal>value1){
      higestVal=higestVal;
    }
    else{
      higestVal=value1;
    }
    return higestVal;
  }

  // initInterstialAd() {
  //   print('THIS IS CALLED');
  //   InterstitialAd.load(
  //     adUnitId: AdHelper.interstitialAdUnitId,
  //     request: const AdRequest(),
  //     adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
  //       print('ADD IS LOADED');
  //       interstitialAd = ad;
  //       setState(() {
  //         isInsAdLoaded = true;
  //       });
  //       interstitialAd.fullScreenContentCallback =
  //           FullScreenContentCallback(onAdDismissedFullScreenContent: (ad) {
  //             initInterstialAd();
  //             // ad.dispose();
  //             // setState(() {
  //             //   isInsAdLoaded=true;
  //             // });
  //           });
  //     }, onAdFailedToLoad: (err) {
  //       interstitialAd.dispose();
  //       print('ADD ERROR ${err}');
  //     }),
  //   );
  // }

  initBannerAd() {
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: AdHelper.bannerAdUnitId,
        listener: BannerAdListener(onAdLoaded: (ad) {
          setState(() {
            isAdLoaded = true;
          });
        }, onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print(error);
          initBannerAd();
        }),
        request: const AdRequest());
    bannerAd.load();
  }




  void _checkVersion() async {
    final newVersion = NewVersionPlus(
      // iOSId: 'com.google.Vespa',
      androidId: 'com.bitbirds.noise_meter',
      // androidId: 'com.remit.danesh_exchange',
      // androidPlayStoreCountry: "es_ES" //support country code
    );

    // You can let the plugin handle fetching the status and showing a dialog,
    // or you can fetch the status and display your own dialog, or no dialog.

    const simpleBehavior = true;

    if (simpleBehavior) {
      basicStatusCheck(newVersion);
    }
  }

  basicStatusCheck(NewVersionPlus newVersion) async {
    version = await newVersion.getVersionStatus();

    print('APP version ${version!.storeVersion} ${version!.localVersion}');
    release = version!.releaseNotes ?? "";
    setState(() {});
    if (version!.canUpdate) {
      print('APP SHOULD BE UPDATED ${version!.storeVersion}');
      // setState(() {
      //   showWebview=false;
      // });

      return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: Text('New Version Available'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Current Version: ${version!.localVersion}'),
                SizedBox(height: 8.h),
                Text('New Version: ${version!.storeVersion}'),
                SizedBox(height: 16.h),
                Text(
                  'Please update to the latest version to access new features and improvements.',
                  style: TextStyle(fontSize: 16.sp),
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                child: Text(
                  'UPDATE NOW',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent),
                onPressed: () async {
                  Navigator.pop(context);
                  String url =
                      'https://play.google.com/store/apps/details?id=${newVersion.androidId}';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }

                },
              ),
            ],
          ));
    }

    // newVersion.showAlertIfNecessary(
    //   context: context,
    //   launchModeVersion: LaunchModeVersion.external,
    // );
    print(
        'Latest version is STORE :${version!.storeVersion}  LOCAL: ${version!.localVersion}');
    print(
        'Latest release String is ${version!.appStoreLink}  ${version!.localVersion} ${release}');
  }


}
