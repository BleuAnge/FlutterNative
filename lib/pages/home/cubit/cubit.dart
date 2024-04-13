import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final _channel = const MethodChannel("native_channel");

  Future<void> invokeToast() async {
    try {
      await _channel.invokeMethod("function_call");
    } on PlatformException catch (e) {
      debugPrint(e.message);
    }
  }

  Future<void> fetchVariable() async {
    try {
      final username = await _channel.invokeMethod("data_call");

      emit(
        HomeLoaded(
          username: username,
          books: const []
        )
      );
    } on PlatformException catch (e) {
      debugPrint(e.message);
    }
  }

  Future<void> findBooks({
    required String title
  }) async {
    try {
      final data = await _channel.invokeMethod(
        "advance_function_call", 
        {
          "title" : title
        }
      );

      emit(
        (state as HomeLoaded).copyWith(
          books: <String>[...data]
        )
      );

      // emit(
      //   HomeLoaded(username: username)
      // );
    } on PlatformException catch (e) {
      debugPrint(e.message);
    }
  }

  void goBack() => emit(HomeInitial());
}
