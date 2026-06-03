import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.imagUrl});
  final String imagUrl;
  @override
  Widget build(BuildContext context) {
    final hasValidUrl =
        imagUrl.trim().isNotEmpty &&
        (imagUrl.startsWith('http://') || imagUrl.startsWith('https://'));

    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(13),
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: hasValidUrl
            ? CachedNetworkImage(
                errorWidget: (context, url, error) =>
                    const Icon(Icons.broken_image_outlined),
                imageUrl: imagUrl,
                fit: BoxFit.fill,
              )
            : const ColoredBox(
                color: Color(0x22111111),
                child: Icon(Icons.menu_book_rounded, color: Colors.white54),
              ),
      ),
    );
  }
}
