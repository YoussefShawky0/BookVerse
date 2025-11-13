import 'package:bookly_app/features/book_feature/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

class MainImageInDetail extends StatelessWidget {
  const MainImageInDetail({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var imageUrl =
        bookModel.volumeInfo.imageLinks?.thumbnail ??
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIwGRkYl8_l5YTNjHBqCOrFhXVYvdXqOUzag&s';

    // Replace http with https for secure connection
    if (imageUrl.startsWith('http:')) {
      imageUrl = imageUrl.replaceFirst('http:', 'https:');
    }

    // For web, use CORS proxy to avoid CORS issues
    if (imageUrl.contains('books.google.com')) {
      imageUrl = 'https://corsproxy.io/?${Uri.encodeComponent(imageUrl)}';
    }

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
                  image: NetworkImage(imageUrl),
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
