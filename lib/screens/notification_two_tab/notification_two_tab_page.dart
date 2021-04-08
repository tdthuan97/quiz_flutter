import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quiz_app/screens/widgets/pro4u_plot_widget.dart';

class Notification {
  final String content;
  final DateTime dateTime;
  final int type;

  Notification(
      {this.content, this.dateTime, this.type}); // 1 Dang hoat dong, 2 Luu tru;
}

class NotificationTwoTabPage extends StatefulWidget {
  @override
  _NotificationTwoTabPageState createState() => _NotificationTwoTabPageState();
}

class _NotificationTwoTabPageState extends State<NotificationTwoTabPage> {
  ScrollController verticalScrollController = ScrollController();
  List<Notification> listNotifications = [];
  int currentTab = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listNotifications.add(Notification(
        type: 1,
        content:
            'How can I have a villain restrain PCs in an "intelligent" way without killing or disabling some or all of them?',
        dateTime: DateTime.now()));
    listNotifications
        .add(Notification(type: 1, content: 'KKK', dateTime: DateTime.now()));
    listNotifications
        .add(Notification(type: 2, content: 'BBB', dateTime: DateTime.now()));
  }

  onChangedTab(int index) {
    setState(() {
      currentTab = index;
      print('curTan $currentTab');
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _body() {

      _itemNotification(Notification item) {
        String datetime =
            DateFormat('hh:mm aa dd/MM/yyyy').format(item.dateTime).toString();
        print('datetime $datetime');
        return Container(
          color: Color(0xffFFFFFF),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          padding: EdgeInsets.all(8.0),
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Stack(
            children: [
              Row(
                children: [
                  Container(
                      // padding: EdgeInsets.all(10.0),
                      height: 60.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // borderRadius: BorderRadius.all(Radius.circular(80.0)),
                      ),
                      child: Image.asset("assets/images/default.jpg",
                          fit: BoxFit.cover)
                      // ClipRRect(
                      //     borderRadius: BorderRadius.circular(10000.0),
                      //     child: Image.asset("assets/images/default.jpg",
                      //         fit: BoxFit.cover)
                      //     // user.avatar != null && user.avatar != ''
                      //     //     ? new FadeInImage(
                      //     //     image: NetworkImage(user.avatar),
                      //     //     placeholder:
                      //     //     AssetImage("assets/images/default.jpg"),
                      //     //     fit: BoxFit.cover)
                      //     //     : Image.asset("assets/images/default.jpg",
                      //     //     fit: BoxFit.cover)
                      //     ),
                      ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (item.content != null)
                          Text(
                            item.content,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(Icons.access_time,
                                size: 15, color: Colors.grey),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${datetime.split(' ')[0]} ${datetime.split(' ')[1]}',
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Icon(Icons.calendar_today,
                                size: 15, color: Colors.grey),
                            SizedBox(
                              width: 5,
                            ),
                            Text('${datetime.split(' ')[2]}',
                                style: TextStyle(color: Colors.grey)),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      }

      return Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // SizedBox(
            //   height: 10,
            // ),
            SizedBox(
              height: 10,
            ),
            if (currentTab == 0)
              ...listNotifications.map((e) {
                if (e.type == 1) return _itemNotification(e);
                return Container();
              }),
            if (currentTab == 1)
              ...listNotifications.map((e) {
                if (e.type == 2) return _itemNotification(e);
                return Container();
              }),
            // if (viewModel.loadingMore)
            //   Container(
            //     width: MediaQuery.of(context).size.width,
            //     height: 50,
            //     color: Colors.transparent,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: <Widget>[
            //         CircularProgressIndicator(
            //           valueColor: AlwaysStoppedAnimation<Color>(
            //               ThemePrimary.primaryColor),
            //         ),
            //         SizedBox(
            //           width: 15,
            //         ),
            //         Text(
            //           translation.text("COMMON.LOADING_DATA"),
            //           style: TextStyle(color: ThemePrimary.primaryColor),
            //         ),
            //       ],
            //     ),
            //   ),
            // if (viewModel.listMaterialRequisitions.length == 0)
            //   EmptyWidget(
            //     message: translation.text('COMMON.NO_INFORMATION'),
            //   ),
            // SizedBox(
            //   height: 20,
            // )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xffF7F8FD),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: Pro4UPlotWidget(
          verticalScrollController: verticalScrollController,
          title: 'Thông báo',
          tabs: [
            Tab(
              text: 'Đang hoạt động',
            ),
            Tab(
              text: 'Lưu trữ',
            )
          ],
          onChangedTab: onChangedTab,
          body: _body(),
        ),
      ),
    );
  }
}
