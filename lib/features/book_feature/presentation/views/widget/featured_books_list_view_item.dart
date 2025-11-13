import 'package:bookly_app/core/utils/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/book_feature/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/book_feature/presentation/views/widget/item_in_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListViewItem extends StatelessWidget {
  const FeaturedBooksListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                var book = state.books[index];
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
                    GoRouter.of(
                      context,
                    ).push('/bookDetails', extra: state.books[index]);
                  },
                  child: ItemInListView(imageUrl: imageUrl),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
