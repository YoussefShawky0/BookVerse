import 'package:bookly_app/features/presentation/views/widget/custom_best_seller_listview.dart';
import 'package:flutter/material.dart';

class BestSellerList extends StatelessWidget {
  const BestSellerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Best Seller',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          CustomBestSellerListView(),
          // Add more widgets for the best seller list here
        ],
      ),
    );
  }
}
