import 'package:flutter/material.dart';
import '../componets/news_item_list.dart';
import '../model/news_model.dart';
import '../service/api_service.dart';

class BreakingNewsScreen extends StatefulWidget {
  const BreakingNewsScreen({Key? key}) : super(key: key);

  @override
  State<BreakingNewsScreen> createState() => _BreakingNewsScreenState();
}

class _BreakingNewsScreenState extends State<BreakingNewsScreen> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future: apiService.getBreakingNews(),
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
