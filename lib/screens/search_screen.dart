import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram/constant/color.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<String> images = [
      'images/item1.png',
      'images/item2.png',
      'images/item3.png',
      'images/item4.png',
      'images/item5.png',
      'images/item6.png',
      'images/item7.png',
      'images/item8.png',
      'images/item9.png',
      'images/item10.png',
    ];
    return Scaffold(
      backgroundColor: greybackground,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _getSearchBox(),
            ),
            SliverToBoxAdapter(
              child: getHorizontallist(),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 17),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: images.length,
                  (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit
                              .fill, //we can also use fittedbox widget and put in a cliprrect widget
                          image: AssetImage(images[index]),
                        ),
                      ),
                    );
                  },
                ),
                gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  repeatPattern: QuiltedGridRepeatPattern.inverted,
                  pattern: [
                    QuiltedGridTile(2, 1),
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//
  Widget getHorizontallist() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Container(
        height: 23,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Container(
                width: 60,
                height: 23,
                decoration: BoxDecoration(
                  color: Color(0xff272B40),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'story',
                    style: TextStyle(
                      color: white,
                      fontFamily: 'GB',
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Column _getSearchBox() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 12,
            left: 18,
            right: 18,
          ),
          child: Container(
            height: 44,
            decoration: BoxDecoration(
              color: Color(0xff272B40),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Image.asset(
                  'images/icon_search_navigation.png',
                  color: white,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'search...',
                        hintStyle: TextStyle(
                          color: white,
                          fontFamily: 'GB',
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                Image.asset('images/icon_scan.png'),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
