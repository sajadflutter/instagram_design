import 'dart:ui';
import 'package:flutter/material.dart';

class ShareBottomSheet extends StatelessWidget {
  ShareBottomSheet({super.key, this.Controller});
  final ScrollController? Controller;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(36),
        topRight: Radius.circular(36),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 44),
              color: Color.fromRGBO(255, 255, 255, 0.09),
              child: _getGridContent(),
            ),
            Positioned(
              bottom: 47,
              child: ElevatedButton(
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 45, vertical: 13),
                  child: Text(
                    'send',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getGridContent() {
    return CustomScrollView(
      controller: Controller,
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 22),
                height: 5,
                width: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'share',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'GB',
                      fontSize: 24,
                    ),
                  ),
                  Image.asset(
                    'images/icon_share_bottomsheet.png',
                  ),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Container(
                height: 44,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.4),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Image.asset(
                      'images/icon_search_navigation.png',
                      color: Colors.white,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: 'search...',
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: 'GB',
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) => _getItemGrid(),
            childCount: 40,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
            mainAxisExtent: 100,
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(top: 100),
        ),
      ],
    );
  }

  Widget _getItemGrid() {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'images/profile.png',
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'amirahmadadibi',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: 'GB',
          ),
        ),
      ],
    );
  }
}
