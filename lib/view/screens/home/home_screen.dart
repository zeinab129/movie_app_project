import 'package:flutter/material.dart';
import 'package:movie_app_project/data/provider/my_provider.dart';
import 'package:movie_app_project/style/my_colors.dart';
import 'package:movie_app_project/view/screens/home/tabs/browse_tab.dart';
import 'package:movie_app_project/view/screens/home/tabs/movie_home_tab.dart';
import 'package:movie_app_project/view/screens/home/tabs/search_tab.dart';
import 'package:movie_app_project/view/screens/home/tabs/watch_list_tab.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "HOME_SCREEN";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Scaffold(
      backgroundColor: MyColors.bgColor,
      body: screens[provider.index],
      bottomNavigationBar:  BottomNavigationBar(
          iconSize: 28,
          selectedFontSize: 8,
          unselectedFontSize: 8,
          currentIndex: provider.index,
          onTap: provider.changeIndex,
          items: const [
            BottomNavigationBarItem(
                activeIcon: GradientIcon(
                  icon: ImageIcon(
                    AssetImage('assets/images/ic_home.png'),
                  ),
                ),
                icon: ImageIcon(
                  AssetImage('assets/images/ic_home.png'),
                ),
                label: 'HOME'),
            BottomNavigationBarItem(
                activeIcon: GradientIcon(
                  icon: ImageIcon(
                    AssetImage('assets/images/ic_search.png'),
                  ),
                ),
                icon: ImageIcon(
                  AssetImage('assets/images/ic_search.png'),
                ),
                label: 'SEARCH'),
            BottomNavigationBarItem(
                activeIcon: GradientIcon(
                  icon: ImageIcon(
                    AssetImage('assets/images/ic_browse.png'),
                  ),
                ),
                icon: ImageIcon(
                  AssetImage('assets/images/ic_browse.png'),
                ),
                label: 'BROWSE'),
            BottomNavigationBarItem(
                activeIcon: GradientIcon(
                  icon: ImageIcon(
                    AssetImage('assets/images/ic_watch.png'),
                  ),
                ),
                icon: ImageIcon(
                  AssetImage('assets/images/ic_watch.png'),
                ),
                label: 'WATCHLIST'),
          ],
        ),

    );
  }
}

List<Widget> screens = [
  const MovieHomeTab(),
  const SearchTab(),
  const BrowseTab(),
  const WatchListTab(),
];

class GradientIcon extends StatelessWidget {
  final ImageIcon icon;

  const GradientIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) {
        return const RadialGradient(
          colors: <Color>[
            MyColors.primaryColor,
            MyColors.secondaryColor
          ],
        ).createShader(bounds);
      },
      child: icon,
    );
  }
}
