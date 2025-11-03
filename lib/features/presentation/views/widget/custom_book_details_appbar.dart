import 'package:flutter/material.dart';

class CustomBookDetailsAppBar extends StatelessWidget {
  const CustomBookDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.close_rounded,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Spacer(),
          IconButton(
            icon: const Icon(
              Icons.shopping_cart_outlined,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
