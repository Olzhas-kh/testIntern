import 'package:flutter/material.dart';
import 'package:test_intern/const/colors.dart';

class NewsDescriptionWidget extends StatelessWidget {
  final String title;
  final String description;
  const NewsDescriptionWidget({
    super.key, required this.title, required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 33,),
        Text(
          
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w600,letterSpacing: 1),
        ),
        const SizedBox(
          height: 26,
        ),
        Text(
          description,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: ColorProject.white.withOpacity(0.8), letterSpacing: 0.5),
        ),
      ],
    );
  }
}
