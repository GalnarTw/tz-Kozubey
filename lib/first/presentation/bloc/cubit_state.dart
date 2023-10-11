import 'package:equatable/equatable.dart';
import '../../data/model.dart';

abstract class FirstCubitState extends Equatable {
  const FirstCubitState();

  @override
  List<Object> get props => [];
}

class FirstEmpty extends FirstCubitState {
  @override
  List<Object> get props => [];
}

class FirstLoading extends FirstCubitState {
}

class FirstLoaded extends FirstCubitState {
final List<FirstModel> firstModelList;

 const FirstLoaded(this.firstModelList,);

  @override
List<Object> get props => [firstModelList,];
 
}

class FirstError extends FirstCubitState {
  final String message;

  const FirstError({required this.message});
  
  @override
  List<Object> get props => [message];
}