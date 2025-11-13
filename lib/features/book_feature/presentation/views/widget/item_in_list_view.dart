import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemInListView extends StatelessWidget {
  const ItemInListView({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.25,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: AspectRatio(
            aspectRatio: 2 / 2.7,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error_outline_sharp),
            ),
          ),
        ),
      ),
    );
  }
}
