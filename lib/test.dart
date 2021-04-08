import 'package:flutter/material.dart';
import 'package:quiz_app/screens/widgets/custom_shape_appbar.dart';
import 'package:quiz_app/theme/theme_primary.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    Widget buildPlotsSelection() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Danh bạ',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {},
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverPersistentHeader(
                    pinned: true,
                    delegate: Pro4USliverHeaderDelegate(
                        title: '',
                        // actions: widget.actions,
                        collapsedTitle: 'abc',
                        // widget.children.isEmpty
                        //     ? null
                        //     : widget.children[widget.currentIndex].title,
                        expandedWidget: buildPlotsSelection())),
                // SliverAppBar(
                //   expandedHeight: 150.0,
                //   floating: false,
                //   pinned: true,
                //   flexibleSpace: FlexibleSpaceBar(
                //       centerTitle: true,
                //       title: Text("Collapsing Toolbar",
                //           style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 16.0,
                //           )),
                //       background: Image.network(
                //         "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                //         fit: BoxFit.cover,
                //       )),
                // ),
                SliverPersistentHeader(
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      labelColor: Colors.white,
                      indicatorColor: Colors.white,
                      indicatorWeight: 4,
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      unselectedLabelStyle:
                          TextStyle(fontWeight: FontWeight.normal),
                      unselectedLabelColor: Colors.white,
                      tabs: [
                        Tab(text: 'Đang hoạt động'),
                        Tab(text: "Lưu trữ"),
                      ],
                    ),
                  ),
                  pinned: true,
                ),
              ];
            },
            body: Center(
              child: Text("Sample text"),
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: ThemePrimary.primaryColor,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
