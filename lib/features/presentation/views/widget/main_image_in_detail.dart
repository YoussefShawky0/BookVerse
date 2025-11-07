import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

class MainImageInDetail extends StatelessWidget {
  const MainImageInDetail({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        // GoRouter.of(context).push('/bookDetails');
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05,
          vertical: size.height * 0.0,
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          width: MediaQuery.of(context).size.width * 0.48,
          child: AspectRatio(
            aspectRatio: 2 / 2.55,
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
