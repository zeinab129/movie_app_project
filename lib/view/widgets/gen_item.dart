import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_project/data/model/movie_model.dart';
import 'package:movie_app_project/view/screens/filtered_movies_list_screen.dart';

class GenItem extends StatelessWidget {
  Genres genre;
  Map<int, String> gens = {
    28: "action",
    12: "adv",
    16: "anim",
    35: "comedy",
    80: "crime",
    99: "doc",
    18: "drama",
    10751: "family",
    14: "fantasy",
    36: "history",
    27: "horror",
    10402: "music",
    9648: "mystery",
    10749: "romance",
    878: "science",
    10770: "tv",
    53: "thriller",
    10752: "war",
    37: "western"
  };

  GenItem({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, FilteredMoviesListScreen.routeName,
            arguments: "${genre.id}");
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: Image.asset(
              gens.containsKey(genre.id)
                  ? "assets/images/gens/ic_${gens[genre.id]}.png"
                  : "assets/images/gens/ic_general.png",
              height: 99.h,
              width: 158.w,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            genre.name ?? "",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
