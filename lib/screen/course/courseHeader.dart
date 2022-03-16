import 'package:flutter/material.dart';
import '../../components/itemCard.dart';

class CourseHeader extends StatelessWidget {
  CourseHeader(this.nameUser, this.avatar);
  final String nameUser;
  final String avatar;
  final nameItems = const ["Khoá Học", "Hoàn Thành", "Đánh Giá"];
  final imgItems = const [
    "https://res.cloudinary.com/phankieuphuicloud/image/upload/v1625397753/imgAvatar/img3_bbtdps.jpg",
    "https://res.cloudinary.com/phankieuphuicloud/image/upload/v1625397753/imgAvatar/img3_bbtdps.jpg",
    "https://res.cloudinary.com/phankieuphuicloud/image/upload/v1625397753/imgAvatar/img3_bbtdps.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Color(0xFF363F93),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
            )),
        height: 200,
        child: Column(
          children: [
            // container top
            Container(
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(50)),
                  // border: Border(bottom: BorderSide(color: Colors.black54)),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child:
                          CircleAvatar(backgroundImage: NetworkImage(avatar)),
                    ),
                    Text(
                      "Hello: " + nameUser,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    )
                  ],
                )),
            // Container Bottom,
            Expanded(
                child: Container(
                    // color: Colors.red,
                    height: 150,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, position) {
                          return Padding(
                              padding: EdgeInsets.all(20),
                              child: ItemCard(
                                  name: nameItems,
                                  img: imgItems,
                                  index: position));
                        })))
          ],
        ));
  }
}
