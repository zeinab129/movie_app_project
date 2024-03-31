import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_project/style/my_colors.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Container(
        width: 97,
        decoration: BoxDecoration(
            color: MyColors.movieItemBgColor,
            borderRadius: BorderRadius.circular(4)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4), topRight: Radius.circular(4)),
                child: Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      child: Image.asset(
                        "assets/images/test/movie1.png",
                        height: 128,
                        width: 97,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Image.asset("assets/images/ic_add_bookmark.png", height: 36, width: 27,)
                  ],
                )
                // Image.asset("assets/images/movie.png", height: 128, width: 97, fit: BoxFit.fill,),
                ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rate_rounded,
                        color: MyColors.primaryColor,
                        size: 16,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "7.7",
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                  Text(
                    "Deadpool 2",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "2018  R  1h 59m",
                    style: GoogleFonts.inter(
                        color: MyColors.secondTextColor,
                        fontSize: 8,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
