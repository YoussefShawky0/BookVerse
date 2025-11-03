import 'package:bookly_app/features/presentation/views/widget/book_rating.dart';
import 'package:flutter/material.dart';

class TextInDetail extends StatelessWidget {
  const TextInDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            'Loving Vincent',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Kyle Simpson',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          SizedBox(height: 5),
          BookRating(),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
