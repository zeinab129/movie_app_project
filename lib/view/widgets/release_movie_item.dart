import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReleaseMovieItem extends StatelessWidget {
  ReleaseMovieItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          width: 97,
          decoration: BoxDecoration(
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
                          "assets/images/test/movie3.png",
                          height: 127,
                          width: 97,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Image.asset("assets/images/ic_add_bookmark.png", height: 36, width: 27,)
                    ],
                  )
                // Image.asset("assets/images/movie.png", height: 128, width: 97, fit: BoxFit.fill,),
              ),
            ],
          ),
      ),
    );
  }
}
