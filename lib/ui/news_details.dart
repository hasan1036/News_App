import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:world_news/model/news_model.dart';

class NewsDetails extends StatefulWidget {
  final NewsModel newsModel;
  const NewsDetails({Key? key, required this.newsModel}) : super(key: key);

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.newsModel.title.toString()),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

            CachedNetworkImage(
              height: 250,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              imageUrl: widget.newsModel.urlToImage.toString(),
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
                  child: Text(widget.newsModel.source!.name.toString()),
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30)),
                ),
                const SizedBox(width: 8),
                Text(widget.newsModel.publishedAt.toString()),



              ],
            ),


            const SizedBox(width: 12),

            Text(widget.newsModel.title.toString()
            ),
            const SizedBox(width: 16),
            Text(widget.newsModel.description.toString()
            ),
            const SizedBox(width: 16),
            ElevatedButton(onPressed: ()async{
            final Uri uri = Uri.parse(widget.newsModel.url.toString());
            if(!await launchUrl(uri)){
              throw Exception('Could Not launch');
            }
              
            }, child: Text("Read More...."))


          ],
        ),
      ),
    );
  }
}
