import 'package:flutter/material.dart';

import '../componets/news_item_list.dart';
import '../model/news_model.dart';
import '../service/api_service.dart';

class AllNewsScreen extends StatefulWidget {
  const AllNewsScreen({Key? key}) : super(key: key);

  @override
  State<AllNewsScreen> createState() => _AllNewsScreenState();
}

class _AllNewsScreenState extends State<AllNewsScreen> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiService.getAllNews(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            List<NewsModel>articlelist = snapshot.data ?? [];
            return ListView.builder(
                itemCount: articlelist.length,
                itemBuilder: (context, index){
                  return NewsItemList(newsModel: articlelist[index],);
                });
          }
          return Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }

}
