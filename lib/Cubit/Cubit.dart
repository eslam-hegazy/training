import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/helper/localhelper.dart';
import 'package:news/helper/network.dart';
import 'package:news/screens/Business.dart';
import 'package:news/screens/science.dart';
import 'package:news/screens/sports.dart';

import 'State.dart';

class NewsCubit extends Cubit<state>{
  NewsCubit() : super(InitialState());

  static NewsCubit get(context)=>BlocProvider.of(context);
  int current_index=0;
  List screens=[
    Business(),
    Sports(),
    Science(),
  ];
   changeindex(int index){
    current_index=index;
    if(index==1){
      getSports();
    }
    emit(ChangeBottonNavigationBar());
  }
  List<dynamic> business=[];
  void getBussiness(){
     emit(LoadingBussinessNews());
     DioHelper.getData(url: "v2/top-headlines", query: {
       'country':'eg',
       'category':'business',
       'apiKey':'1bbab93cee8d475aaf0850e340510366',
     }).then((value) {
       business=value.data['articles'];
       print(business[0]['content']);
       emit(SuccessfulBussinessNews());
     }).catchError((error){

       emit(ErrorBussinessNews(error.toString()));
     });
  }
  List<dynamic> sports=[];
  void getSports(){
    emit(LoadingSportsNews());
    DioHelper.getData(url: "v2/top-headlines", query: {
      'country':'eg',
      'category':'sports',
      'apiKey':'1bbab93cee8d475aaf0850e340510366',
    }).then((value) {
      emit(SuccessfulSportsNews());
      sports=value.data['articles'];
      print(sports[0]['title']);
    }).catchError((error){
      emit(ErrorSportsNews(error.toString()));
    });
  }
  List <dynamic>science=[];
  void getSciences(){
    emit(LoadingScienceNews());
    DioHelper.getData(url: "v2/top-headlines", query: {
      'country':'eg',
      'category':'science',
      'apiKey':'1bbab93cee8d475aaf0850e340510366',
    }).then((value) {
      emit(SuccessfulScienceNews());
      science=value.data['articles'];
      print(science[0]['title']);
    }).catchError((error){
      emit(ErrorSciencesNews(error.toString()));
    });
  }
  List <dynamic>search=[];
  void getSearch(String value){
    emit(LoadingSearchNews());
    DioHelper.getData(url: "v2/everything", query: {
      'q':'$value',
      'apiKey':'1bbab93cee8d475aaf0850e340510366',
    }).then((value) {
      emit(SuccessfulSearchNews());
      search=value.data['articles'];
      print(search[0]['title']);
    }).catchError((error){
      emit(ErrorSearchNews(error.toString()));
    });
  }
  bool isDark=false;
  void ChangeModeapp({@required bool shared}){
    if(shared !=null){
      isDark=shared;
    }else{
      isDark =! isDark;
      LocalHelper.PutData(key: 'isDark', value: isDark).then((value) {
        print(value);
        emit(ChangeModeApp());
      });
    }
  }
}