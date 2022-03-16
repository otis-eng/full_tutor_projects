import 'package:flutter/material.dart';

import '../../components/itemRequest.dart';

class RequestScreen extends StatelessWidget {
  RequestScreen(int this.id);
  final int id;
  @override
  Widget build(BuildContext context) {
    var appbar = AppBar();
    double heigt = appbar.preferredSize.height;
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: heigt, left: 10, right: 10),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            child: const TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.find_in_page),
                    border: OutlineInputBorder(),
                    labelText: "Search Request")),
          ),
          Expanded(
              child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: ItemRequest(id),
          ))
        ],
      ),
    ));
  }
}
