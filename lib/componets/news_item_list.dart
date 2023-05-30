import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:world_news/ui/news_details.dart';
import '../model/news_model.dart';

class NewsItemList extends StatelessWidget {
  final NewsModel newsModel;

  const NewsItemList({Key? key, required this.newsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsDetails(newsModel: newsModel)));
      },
      child: Container(
        padding: EdgeInsets.only(top: 0, bottom: 8, left: 8, right: 8),
        margin: EdgeInsets.only(top: 0, bottom: 12, left: 12, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            CachedNetworkImage(
              height: 250,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              imageUrl: newsModel.urlToImage.toString(),
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),


            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Container(
                  child: Text(newsModel.source!.name.toString()),
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30)),
                ),
                const SizedBox(width: 8),
                Text(newsModel.publishedAt.toString()),
              ],
            ),


            const SizedBox(width: 12),
            Text(newsModel.author == null
                ? ""
                : "Written By " + newsModel.author.toString()),
            const SizedBox(width: 12),
            Text(newsModel.title.toString()
            )
          ],
        ),
      ),
    );
  }
}
