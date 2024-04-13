package com.example.native_test

import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val channelName = "native_channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        val method = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName)

        method.setMethodCallHandler {
            call, result ->
                when (call.method) {
                    "function_call" -> Toast.makeText(
                            this,
                            "Jared Pasiliao",
                            Toast.LENGTH_LONG
                    ).show()
                    "data_call" -> {
                        var username = "John Doe"

                        Toast.makeText(
                                this,
                                username,
                                Toast.LENGTH_LONG
                        ).show()

                        result.success(username)
                    }
                    "advance_function_call" -> {
                        var title : String = call.argument<String>("title")!!

                        result.success(
                                getBooks(title)
                        )
                    }
                    else -> result.notImplemented()
                }

        }
    }

    private var bookList : List<String> = listOf(
            "Mushoku Tensei",
            "Talentless Nana",
            "Puella Magi Madoka Magica",
            "Non Non Biyori",
            "Doraemon",
            "Yu Gi Oh",
            "Dragon Ball",
            "Naruto",
            "Gintama"
    )

    private fun getBooks(title: String) : List<String> {
        return bookList.filter { it.contains(title, ignoreCase = true) }
    }
}
