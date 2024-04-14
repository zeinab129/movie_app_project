import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_project/style/my_colors.dart';
import 'package:movie_app_project/view/widgets/movie_list_item.dart';

import '../../data/api/api_manager.dart';

class FilteredMoviesListScreen extends StatelessWidget {
  static const String routeName = "FILTERED_MOVIES_LIST_SCREEN";
  const FilteredMoviesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String genId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.bgColor,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: 12.0.r, left: 32.0.r, right: 32.0.r),
        child: FutureBuilder(
            future: ApiManager.getFilteredMovies(genId),
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
              if (!snapshot.hasData) {
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/ic_movie.png"),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "No movies found",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: MyColors.whiteColor.withOpacity(0.6),
                          fontSize: 13.sp),
                    )
                  ],
                );
              }
              return ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 1,
                    color: MyColors.greyColor,
                  );
                },
                itemBuilder: (context, index) {
                  return MovieListItem(
                    movie: snapshot.data!.results![index],
                    isFiltered: true,
                  );
                },
                itemCount: snapshot.data!.results!.length,
              );
            }),
      ),
    );
  }
}
