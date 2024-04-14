import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_project/data/api/api_manager.dart';
import 'package:movie_app_project/view/widgets/gen_item.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 16.0.r, vertical: 32.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Browse Category",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          FutureBuilder(
            future: ApiManager.getGenres(),
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
              return Expanded(
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, crossAxisSpacing: 38.r, mainAxisSpacing: 47.r, mainAxisExtent: 99.h, ),
                    itemBuilder: (context, index) {
                      return GenItem(genre: snapshot.data!.genres![index],);
                    },
                    itemCount: snapshot.data!.genres!.length,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
