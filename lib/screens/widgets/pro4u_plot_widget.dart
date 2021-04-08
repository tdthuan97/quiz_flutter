import 'package:flutter/material.dart';
import 'package:quiz_app/theme/theme_primary.dart';

class Pro4UPlotWidget extends StatefulWidget {
  final ScrollController verticalScrollController;
  final String title;
  final List<Tab> tabs;
  final Function onChangedTab;
  final Widget body;
  final List<Widget> actions;

  const Pro4UPlotWidget({
    Key key,
    this.verticalScrollController,
    this.title,
    this.tabs = const [],
    this.onChangedTab,
    this.body,
    this.actions = const [],
  }) : super(key: key);

  @override
  _Pro4UPlotWidgetState createState() => _Pro4UPlotWidgetState();
}

class _Pro4UPlotWidgetState extends State<Pro4UPlotWidget> {
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
                '${widget.title}',
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

    return DefaultTabController(
      length: widget.tabs.length,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              elevation: 0,
              backgroundColor: ThemePrimary.primaryColor,
              expandedHeight: 120,
              floating: false,
              pinned: true,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                // print('constraints=' + constraints.toString());
                double top = constraints.biggest.height;
                return FlexibleSpaceBar(
                  centerTitle: false,
                  titlePadding:
                      EdgeInsets.only(left: top == 80.0 ? 40 : 20, bottom: 18),
                  collapseMode: CollapseMode.parallax,
                  title: Text(widget.title,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: Container(
                    color: ThemePrimary.primaryColor,
                  ),
                );
              }),
            ),
            // SliverPersistentHeader(
            //     pinned: true,
            //     delegate: Pro4USliverHeaderDelegate(
            //         title: '',
            //         actions: widget.actions,
            //         collapsedTitle: widget.title,
            //         // widget.children.isEmpty
            //         //     ? null
            //         //     : widget.children[widget.currentIndex].title,
            //         expandedWidget: buildPlotsSelection())),
            if (widget.tabs.length > 0)
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
                    tabs: widget.tabs,
                    onTap: widget.onChangedTab,
                  ),
                ),
                pinned: true,
              ),
            // SliverList(
            //   delegate: SliverChildListDelegate([
            //     Container(child:
            //         // widget.children.isEmpty
            //         //     ? null
            //         //     : widget.children
            //         )
            //   ]),
            // )
          ];
        },
        body: widget.body,
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
