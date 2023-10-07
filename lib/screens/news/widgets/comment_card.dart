import 'package:flutter/material.dart';
import 'package:test_intern/const/colors.dart';

class CommentCard extends StatelessWidget {
  final String name;
  final String comment;
  const CommentCard({
    super.key,
    required this.name,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ColorProject.purple,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorProject.greyBackgrounColor),
                    child: Icon(
                      Icons.person,
                      size: 16,
                      color: ColorProject.greyIconColor,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Text(
                      name,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.w600, letterSpacing: 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                comment,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: ColorProject.white.withOpacity(0.7),letterSpacing: 0.5),
              ),
            ]),
      ),
    );
  }
}
