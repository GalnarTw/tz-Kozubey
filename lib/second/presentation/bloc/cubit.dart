// ignore_for_file: constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import '/second/data/http.dart';
import '/second/data/model.dart';
import '/second/presentation/bloc/cubit_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class SecondCubit extends Cubit<SecondCubitState> {
  final GetSecondUrl getSecondUrl;
  SecondCubit({required this.getSecondUrl
      })
      : super(SecondEmpty());
  void testSecond() async {
    loadSecond();
  }

  void loadSecond() async {
    if (state is SecondLoading) return;
    final currentState = state;
    if (currentState is SecondLoaded) {
    }
    List<SecondModel> secondData = [];

    emit(SecondLoading());
    final failureOrSecondHome = await getSecondUrl.get();
    emit(SecondLoaded(
      secondData,
    ));
    secondData.add(failureOrSecondHome);
    emit(SecondLoaded(
      secondData,
    ));
  }
}
