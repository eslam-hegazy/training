import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Cubit/Cubit.dart';
import 'package:news/Cubit/State.dart';
import 'package:news/wedget/itemnews.dart';

class Sports extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,state>(
      builder: (context,state){
        return ConditionalBuilder(
          condition: state is ! LoadingSportsNews,
          fallback: (context)=>Center(child: CircularProgressIndicator(),),
          builder: (context)=>ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index){
              return itemnews(NewsCubit.get(context).sports[index],context);
            },
            separatorBuilder: (BuildContext context,index)=>Divider(),
            itemCount: NewsCubit.get(context).sports.length,
          ),
        );
      },
      listener: (context,state){},
    );
  }
}
