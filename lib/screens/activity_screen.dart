import 'package:flutter/material.dart';
import 'package:instagram/constant/color.dart';
import 'package:instagram/model/enums/activity_type_enum.dart';
import 'package:instagram/screens/home_Screen.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});
  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: greybackground,
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  text: 'Following',
                ),
                Tab(
                  text: 'You',
                ),
              ],
              labelStyle: TextStyle(
                color: white,
                fontSize: 16,
              ),
              indicatorColor: pink,
              indicatorWeight: 3,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _getSampleList(),
                  _getSampleList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getSampleList() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 20),
            child: Text(
              'New',
              style: TextStyle(
                fontFamily: 'GB',
                fontSize: 16,
                color: white,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 5,
            (context, index) {
              return getRow(ActivityStatus.following);
            },
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 20),
            child: Text(
              'Today',
              style: TextStyle(
                fontFamily: 'GB',
                fontSize: 16,
                color: white,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 5,
            (context, index) {
              return getRow(ActivityStatus.followback);
            },
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 20),
            child: Text(
              'This week',
              style: TextStyle(
                fontFamily: 'GB',
                fontSize: 16,
                color: white,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 5,
            (context, index) {
              return getRow(ActivityStatus.like);
            },
          ),
        ),
      ],
    );
  }

  Widget getRow(ActivityStatus status) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: pink,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(
            width: 7,
          ),
          SizedBox(
            width: 40,
            height: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset('images/profile.png'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'amirahmadadibii',
                      style: TextStyle(
                          color: white, fontSize: 12, fontFamily: 'GB'),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'started following',
                      style: TextStyle(
                          color: grey, fontSize: 12, fontFamily: 'GM'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'You',
                      style: TextStyle(
                        color: grey,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      ' 3min',
                      style: TextStyle(
                        color: grey,
                        fontSize: 12,
                        fontFamily: 'GM',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          _getActionActivity(status)
        ],
      ),
    );
  }

  Widget _getActionActivity(ActivityStatus status) {
    switch (status) {
      case ActivityStatus.following:
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: grey,
              width: 2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {},
          child: Text(
            'Massage',
            style: TextStyle(
              color: grey,
              fontSize: 12,
              fontFamily: 'GM',
            ),
          ),
        );
      case ActivityStatus.followback:
        return ElevatedButton(
          onPressed: () {},
          child: Text('follow'),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        );
      case ActivityStatus.like:
        return SizedBox(
          width: 40,
          height: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('images/profile.png'),
            ),
          ),
        );
      default:
        return ElevatedButton(
          onPressed: () {},
          child: Text('follow'),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        );
    }
  }
}
