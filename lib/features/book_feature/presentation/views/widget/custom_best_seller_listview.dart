import 'package:bookly_app/core/utils/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/book_feature/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/book_feature/presentation/views/widget/item_in_best_seller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBestSellerListView extends StatelessWidget {
  const CustomBestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: state.books.length,
    itemBuilder: (context, index) {
      return ItemInBestSeller(book: state.books[index]);
      
    },
  );
}else if (state is NewestBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
      }
      else {
      return const Center(child: CircularProgressIndicator());
      }
      },
    );
  }
}
