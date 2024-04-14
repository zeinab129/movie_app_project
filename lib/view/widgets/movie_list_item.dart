import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_project/data/api/api_manager.dart';
import 'package:movie_app_project/data/model/movie_model.dart';
import 'package:movie_app_project/data/provider/my_provider.dart';
import 'package:movie_app_project/style/my_colors.dart';
import 'package:movie_app_project/view/screens/movie_details_sreen.dart';
import 'package:provider/provider.dart';

class MovieListItem extends StatefulWidget {
  MovieDetailsModel movie;
  bool isFiltered;

  MovieListItem({super.key, required this.movie, required this.isFiltered});

  @override
  State<MovieListItem> createState() => _MovieListItemState();
}

class _MovieListItemState extends State<MovieListItem> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.r),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, MovieDetailsScreen.routeName,
              arguments: widget.movie.id);
        },
        child: Row(
          children: [
            widget.isFiltered
                ? Stack(
                    alignment: AlignmentDirectional.topStart,
                    children: [
                      CachedNetworkImage(
                          imageUrl:
                              "${ApiManager.IMAGE_BASE_URL}${widget.movie.backdropPath}",
                          width: 140.w,
                          height: 89.h,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Center(
                              child: SizedBox(
                                  width: 24.0.w,
                                  height: 24.0.h,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 3.r,
                                  ))),
                          errorWidget: (context, url, error) => Container(
                                color: Colors.grey,
                                child: const Icon(
                                  Icons.image_not_supported_rounded,
                                ),
                              )),
                      InkWell(
                        onTap: provider.isMovieAdded(widget.movie)
                            ? null
                            : () {
                                provider.addToWatchList(widget.movie);
                                print(
                                    "count = ${provider.model.movies!.length}");
                                setState(() {});
                              },
                        child: provider.isMovieAdded(widget.movie)
                            ? Image.asset(
                                "assets/images/ic_bookmark.png",
                                height: 36.h,
                                width: 27.w,
                              )
                            : Image.asset(
                                "assets/images/ic_add_bookmark.png",
                                height: 36.h,
                                width: 27.w,
                              ),
                      )
                    ],
                  )
                : CachedNetworkImage(
                    imageUrl:
                        "${ApiManager.IMAGE_BASE_URL}${widget.movie.backdropPath}",
                    width: 140.w,
                    height: 89.h,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                        child: SizedBox(
                            width: 24.0.w,
                            height: 24.0.h,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.r,
                            ))),
                    errorWidget: (context, url, error) => Container(
                          color: Colors.grey,
                          child: const Icon(
                            Icons.image_not_supported_rounded,
                          ),
                        )),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 185.w,
                    child: Text(
                      widget.movie.title ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    )),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                    width: 185.w,
                    child: Text(
                      widget.movie.releaseDate ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: MyColors.whiteColor.withOpacity(0.68),
                          fontSize: 13.sp),
                    )),
                SizedBox(
                  height: 4.h,
                ),
                SizedBox(
                    width: 185.w,
                    child: Text(
                      widget.movie.overview ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: MyColors.whiteColor.withOpacity(0.68),
                          fontSize: 13.sp),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
