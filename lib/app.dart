import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/router/route.dart';
import 'core/services/di/service_locator.dart';
import 'core/utils/extensions.dart';
import 'feature/home/domain/use_case/home_use_case.dart';
import 'feature/home/presentation/home/bloc/home_bloc.dart';
import 'feature/home/presentation/home/home_page.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      supportedLocales: S.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: EasyLoading.init(builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      }),
      home: BlocProvider(
        create: (context) => HomeBloc(
          getIt<HomeUseCase>(),
        )..add(HomeInitEvent()),
        child: const HomePage(),
      ),
      onGenerateRoute: Routes.router.generator,
      theme: ThemeData(
        primarySwatch: Colors.red,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        // fontFamily: FontFamily.beVietNamPro,
      ),
    );
  }
}
