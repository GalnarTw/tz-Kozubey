import 'package:equatable/equatable.dart';
import '/Three/data/model.dart';

abstract class ThreeCubitState extends Equatable {
  const ThreeCubitState();

  @override
  List<Object> get props => [];
}

class ThreeEmpty extends ThreeCubitState {
  @override
  List<Object> get props => [];
}

class ThreeLoading extends ThreeCubitState {
}

class ThreeLoaded extends ThreeCubitState {
  
final List<ThreeModel> threeModelList;

 const ThreeLoaded(this.threeModelList,);

  @override
List<Object> get props => [threeModelList,];
 
}

class ThreeError extends ThreeCubitState {
  final String message;

  const ThreeError({required this.message});
  
  @override
  List<Object> get props => [message];
}