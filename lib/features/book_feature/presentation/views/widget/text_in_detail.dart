import 'package:bookly_app/features/book_feature/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/book_feature/presentation/views/widget/book_rating.dart';
import 'package:flutter/material.dart';

class TextInDetail extends StatelessWidget {
  const TextInDetail({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            bookModel.volumeInfo.title!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 5),
          Text(
            bookModel.volumeInfo.authors!.join(', '),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          SizedBox(height: 5),
          BookRating(publishedDate: bookModel.volumeInfo.publishedDate),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
