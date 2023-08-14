import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram/constant/color.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greybackground,
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                toolbarHeight: 80,
                //pinned: true, to scroll whole appbar

                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 18, top: 18),
                    child: Icon(Icons.menu),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'images/item10.png',
                    fit: BoxFit.cover,
                  ),
                ),
                bottom: PreferredSize(
                  child: Container(
                    height: 14,
                    decoration: BoxDecoration(
                      color: greybackground,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                  ),
                  preferredSize: Size.fromHeight(10),
                ),
                backgroundColor: greybackground,
                expandedHeight: 200,
              ),
              SliverToBoxAdapter(
                child: _getHeaderProfile(),
              ),
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: TabbarViewDelegate(
                  TabBar(
                    indicatorWeight: 2,
                    indicatorColor: pink,
                    indicatorPadding: EdgeInsets.only(
                      left: 18,
                      right: 18,
                      bottom: 4,
                    ),
                    tabs: [
                      Tab(
                        icon: Image.asset('images/icon_tab_posts.png'),
                      ),
                      Tab(
                        icon: Image.asset('images/icon_tab_bookmark.png'),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              _CustomScroll(),
              _CustomScroll(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _CustomScroll() {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(
            top: 20,
            right: 18,
            left: 18,
          ),
          sliver: SliverGrid(
            gridDelegate: SliverQuiltedGridDelegate(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              repeatPattern: QuiltedGridRepeatPattern.inverted,
              pattern: [
                QuiltedGridTile(1, 1),
                QuiltedGridTile(2, 2),
                QuiltedGridTile(1, 1),
                QuiltedGridTile(1, 1),
                QuiltedGridTile(1, 1),
              ],
            ),
            delegate:
                SliverChildBuilderDelegate(childCount: 10, (context, index) {
              return Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset('images/item$index.png'),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _getHeaderProfile() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              border: Border.all(color: pink, width: 2),
            ),
            child: Padding(
              padding: EdgeInsets.all(2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset('images/item1.png'),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Container(
            height: 70,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'امیراحمد برنامه نویس موبایل',
                    style: TextStyle(
                      fontFamily: 'SM',
                      fontSize: 14,
                      color: white,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'amirahmadadibii',
                    style: TextStyle(
                      fontFamily: 'GB',
                      fontSize: 14,
                      color: grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Image.asset(
            'images/icon_profile_edit.png',
          ),
        ],
      ),
    );
  }
}

class TabbarViewDelegate extends SliverPersistentHeaderDelegate {
  TabbarViewDelegate(this._tabBar);
  final TabBar _tabBar;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: greybackground, child: _tabBar);
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
