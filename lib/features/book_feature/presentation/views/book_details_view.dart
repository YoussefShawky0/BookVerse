import 'package:bookly_app/core/utils/launch_url.dart';
import 'package:bookly_app/features/book_feature/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/book_feature/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/book_feature/presentation/views/widget/book_button.dart';
import 'package:bookly_app/features/book_feature/presentation/views/widget/custom_book_details_appbar.dart';
import 'package:bookly_app/features/book_feature/presentation/views/widget/main_image_in_detail.dart';
import 'package:bookly_app/features/book_feature/presentation/views/widget/similar_custom_list_view.dart';
import 'package:bookly_app/features/book_feature/presentation/views/widget/text_in_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    if (widget.bookModel.volumeInfo.categories != null &&
        widget.bookModel.volumeInfo.categories!.isNotEmpty) {
      BlocProvider.of<SimilarBooksCubit>(
        context,
      ).fetchSimilarBooks(category: widget.bookModel.volumeInfo.categories![0]);
    } else {
      // If no categories, fetch with a default category or emit empty state
      BlocProvider.of<SimilarBooksCubit>(
        context,
      ).fetchSimilarBooks(category: 'Programming');
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            children: [
              // Custom App Bar
              const CustomBookDetailsAppBar(),
              MainImageInDetail(bookModel: widget.bookModel),
              TextInDetail(bookModel: widget.bookModel),
              BookButton(
                bookM: widget.bookModel,
                onPressed: () {
                  if (widget.bookModel.volumeInfo.previewLink != null) {
                    launchCustomURL(
                      context,
                      widget.bookModel.volumeInfo.previewLink!,
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'You can also like',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(height: 150, child: SimilarBooksListView()),
            ],
          ),
        ),
      ),
    );
  }
}
