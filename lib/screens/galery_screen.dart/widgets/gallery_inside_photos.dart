import 'package:flutter/material.dart';

class GalleryInsidePhotos extends StatelessWidget {
  final String title;
  final String imageUrl;
  const GalleryInsidePhotos({
    super.key, required this.title, required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: 105,
      height: 111,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        image: DecorationImage(
            fit: BoxFit.cover,
            scale: 200,
            image: NetworkImage(
              imageUrl,
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

  static Future<dynamic> showFullScreen(String imageUrl, BuildContext context) {
    return showDialog(
        builder: (BuildContext context) => StatefulBuilder(
              builder: (contex, setState) {
                return AlertDialog(
                  backgroundColor: Colors.transparent,
                  insetPadding: const EdgeInsets.all(2),
                  title: Column(
                    children: [
                      Container(
                        height: 389,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(imageUrl)),
                        ),
                        width: MediaQuery.of(context).size.width,
                      ),
                    ],
                  ),
                );
              },
            ),
        context: context);
  }
}