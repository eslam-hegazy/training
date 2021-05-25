import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Cubit/Cubit.dart';
import 'package:news/Cubit/State.dart';
import 'package:news/helper/network.dart';
import 'package:news/screens/Search.dart';

class myhome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return BlocConsumer<NewsCubit,state>(
        listener: (context,state){
          if(state is LoadingBussinessNews){
            return Center(child: CircularProgressIndicator(),);
          }
        },
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              title: Text("News App",style: TextStyle(fontWeight: FontWeight.bold),),
              actions: [
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_){
                    return Search();
                  }));
                }, icon: Icon(Icons.search)),
                IconButton(
                    onPressed: (){
                      NewsCubit.get(context).ChangeModeapp();
                    },
                    icon: Icon(Icons.brightness_4_outlined)),

              ],
            ),

            bottomNavigationBar: BottomNavigationBar(
              onTap: (index){
              NewsCubit.get(context).changeindex(index);
              },
              currentIndex: NewsCubit.get(context).current_index,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.orange,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.business_sharp),label: "Business"),
                BottomNavigationBarItem(icon: Icon(Icons.sports),label: "Sports"),
                BottomNavigationBarItem(icon: Icon(Icons.science),label: "Science"),
              ],
            ),
            body:NewsCubit.get(context).screens[NewsCubit.get(context).current_index],
          );
        },
      );
  }
}
