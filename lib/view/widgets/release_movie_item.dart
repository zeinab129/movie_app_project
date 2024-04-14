import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_project/data/api/api_manager.dart';
import 'package:movie_app_project/data/model/movie_model.dart';
import 'package:movie_app_project/data/provider/my_provider.dart';
import 'package:movie_app_project/view/screens/movie_details_sreen.dart';
import 'package:provider/provider.dart';

class ReleaseMovieItem extends StatefulWidget {
  MovieDetailsModel movie;

  ReleaseMovieItem({super.key, required this.movie});

  @override
  State<ReleaseMovieItem> createState() => _ReleaseMovieItemState();
}

class _ReleaseMovieItemState extends State<ReleaseMovieItem> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      width: 97.w,
      height: 128.h,
      margin: EdgeInsets.symmetric(horizontal: 12.r),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.r)),
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
                      Navigator.pushNamed(context, MovieDetailsScreen.routeName,
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
              )
              // Image.asset("assets/images/movie.png", height: 128, width: 97, fit: BoxFit.fill,),
              ),
        ],
      ),
    );
  }
}
