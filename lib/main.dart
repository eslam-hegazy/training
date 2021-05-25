import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Cubit/Cubit.dart';
import 'package:news/helper/localhelper.dart';

import 'Cubit/State.dart';
import 'helper/bloc_helper.dart';
import 'helper/network.dart';
import 'myhome.dart';
void main()async{
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await LocalHelper.init();
  DioHelper.init();
  bool isDark=LocalHelper.getData(key: 'isDark');
  runApp(myapp(isDark));
}
class myapp extends StatelessWidget{
  final bool isDark;
  myapp(this.isDark) ;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
      create: (context)=>NewsCubit()..getBussiness()..getSports()..getSciences()..ChangeModeapp(shared: isDark),
      child: BlocConsumer<NewsCubit,state>(
         listener: (context,state){},
        builder: (context,state){
           return MaterialApp(
             title: "My App",
             debugShowCheckedModeBanner: false,
             theme: ThemeData(
               textTheme: TextTheme(
                 bodyText1: TextStyle(
                   color: Colors.black,
                   fontWeight: FontWeight.bold,
                 ),
               ),
               floatingActionButtonTheme: FloatingActionButtonThemeData(
                 backgroundColor:Colors.white,
               ),
               scaffoldBackgroundColor: Colors.white,
               appBarTheme: AppBarTheme(
                 titleTextStyle: TextStyle(
                   color: Colors.black,
                   fontSize: 18,
                 ),
                 backgroundColor: Colors.white,
                 elevation: 0.0,
                 iconTheme: IconThemeData(
                   color: Colors.black,
                 ),
                 backwardsCompatibility: false,
               ),
             ),
             darkTheme: ThemeData(
               floatingActionButtonTheme: FloatingActionButtonThemeData(
                 backgroundColor:  Color(0xFF1A2026),
               ),
               bottomNavigationBarTheme: BottomNavigationBarThemeData(
                 backgroundColor:  Color(0xFF1A2026),
                 unselectedItemColor: Colors.grey,
               ),
               scaffoldBackgroundColor:Color(0xFF1A2026),
               appBarTheme: AppBarTheme(
                 titleTextStyle: TextStyle(
                   color: Colors.white,
                   fontSize: 18,
                 ),
                 iconTheme: IconThemeData(
                   color: Colors.white,
                 ),
                 backgroundColor: Color(0xFF1A2026),
                 elevation: 0.0,
                 backwardsCompatibility: false,
               ),
               textTheme: TextTheme(
                 bodyText1: TextStyle(
                   color: Colors.white,
                   fontWeight: FontWeight.bold,
                 ),
               ),
             ),
             themeMode: NewsCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
             home: myhome(),
           );
        },
      ),
    );
  }
}