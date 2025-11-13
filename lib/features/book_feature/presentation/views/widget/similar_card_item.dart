import 'package:bookly_app/features/book_feature/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SimilarCardItem extends StatelessWidget {
  const SimilarCardItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
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
        GoRouter.of(context).push('/bookDetails', extra: bookModel);
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
