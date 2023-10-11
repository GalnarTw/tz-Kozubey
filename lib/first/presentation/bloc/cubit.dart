// ignore_for_file: constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import '/first/data/http.dart';
import '../../data/model.dart';
import '/first/presentation/bloc/cubit_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class FirstCubit extends Cubit<FirstCubitState> {
  final GetFirstUrl getFirstUrl;
  FirstCubit({required this.getFirstUrl
      })
      : super(FirstEmpty());
  void testFirst() async {
    loadFirst();
  }

  void loadFirst() async {
    if (state is FirstLoading) return;
    final currentState = state;
    if (currentState is FirstLoaded) {
    }
    List<FirstModel> firstData = [];

    emit(FirstLoading());
    final failureOrFirstHome = await getFirstUrl.get();
    emit(FirstLoaded(
      firstData,
    ));

    firstData.add(failureOrFirstHome);
    emit(FirstLoaded(
      firstData,
    ));
  }
}
