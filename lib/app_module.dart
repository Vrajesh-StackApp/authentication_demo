import 'package:authentication_demo/pages/home_page.dart';
import 'package:authentication_demo/pages/second_page.dart';
import 'package:authentication_demo/utils/app_string.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module{
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(AppString.homePage, child: (_, __) => const HomePage(),),
    ChildRoute(AppString.secondPage, child: (_, args) => SecondPage(userData: args.data,),),
  ];
}