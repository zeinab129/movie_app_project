import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_project/style/my_colors.dart';
import 'package:movie_app_project/view/widgets/movie_item.dart';
import 'package:movie_app_project/view/widgets/release_movie_item.dart';

class MovieHomeTab extends StatelessWidget {
  const MovieHomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 290,
            child: Stack(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      "assets/images/test/cover.png",
                      height: 217,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const Icon(
                      Icons.play_circle_fill_rounded,
                      color: MyColors.whiteColor,
                      size: 64,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 12, bottom: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
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
                      const SizedBox(width: 8,),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Dora and the lost city of gold",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "2019  PG-13  2h 7m",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: MyColors.secondTextColor),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            padding: const EdgeInsets.all(12),
            width: double.infinity,
            color: MyColors.movieItemBgColor,
            height: 188,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "New Releases ",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ReleaseMovieItem();
                    },
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                  ),
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
                  "Recommended",
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
    );

  }
}
