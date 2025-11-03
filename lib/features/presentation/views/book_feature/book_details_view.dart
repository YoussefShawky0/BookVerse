import 'package:bookly_app/features/presentation/views/widget/book_button.dart';
import 'package:bookly_app/features/presentation/views/widget/custom_book_details_appbar.dart';
import 'package:bookly_app/features/presentation/views/widget/main_image_in_detail.dart';
import 'package:bookly_app/features/presentation/views/widget/similar_custom_list_view.dart';
import 'package:bookly_app/features/presentation/views/widget/text_in_detail.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: const Column(
          children: [
            // Custom App Bar
            CustomBookDetailsAppBar(),
            MainImageInDetail(),
            TextInDetail(),
            BookButton(),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'You can also like',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(height: 190, child: SimilarBooksListView()),
          ],
        ),
      ),
    );
  }
}
