import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_project/data/api/api_manager.dart';
import 'package:movie_app_project/style/my_colors.dart';
import 'package:movie_app_project/view/widgets/movie_list_item.dart';

class SearchTab extends StatefulWidget {
  SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  TextEditingController controller = TextEditingController();
  String searchString = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 42.0.r, horizontal: 32.0.r),
      child: Column(
        children: [
          SizedBox(
            width: 343.w,
            height: 50.h,
            child: TextField(
              controller: controller,
              onChanged: (value) {
                searchString = value;
                print(searchString);
                setState(() {});
              },
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: MyColors.whiteColor),
              cursorColor: MyColors.whiteColor,
              decoration: InputDecoration(
                fillColor: MyColors.greyColor,
                filled: true,
                hintText: 'Search',
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: MyColors.whiteColor.withOpacity(0.45)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.r),
                    borderSide:
                        const BorderSide(width: 1, color: MyColors.whiteColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.r),
                    borderSide:
                        const BorderSide(width: 1, color: MyColors.whiteColor)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.r),
                    borderSide:
                        const BorderSide(width: 1, color: MyColors.whiteColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.r),
                    borderSide:
                        const BorderSide(width: 1, color: MyColors.whiteColor)),
                prefixIcon: const Icon(
                  Icons.search,
                  color: MyColors.whiteColor,
                ),
              ),
            ),
          ),
          Expanded(
              child: searchString == "" || searchString == ""
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/ic_movie.png"),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "No movies found",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: MyColors.whiteColor.withOpacity(0.6),
                                  fontSize: 13.sp),
                        )
                      ],
                    )
                  : FutureBuilder(
                      future: ApiManager.getSearchedMovies(searchString),
                      builder: (context, snapshot) {
                        if(snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator(),);
                        }
                        if(snapshot.hasError) {
                          return const Center(child: Text("Something wrong happened!"),);
                        }
                        if(!snapshot.hasData){
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/ic_movie.png"),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "No movies found",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
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
                              isFiltered: false,
                            );
                          },
                          itemCount: snapshot.data!.results!.length,
                        );
                      }))
        ],
      ),
    );
  }
}
