import 'package:flutter/material.dart';

class GaleryAlbumContainer extends StatelessWidget {
  final String title;
  const GaleryAlbumContainer({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: 160,
      height: 168,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        image: const DecorationImage(
            fit: BoxFit.cover,
            scale: 200,
            image: AssetImage(
              'assets/images/back.jpeg',
            )),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w500,
                letterSpacing: 0.1,
                overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}
