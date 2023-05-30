
import 'dart:convert';

import 'package:http/http.dart';

import '../model/news_model.dart';
class ApiService{

final all_news_url = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=e9d917178ebb41039df4208284a8b3e6";
final breaking_news_url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=e9d917178ebb41039df4208284a8b3e6";



Future<List<NewsModel>>getAllNews()async{
  try{
    Response response = await get(Uri.parse(all_news_url));
    if(response.statusCode == 200){
            Map<String,dynamic> json = jsonDecode(response.body);
            List<dynamic>body = json['articles'];
            List<NewsModel>articleslist = body.map((item) => NewsModel.fromJson(item)).toList();
            return articleslist;

    }else{
      throw("No News Found");
    }
  }catch(e){
    throw e;
  }
}


  Future<List<NewsModel>>getBreakingNews()async{
    try{
      Response response = await get(Uri.parse(breaking_news_url));
      if(response.statusCode == 200){
        Map<String,dynamic> json = jsonDecode(response.body);
        List<dynamic>body = json['articles'];
        List<NewsModel>articleslist = body.map((item) => NewsModel.fromJson(item)).toList();
        return articleslist;

      }else{
        throw("No News Found");
      }
    }catch(e){
      print(e.toString());
      throw e;
    }
  }

}