import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget itemnews(data,context){
  return InkWell(
    onTap: (){
      launch(data['url'],forceWebView: true,enableJavaScript: true);
    },
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              image:DecorationImage(
                image: NetworkImage("${data['urlToImage']}"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Text("${data['title']}",maxLines: 4,overflow: TextOverflow.ellipsis,style:Theme.of(context).textTheme.bodyText1,)),
                  Text("${data['publishedAt']}",style:Theme.of(context).textTheme.bodyText1,),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}