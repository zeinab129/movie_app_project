import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_project/data/api/api_manager.dart';
import 'package:movie_app_project/data/model/movie_model.dart';
import 'package:movie_app_project/data/provider/my_provider.dart';
import 'package:movie_app_project/style/my_colors.dart';
import 'package:movie_app_project/view/screens/movie_details_sreen.dart';
import 'package:provider/provider.dart';

class MovieItem extends StatefulWidget {
  MovieDetailsModel movie;
  bool isDetailsScreen;

  MovieItem({super.key, required this.movie, required this.isDetailsScreen});

  @override
  State<MovieItem> createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14.r),
      width: 97.w,
      height: 186.h,
      decoration: BoxDecoration(
          color: MyColors.movieItemBgColor,
          borderRadius: BorderRadius.circular(4.r),
          boxShadow: [BoxShadow(blurRadius: 2.r)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.r),
                  topRight: Radius.circular(4.r)),
              child: Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  InkWell(
                    onTap: () {
                      widget.isDetailsScreen
                          ? Navigator.pushReplacementNamed(
                              context, MovieDetailsScreen.routeName,
                              arguments: widget.movie.id)
                          : Navigator.pushNamed(
                              context, MovieDetailsScreen.routeName,
                              arguments: widget.movie.id);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(4.r)),
                      child: CachedNetworkImage(
                          imageUrl:
                              "${ApiManager.IMAGE_BASE_URL}${widget.movie.posterPath}",
                          height: 128.h,
                          width: 97.w,
                          fit: BoxFit.fill,
                          placeholder: (context, url) => Center(
                              child: SizedBox(
                                  width: 18.0.w,
                                  height: 18.0.h,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2.r,
                                  ))),
                          errorWidget: (context, url, error) => Container(
                                color: Colors.grey,
                                child: const Icon(
                                  Icons.image_not_supported_rounded,
                                ),
                              )),
                    ),
                  ),
                  InkWell(
                    onTap: provider.isMovieAdded(widget.movie)
                        ? null
                        : () {
                            provider.addToWatchList(widget.movie);
                            print("count = ${provider.model.movies!.length}");
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
              )),
          Padding(
            padding: EdgeInsets.all(6.0.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star_rate_rounded,
                      color: MyColors.primaryColor,
                      size: 16.r,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      widget.movie.voteAverage!.toStringAsFixed(1) ?? "",
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                ),
                Text(
                  widget.movie.title ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  widget.movie.releaseDate ?? "",
                  style: GoogleFonts.inter(
                      color: MyColors.secondTextColor,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
