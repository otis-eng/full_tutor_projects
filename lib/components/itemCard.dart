import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard(
      {Key? key,
      required List<String> this.name,
      required List<String> this.img,
      required int this.index})
      : super(key: key);
  final List<String> name;
  final List<String> img;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black26)),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image(
                  image: NetworkImage(img[index]),
                  height: 90,
                  fit: BoxFit.fill),
            ),
            Text(name[index]),
          ],
        ));
  }
}
