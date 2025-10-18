import 'package:bookly_app/features/presentation/views/home/widget/best_seller_list.dart';
import 'package:bookly_app/features/presentation/views/home/widget/custom_app_bar.dart';
import 'package:bookly_app/features/presentation/views/home/widget/featured_books_list_view_item.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(),
                const SizedBox(height: 10),
                // Constrain the horizontal ListView so it has a bounded height inside Column
                const SizedBox(
                  height: 210, // matches item height in ItemInListView
                  child: FeaturedBooksListViewItem(),
                ),
                const SizedBox(height: 20),
                const BestSellerList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
