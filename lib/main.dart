import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_app/layout/cubit/blocObserver/blocObserver.dart';
import 'package:odc_app/layout/cubit/cubit.dart';
import 'package:odc_app/layout/cubit/states.dart';
import 'package:odc_app/modules/login/loginScreen.dart';
import 'package:odc_app/modules/onBorading/onBoradingScreen.dart';
import 'package:odc_app/shared/network/local/cacheHelper.dart';
import 'package:odc_app/shared/network/remote/dioHelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool onBoarding = CacheHelper.getData(key: 'onBoarding')??true;
  print(onBoarding);
  runApp(MyApp(onBoarding: onBoarding));
}

class MyApp extends StatelessWidget {
  final bool onBoarding;
  const MyApp({Key? key, required this.onBoarding}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()..getCourses(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'ODC',
              theme: ThemeData(primarySwatch: Colors.orange),
              home: onBoarding ? OnBordingScreen() : LogInScreen());
        },
      ),
    );
  }
}
