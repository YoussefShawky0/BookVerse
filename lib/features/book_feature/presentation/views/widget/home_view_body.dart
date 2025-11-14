import 'package:bookly_app/features/book_feature/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/book_feature/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/book_feature/presentation/views/widget/best_seller_list.dart';
import 'package:bookly_app/features/book_feature/presentation/views/widget/custom_app_bar.dart';
import 'package:bookly_app/features/book_feature/presentation/views/widget/featured_books_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.wait([
            BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks(),
            BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks(),
          ]);
        },
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppBar(),
                  const SizedBox(height: 10),
                  // Constrain the horizontal ListView so it has a bounded height inside Column
                  const SizedBox(
                    height: 200, // matches item height in ItemInListView
                    child: FeaturedBooksListViewItem(),
                  ),
                  const SizedBox(height: 20),
                  const BestSellerList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
