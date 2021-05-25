import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Cubit/Cubit.dart';
import 'package:news/Cubit/State.dart';
import 'package:news/wedget/itemnews.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,state>(
      listener: (context,state){},
      builder: (context,state){
        return  Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 10),
                child: TextFormField(
                  onChanged: (value){
                    NewsCubit.get(context).getSearch(value);
                  },
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: Theme.of(context).textTheme.bodyText1,
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ConditionalBuilder(
                  condition: state is ! LoadingSearchNews,
                  fallback: (context)=>Center(child: CircularProgressIndicator(),),
                  builder: (context)=>ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context,index){
                      return itemnews(NewsCubit.get(context).search[index],context);
                    },
                    separatorBuilder: (BuildContext context,index)=>Padding(
                      padding: const EdgeInsets.only(right: 10,left: 10),
                      child: Divider(color: Colors.white,),
                    ),
                    itemCount: NewsCubit.get(context).business.length,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
