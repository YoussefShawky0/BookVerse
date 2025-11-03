import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.star, color: Colors.amber, size: 20),
          SizedBox(width: 4),
          Text(
            '4.5',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          SizedBox(width: 4),
          Text('(200)', style: TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
    );
  }
}
