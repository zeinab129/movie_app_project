import 'package:flutter/material.dart';
import 'package:movie_app_project/style/my_colors.dart';

class CategoryItem extends StatelessWidget {
  String name;

  CategoryItem({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: MyColors.greyColor, width: 1)
      ),
      child: Text(
        name,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(color: MyColors.secondTextColor),
      ),
    );
  }
}
