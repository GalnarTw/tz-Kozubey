// ignore_for_file: constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import '/Three/data/http.dart';
import '/Three/data/model.dart';
import '/Three/presentation/bloc/cubit_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class ThreeCubit extends Cubit<ThreeCubitState> {
  final GetThreeUrl getThreeUrl;
  int index = 0;
  final turist = ['Первый', 'Второй', 'Третий', 'Четвертый', 'Пятый'];
  List<String> data = [];
  List<ThreeModel> threeData = [];
  ThreeCubit({required this.getThreeUrl}) : super(ThreeEmpty());
  void testThree() async {
    loadThree();
  }

  void increase() {
    emit(ThreeLoaded(threeData));
    index++;
    data.add('${turist[index]} турист');

  }

  void loadThree() async {
    if (state is ThreeLoading) return;
    final currentState = state;
    if (currentState is ThreeLoaded) {}

    emit(ThreeLoading());
    final failureOrThreeHome = await getThreeUrl.get();
    emit(ThreeLoaded(
      threeData,
    ));
    threeData.add(failureOrThreeHome);
    emit(ThreeLoaded(
      threeData,
    ));
  }
}
