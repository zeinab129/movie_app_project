import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_project/data/api/api_manager.dart';
import 'package:movie_app_project/style/my_colors.dart';
import 'package:movie_app_project/view/widgets/category_item.dart';
import 'package:movie_app_project/view/widgets/movie_item.dart';
import 'package:movie_app_project/view/widgets/poster_item.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const String routeName = "MOVIE_DETAILS_SCREEN";

  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var movieId = ModalRoute.of(context)!.settings.arguments as int;

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: MyColors.bgColor,
      child: FutureBuilder(
        future: ApiManager.getMovieDetails(movieId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text("Something Wrong happened!"),
            );
          }
          return Scaffold(
              backgroundColor: MyColors.bgColor,
              appBar: AppBar(
                backgroundColor: MyColors.bgColor,
                elevation: 0.0,
                title: Text(
                  snapshot.data?.title ?? "Movie Title",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 20.sp),
                ),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CachedNetworkImage(
                          imageUrl:
                              "${ApiManager.IMAGE_BASE_URL}${snapshot.data?.backdropPath}",
                          height: 217.h,
                          width: 412.w,
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
                          ),
                        ),
                        Icon(
                          Icons.play_circle_fill_rounded,
                          color: MyColors.whiteColor,
                          size: 64.r,
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 22.0.r, vertical: 13.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data?.title ?? "Movie Title",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            snapshot.data!.releaseDate ?? "Movie Release Date",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: MyColors.secondTextColor),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            children: [
                              PosterItem(movie: snapshot.data,),
                              Expanded(
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 11.0.r),
                                  height: 199.h,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GridView.builder(
                                        primary: true,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                mainAxisExtent: 22.0,
                                                mainAxisSpacing: 3.r,
                                                crossAxisSpacing: 8.r),
                                        itemBuilder: (context, index) {
                                          return CategoryItem(
                                              name: snapshot.data
                                                      ?.genres?[index].name ??
                                                  "");
                                        },
                                        itemCount:
                                            snapshot.data?.genres?.length,
                                      ),
                                      Text(
                                        snapshot.data?.overview ?? "",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 4,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                                color: MyColors.secondTextColor,
                                                fontSize: 13.sp),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star_rate_rounded,
                                            color: MyColors.primaryColor,
                                            size: 30.r,
                                          ),
                                          SizedBox(
                                            height: 6.h,
                                          ),
                                          Text(
                                            snapshot.data?.voteAverage!
                                                    .toStringAsFixed(1) ??
                                                "",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(fontSize: 18.sp),
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
                      margin: EdgeInsets.symmetric(vertical: 18.r),
                      padding: EdgeInsets.all(12.r),
                      width: double.infinity,
                      color: MyColors.movieItemBgColor,
                      height: 246.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "More Like This",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                          FutureBuilder(
                            future: ApiManager.getSimilarMovies(movieId),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              if (snapshot.hasError) {
                                print(snapshot.error);
                                return const Center(
                                  child: Text("Something went Wrong!"),
                                );
                              }
                              return Expanded(
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return MovieItem(
                                      movie: snapshot.data!.results![index],
                                      isDetailsScreen: true,
                                    );
                                  },
                                  itemCount: snapshot.data?.results?.length,
                                  scrollDirection: Axis.horizontal,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }
}
