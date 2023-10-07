import 'package:flutter/material.dart';
import 'package:test_intern/const/colors.dart';

class NewsCardWidget extends StatelessWidget {
  final String title;
  final String description;
  const NewsCardWidget({
    super.key, required this.title, required this.description, 
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,),
      child: Container(
        height: 95,
        padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 32),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: ColorProject.purple,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(overflow: TextOverflow.ellipsis, letterSpacing: 1),
              maxLines: 1,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
                description,
                maxLines: 2,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(overflow: TextOverflow.ellipsis,color: ColorProject.white.withOpacity(0.8), letterSpacing: 0.5)),
          ],
        ),
      ),
    );
  }
}
