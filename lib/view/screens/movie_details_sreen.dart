import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_project/style/my_colors.dart';
import 'package:movie_app_project/view/widgets/category_item.dart';
import 'package:movie_app_project/view/widgets/movie_item.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const String routeName = "MOVIE_DETAILS_SCREEN";

  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: MyColors.bgColor,
      child: Scaffold(
          backgroundColor: MyColors.bgColor,
          appBar: AppBar(
            backgroundColor: MyColors.bgColor,
            elevation: 0.0,
            title: Text(
              "Dora and the lost city of gold",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20),
            ),
            centerTitle: true,
            leading: const Icon(
              Icons.arrow_back_rounded,
              color: MyColors.whiteColor,
              size: 24,
            ),
          ),
          body:SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      "assets/images/test/cover.png",
                      height: 217,
                      width: double.infinity,
                    ),
                    const Icon(
                      Icons.play_circle_fill_rounded,
                      color: MyColors.whiteColor,
                      size: 64,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dora and the lost city of gold",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "2019  PG-13  2h 7m",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(color: MyColors.secondTextColor),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.topStart,
                            children: [
                              ClipRRect(
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(4)),
                                  child: Image.asset(
                                    "assets/images/test/poster.png",
                                    width: 129,
                                    height: 199,
                                    fit: BoxFit.fill,
                                  )),
                              Image.asset(
                                "assets/images/ic_add_bookmark.png",
                                height: 36,
                                width: 27,
                              )
                            ],
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              height: 199,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GridView.builder(
                                    primary: true,
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisExtent: 22.0,
                                        mainAxisSpacing: 8,
                                        crossAxisSpacing: 8),
                                    itemBuilder: (context, index) {
                                      return CategoryItem(name: "Action");
                                    },
                                    itemCount: 4,
                                  ),
                                  Text(
                                    "Having spent most of her life exploring the jungle, nothing could prepare Dora for her most dangerous adventure yet — high school. ",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
                                    style: Theme.of(context).textTheme.bodySmall!.copyWith(color: MyColors.secondTextColor, fontSize: 13),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star_rate_rounded,
                                        color: MyColors.primaryColor,
                                        size: 30,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "7.7",
                                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  color: MyColors.movieItemBgColor,
                  height: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "More Like This",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return const MovieItem();
                          },
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
