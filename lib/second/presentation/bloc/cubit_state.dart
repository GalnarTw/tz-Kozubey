import 'package:equatable/equatable.dart';
import 'package:tz/second/data/model.dart';

abstract class SecondCubitState extends Equatable {
  const SecondCubitState();

  @override
  List<Object> get props => [];
}

class SecondEmpty extends SecondCubitState {
  @override
  List<Object> get props => [];
}

class SecondLoading extends SecondCubitState {
}

class SecondLoaded extends SecondCubitState {
final List<SecondModel> secondModelList;

 const SecondLoaded(this.secondModelList,);

  @override
List<Object> get props => [secondModelList,];
 
}

class SecondError extends SecondCubitState {
  final String message;

  const SecondError({required this.message});
  
  @override
  List<Object> get props => [message];
}