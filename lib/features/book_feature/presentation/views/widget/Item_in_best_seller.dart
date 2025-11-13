import 'package:bookly_app/core/constants/font.dart';
import 'package:bookly_app/features/book_feature/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/book_feature/presentation/views/widget/book_rating.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemInBestSeller extends StatelessWidget {
  const ItemInBestSeller({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    var imageUrl =
        book.volumeInfo.imageLinks?.thumbnail ??
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIwGRkYl8_l5YTNjHBqCOrFhXVYvdXqOUzag&s';

    // Replace http with https for secure connection
    if (imageUrl.startsWith('http:')) {
      imageUrl = imageUrl.replaceFirst('http:', 'https:');
    }

    // For web, use CORS proxy to avoid CORS issues
    // This is only needed for web - mobile/desktop work fine
    if (imageUrl.contains('books.google.com')) {
      imageUrl = 'https://corsproxy.io/?${Uri.encodeComponent(imageUrl)}';
    }

    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push('/bookDetails', extra: book);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: SizedBox(
          width: double.infinity - 40,
          height: 120,
          child: Row(
            children: [
              // Book Image
              Container(
                width: 80,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              // Book Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    // Book Title and Author
                    Text(
                      book.volumeInfo.title!,
                      maxLines: 2,
                      style: const TextStyle(
                        fontFamily: FontConstants.kGtSectraBook,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      book.volumeInfo.authors!.join(', '),
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Price and Favorite
                    Row(
                      children: [
                        Text(
                          'Free',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        BookRating(
                          publishedDate: book.volumeInfo.publishedDate!,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
