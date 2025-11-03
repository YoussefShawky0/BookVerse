import 'package:bookly_app/core/constants/font.dart';
import 'package:bookly_app/features/presentation/views/widget/book_rating.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemInBestSeller extends StatelessWidget {
  const ItemInBestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push('/bookDetails');
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
                    image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIwGRkYl8_l5YTNjHBqCOrFhXVYvdXqOUzag&s',
                    ),
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
                    const Text(
                      'Best Seller Book Title Goes Here Book Title Goes Here',
                      maxLines: 2,
                      style: TextStyle(
                        fontFamily: FontConstants.kGtSectraBook,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      maxLines: 1,
                      'Author Name',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Price and Favorite
                    const Row(
                      children: [
                        Text(
                          '\$19.99',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        BookRating(),
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
