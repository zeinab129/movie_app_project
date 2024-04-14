import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_project/data/api/api_manager.dart';
import 'package:movie_app_project/data/provider/my_provider.dart';
import 'package:provider/provider.dart';

class PosterItem extends StatefulWidget {
  var movie;
  PosterItem({super.key, required this.movie});

  @override
  State<PosterItem> createState() => _PosterItemState();
}

class _PosterItemState extends State<PosterItem> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.all(
                Radius.circular(4.r)),
            child: CachedNetworkImage(
                imageUrl:
                "${ApiManager.IMAGE_BASE_URL}${widget.movie.posterPath}",
                width: 129.w,
                height: 199.h,
                fit: BoxFit.fill,
                placeholder: (context, url) => Center(
                    child: SizedBox(
                        width: 24.0.w,
                        height: 24.0.h,
                        child:
                        CircularProgressIndicator(
                          strokeWidth: 3.r,
                        ))),
                errorWidget: (context, url, error) =>
                    Container(
                      color: Colors.grey,
                      child: const Icon(
                        Icons
                            .image_not_supported_rounded,
                      ),
                    ))),
        InkWell(
          onTap: provider.isMovieAdded(widget.movie)?null :(){
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
    );
  }
}
