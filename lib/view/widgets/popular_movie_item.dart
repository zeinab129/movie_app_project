import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_project/data/api/api_manager.dart';
import 'package:movie_app_project/style/my_colors.dart';
import 'package:movie_app_project/view/screens/movie_details_sreen.dart';
import 'package:movie_app_project/view/widgets/poster_item.dart';

import '../../data/model/movie_model.dart';

class PopularMovieItem extends StatelessWidget {
  MovieDetailsModel movie;

  PopularMovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 290.h,
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, MovieDetailsScreen.routeName,
                  arguments: movie.id);
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                CachedNetworkImage(
                    imageUrl:
                        "${ApiManager.IMAGE_BASE_URL}${movie.backdropPath}",
                    height: 217.h,
                    width: double.infinity.w,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                        child: SizedBox(
                            width: 32.0.w,
                            height: 32.0.h,
                            child: CircularProgressIndicator(
                              strokeWidth: 4.r,
                            ))),
                    errorWidget: (context, url, error) => Container(
                          color: Colors.grey,
                          child: const Icon(
                            Icons.image_not_supported_rounded,
                          ),
                        )),
                Icon(
                  Icons.play_circle_fill_rounded,
                  color: MyColors.whiteColor,
                  size: 64.r,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 21.r, bottom: 24.r),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                PosterItem(movie: movie),
                SizedBox(
                  width: 14.w,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 195.w,
                        child: Text(
                          movie.title ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        movie.releaseDate ?? "",
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
    );
  }
}
