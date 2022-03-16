import 'package:f_tutor_app/endPoints/dataNews.dart';
import 'package:flutter/material.dart';

import '../model/newsModal.dart';

class ItemsNews extends StatefulWidget {
  const ItemsNews({Key? key}) : super(key: key);

  @override
  _ItemsNewsState createState() => _ItemsNewsState();
}

class _ItemsNewsState extends State<ItemsNews> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<News>>(
        future: fetchNews(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: Text("Loading..."));
          } else {
            List<News>? news = snapshot.data;
            return Container(
                child: ListView.builder(
                    itemCount: news!.length,
                    itemBuilder: (context, position) {
                      return GestureDetector(
                        child: Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.blue),
                            child: Column(
                              children: [
                                Container(
                                    height: 30,
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Text(
                                          news[position].title.toString(),
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )),
                                Container(
                                    height: 70,
                                    child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          news[position].content.toString(),
                                        )))
                              ],
                            )),
                      );
                    }));
          }
        });
  }
}
