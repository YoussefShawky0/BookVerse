import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, this.publishedDate});

  final String? publishedDate;

  String _formatDate(String? date) {
    if (date == null || date.isEmpty) return 'N/A';

    try {
      // Handle different date formats
      if (date.length == 4) {
        // Only year
        return date;
      } else if (date.length >= 7) {
        // Full date or year-month
        final parts = date.split('-');
        if (parts.isNotEmpty) {
          return parts[0]; // Return year
        }
      }
      return date;
    } catch (e) {
      return date;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.calendar_today, color: Colors.grey, size: 16),
        const SizedBox(width: 4),
        Text(
          _formatDate(publishedDate),
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }
}
