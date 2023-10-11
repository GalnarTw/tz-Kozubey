import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tz/Three/presentation/bloc/cubit.dart';
import 'package:tz/assets/colors/colors.dart';
import 'package:tz/second/presentation/bloc/cubit.dart';
import 'first/presentation/bloc/cubit.dart';
import 'first/presentation/bloc/cubit_state.dart';
import 'first/presentation/screen.dart';
import 'locator.dart';
import 'locator.dart' as di;

void main() async {
  WidgetsFlutterBinding();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FirstCubit>(
          create: (context) => sl<FirstCubit>()..testFirst(),
        ),
        BlocProvider<SecondCubit>(
          create: (context) => sl<SecondCubit>()..testSecond(),
        ),
         BlocProvider<ThreeCubit>(
          create: (context) => sl<ThreeCubit>()..testThree(),
        ),
      ],
      child: MaterialApp(theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
        centerTitle: true,
        backgroundColor: colorWhite,
        ),
      ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: BlocBuilder<FirstCubit, FirstCubitState>(
            builder: (
              context,
              state,
            ) {
              return 
              const First();
            },
          ),
        ),
      ),
    );
  }
}
