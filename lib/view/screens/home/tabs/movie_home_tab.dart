import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_project/data/api/api_manager.dart';
import 'package:movie_app_project/style/my_colors.dart';
import 'package:movie_app_project/view/widgets/movie_item.dart';
import 'package:movie_app_project/view/widgets/popular_movie_item.dart';
import 'package:movie_app_project/view/widgets/release_movie_item.dart';

class MovieHomeTab extends StatefulWidget {
  const MovieHomeTab({super.key});

  @override
  State<MovieHomeTab> createState() => _MovieHomeTabState();
}

class _MovieHomeTabState extends State<MovieHomeTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FutureBuilder(
            future: ApiManager.getPopular(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Something wrong happened!"),
                );
              }
              return ImageSlideshow(
                  width: double.infinity,
                  height: 290.h,
                  initialPage: 0,
                  autoPlayInterval: 5000,
                  indicatorColor: Colors.transparent,
                  indicatorPadding: 0.0,
                  indicatorBackgroundColor: Colors.transparent,
                  isLoop: true,
                  children: snapshot.data!.results!
                      .map((movie) => PopularMovieItem(
                            movie: movie,
                          ))
                      .toList());
            },
          ),
          Container(
            margin: EdgeInsets.only(top: 24.r),
            padding: EdgeInsets.all(12.r),
            width: double.infinity,
            color: MyColors.movieItemBgColor,
            height: 188.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "New Releases ",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(
                  height: 8.h,
                ),
                FutureBuilder(
                  future: ApiManager.getNewReleases(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("${snapshot.error.toString()}"),
                      );
                    }
                    return Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return ReleaseMovieItem(
                            movie: snapshot.data!.results![index],
                          );
                        },
                        itemCount: snapshot.data!.results!.length,
                        scrollDirection: Axis.horizontal,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:30.r, bottom: 16.r),
            padding: EdgeInsets.all(12.r),
            width: double.infinity,
            color: MyColors.movieItemBgColor,
            height: 250.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Recommended",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(
                  height: 8.h,
                ),
                FutureBuilder(
                  future: ApiManager.getRecommended(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text("Something Went Wrong!"),
                      );
                    }
                    return Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return MovieItem(
                              movie: snapshot.data!.results![index], isDetailsScreen: false,);
                        },
                        itemCount: snapshot.data!.results!.length,
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
    );
  }
}
