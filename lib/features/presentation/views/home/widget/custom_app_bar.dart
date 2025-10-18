import 'package:bookly_app/core/utils/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 45, left: 30, right: 30, bottom: 10),
      child: Row(
        children: [
          Image.asset(AssetPaths.logo, height: 30),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.magnifyingGlass, size: 30),
          ),
        ],
      ),
    );
  }
}
