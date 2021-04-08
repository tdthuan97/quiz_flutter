import 'package:flutter/material.dart';
import 'package:quiz_app/theme/theme_primary.dart';

class Pro4USliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double collapsedHeight;
  final double expandedHeight;
  final String coverImgUrl;
  final String title;
  final String collapsedTitle;
  final Widget expandedWidget;

  final List<Widget> actions;

  Pro4USliverHeaderDelegate(
      {this.collapsedHeight = kToolbarHeight,
      this.expandedHeight = 150,
      this.coverImgUrl,
      this.title,
      this.collapsedTitle,
      this.actions = const [],
      this.expandedWidget});

  @override
  double get minExtent => this.collapsedHeight * 1.5;

  @override
  double get maxExtent => this.expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  double makeBorderRadius(double shrinkOffset) {
    if (expandedHeight - shrinkOffset > 30) {
      return 30;
    } else {
      return expandedHeight - shrinkOffset;
    }
  }

  Color makeStickyHeaderBgColor(shrinkOffset) {
    final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
        .clamp(0, 255)
        .toInt();
    return ThemePrimary.primaryColor.withAlpha(alpha);
  }

  Color makeExpandedColor(double shrinkOffset) {
    final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
        .clamp(0, 255)
        .toInt();
    return ThemePrimary.primaryColor.withAlpha(255 - alpha);
  }

  double makeExpandedOpacity(double shrinkOffset) {
    return 1 - shrinkOffset / expandedHeight;
  }

  String makeTitle(double shrinkOffset) {
    if (collapsedTitle != null) {
      if (shrinkOffset >= maxExtent - minExtent) {
        return collapsedTitle;
      }
      return title;
    }
    return title;
  }

  Color makeStickyHeaderTextColor(shrinkOffset, isIcon) {
    // if (shrinkOffset <= 50) {
    //   return isIcon ? Colors.white : Colors.transparent;
    // } else {
    //   final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
    //       .clamp(0, 255)
    //       .toInt();
    //   return Color.fromARGB(alpha, 0, 0, 0);
    // }
    return Colors.white;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: this.maxExtent,
      width: MediaQuery.of(context).size.width,
      child: StatefulBuilder(builder: (context, stateSetter) {
        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            // Background image
            Opacity(
              opacity: makeExpandedOpacity(shrinkOffset),
              child: Container(
                  decoration: BoxDecoration(
                    color: ThemePrimary.primaryColor,
                    // borderRadius: BorderRadius.only(
                    //     bottomLeft:
                    //         Radius.circular(makeBorderRadius(shrinkOffset)))
                  ),
                  padding: EdgeInsets.only(top: collapsedHeight * 1.8),
                  child: expandedWidget),
            ),
            // Container(child: Image.network(this.coverImgUrl, fit: BoxFit.cover)),
            // Put your head back

            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Container(
                color: makeStickyHeaderBgColor(shrinkOffset),
                child: SafeArea(
                  bottom: false,
                  child: Container(
                    height: collapsedHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                            color: this.makeStickyHeaderTextColor(
                                shrinkOffset, true), // Return icon color
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        Expanded(
                          child: Text(
                            makeTitle(shrinkOffset),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: makeStickyHeaderTextColor(
                                    shrinkOffset, false)),
                          ),
                        ),
                        ...actions
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
