import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_project/data/provider/my_provider.dart';
import 'package:movie_app_project/style/my_colors.dart';
import 'package:movie_app_project/view/widgets/movie_list_item.dart';
import 'package:provider/provider.dart';

class WatchListTab extends StatelessWidget {
  const WatchListTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding:
          EdgeInsets.only(left: 16.0.r, right: 16.0.r, top: 32.r, bottom: 14.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Watchlist",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Expanded(
            child: provider.model.movies!.isEmpty
                ? Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/ic_movie.png"),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "No movies added!",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: MyColors.whiteColor.withOpacity(0.6),
                                  fontSize: 13.sp),
                        )
                      ],
                    ),
                  )
                : ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Divider(
                        height: 1,
                        color: MyColors.greyColor,
                      );
                    },
                    itemBuilder: (context, index) {
                      return MovieListItem(
                        movie: provider.model.movies![index],
                        isFiltered: true,
                      );
                    },
                    itemCount: provider.model.movies!.length,
                  ),
          )
        ],
      ),
    );
  }
}
