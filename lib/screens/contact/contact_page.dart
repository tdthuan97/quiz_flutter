import 'package:flutter/material.dart';
import 'package:quiz_app/screens/widgets/pro4u_plot_widget.dart';
import 'package:quiz_app/screens/widgets/vina_agro_plot_widget.dart';

class Contact {
  final String name;
  final String phone;

  Contact({this.name, this.phone});
}

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  ScrollController verticalScrollController = ScrollController();
  List<Contact> listContact = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listContact.add(Contact(
        name: 'Anh Giang - Trưởng Công an Phường Tân Bình',
        phone: '0909123777'));
    listContact.add(Contact(name: 'Anh Hội - Trưởng Công an Phường Tân Bình'));
  }

  @override
  Widget build(BuildContext context) {
    Widget _body() {

      _itemContact(Contact item) {
        return Container(
          color: Color(0xffFFFFFF),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Stack(
            children: [
              Row(
                children: [
                  Material(
                    borderRadius: BorderRadius.all(Radius.circular(80.0)),
                    elevation: 4.0,
                    child: Container(
                      // padding: EdgeInsets.all(10.0),
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // borderRadius: BorderRadius.all(Radius.circular(80.0)),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10000.0),
                          child: Image.asset("assets/images/default.jpg",
                              fit: BoxFit.cover)
                          // user.avatar != null && user.avatar != ''
                          //     ? new FadeInImage(
                          //     image: NetworkImage(user.avatar),
                          //     placeholder:
                          //     AssetImage("assets/images/default.jpg"),
                          //     fit: BoxFit.cover)
                          //     : Image.asset("assets/images/default.jpg",
                          //     fit: BoxFit.cover)
                          ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (item.name != null)
                          Text(
                            item.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        if (item.phone != null)
                          Text(
                            item.phone,
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          )
                      ],
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: Center(
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.phone,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white10,
                                  Colors.green,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
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
            // Text(translation.text('BUY_DETAILS.PURCHASE_HISTORY'),
            //     style: TextStyle(color: Colors.black54, fontSize: 16)),
            SizedBox(
              height: 10,
            ),
            ...listContact.map((e) {
              return _itemContact(e);
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
        onRefresh: () async{

        },
        child: Pro4UPlotWidget(
          verticalScrollController: verticalScrollController,
          title: 'Danh bạ',
          body: _body(),
        ),
      ),
    );
  }
}
