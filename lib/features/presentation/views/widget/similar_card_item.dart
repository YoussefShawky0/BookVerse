import 'package:flutter/material.dart';

class SimilarCardItem extends StatelessWidget {
  const SimilarCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // GoRouter.of(context).push('/bookDetails');
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
          child: AspectRatio(
            aspectRatio: 2 / 3.0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.vertical(
                  top: Radius.circular(25),
                  bottom: Radius.circular(25),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIwGRkYl8_l5YTNjHBqCOrFhXVYvdXqOUzag&s',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
