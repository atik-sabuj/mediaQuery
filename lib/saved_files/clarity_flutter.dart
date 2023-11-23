package com.bitbirds.noise_meter
import android.os.Bundle
import com.microsoft.clarity.Clarity
import com.microsoft.clarity.ClarityConfig




import io.flutter.embedding.android.FlutterActivity


class MainActivity: FlutterActivity() {


  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)


    val config = ClarityConfig("joos8fevel")
    Clarity.initialize(applicationContext, config)
  }


}
