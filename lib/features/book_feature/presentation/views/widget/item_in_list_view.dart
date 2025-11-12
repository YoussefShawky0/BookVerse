import 'package:flutter/material.dart';

class ItemInListView extends StatelessWidget {
  const ItemInListView({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.25,
        child: AspectRatio(
          aspectRatio: 2 / 2.7,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.vertical(
                top: Radius.circular(25),
                bottom: Radius.circular(25),
              ),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(imageUrl),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
