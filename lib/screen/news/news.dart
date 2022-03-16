import 'package:flutter/material.dart';

import '../../components/itemNews.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Expanded(
        child: Container(
          height: 100,
          child: ItemsNews(),
        ),
      ),
    ));
  }
}
