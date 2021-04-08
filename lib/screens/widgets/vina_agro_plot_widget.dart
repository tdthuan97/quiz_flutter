import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'custom_shape_appbar.dart';

// class VinaAgroPlotWidgetItem {
//   String title;
//   Widget body;
//
//   VinaAgroPlotWidgetItem({@required this.title, @required this.body});
// }

class VinaAgroPlotWidget extends StatefulWidget {
  final ScrollController verticalScrollController;
  // final ScrollController horizontalScrollController;
  final String title;

  // final Function(int) onTap;
  // final currentIndex;
  final Widget children;
  // final Widget emptyWidget;

  // final List<Widget> actions;

  VinaAgroPlotWidget({
    this.verticalScrollController,
    // this.horizontalScrollController,
    this.title,
    this.children,
    // this.onTap,
    // this.actions = const [],
    // this.emptyWidget,
    // this.currentIndex = 0
  });

  @override
  _VinaAgroPlotWidgetState createState() => _VinaAgroPlotWidgetState();
}

class _VinaAgroPlotWidgetState extends State<VinaAgroPlotWidget> {
  final ItemScrollController itemScrollController = ItemScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget buildPlotsSelection() {
      // Widget buildPlotItem(int index) {
      //   bool selected = widget.currentIndex == index;
      //   return InkWell(
      //       onTap: () {
      //         itemScrollController.scrollTo(
      //             index: index, duration: Duration(milliseconds: 300));
      //         // if (widget.onTap != null) widget.onTap(index);
      //       },
      //       child: Container(
      //         margin: EdgeInsets.only(left: 10),
      //         child: Card(
      //           elevation: selected ? 5 : 0,
      //           color: selected ? Colors.white : ThemePrimary.primaryColor,
      //           child: Container(
      //             padding: EdgeInsets.all(5),
      //             alignment: Alignment.center,
      //             decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(5),
      //                 border: Border.all(color: Colors.white, width: 1.5)),
      //             child: Row(
      //               mainAxisSize: MainAxisSize.min,
      //               children: [
      //                 Icon(
      //                   FontAwesomeIcons.tree,
      //                   color:
      //                       selected ? ThemePrimary.primaryColor : Colors.white,
      //                   size: 20,
      //                 ),
      //                 SizedBox(
      //                   width: 10,
      //                 ),
      //                 Container(
      //                   constraints: BoxConstraints(maxWidth: 240),
      //                   child: Text(
      //                     widget.children[index].title,
      //                     maxLines: 2,
      //                     overflow: TextOverflow.ellipsis,
      //                     style: TextStyle(
      //                       color: selected
      //                           ? ThemePrimary.primaryColor
      //                           : Colors.white,
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ));
      // }

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
          // Expanded(
          //     flex: 3,
          //     child: widget.children.isEmpty
          //         ? (widget.emptyWidget ?? Container())
          //         : ScrollablePositionedList.builder(
          //             itemScrollController: itemScrollController,
          //             scrollDirection: Axis.horizontal,
          //             initialScrollIndex: widget.currentIndex,
          //             itemCount: widget.children.length,
          //             padding: EdgeInsets.all(10),
          //             itemBuilder: (_, index) {
          //               return buildPlotItem(index);
          //             },
          //           ))
        ],
      );
    }

    return CustomScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      controller: widget.verticalScrollController,
      slivers: [
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
        SliverList(
          delegate: SliverChildListDelegate([
            Container(child: widget.children
                // widget.children.isEmpty
                //     ? null
                //     : widget.children
                )
          ]),
        )
      ],
    );
  }
}
