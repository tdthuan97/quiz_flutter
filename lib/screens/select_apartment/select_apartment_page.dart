import 'package:flutter/material.dart';

class Block {
  final String address;
  final bool isSelected;
  final List<Apartment> listApartments;

  Block({this.address, this.isSelected = false, this.listApartments});
}

class Apartment {
  final String number;
  bool isSelected;

  Apartment({this.number, this.isSelected = false});
}

class SelectApartmentPage extends StatefulWidget {
  @override
  _SelectApartmentPageState createState() => _SelectApartmentPageState();
}

class _SelectApartmentPageState extends State<SelectApartmentPage> {
  final List<Block> blocks = [];

  int currentBlock = 0;

  Orientation orientation;

  @override
  void initState() {
    super.initState();
    blocks.add(
        Block(address: 'Nguyễn Hữu Thọ', isSelected: true, listApartments: [
      Apartment(number: 'X2-27-02'),
      Apartment(number: 'X2-27-01'),
    ]));
    blocks.add(
        Block(address: 'Nguyễn Tri Phương', isSelected: true, listApartments: [
      Apartment(number: 'X3-11-01'),
      Apartment(number: 'X3-11-02'),
      Apartment(number: 'X3-11-03'),
      Apartment(number: 'X3-11-04'),
    ]));
  }

  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;

    _iconClose() {
      return Positioned(
        left: 15,
        top: 30,
        child: Icon(Icons.close),
      );
    }

    _body() {
      __selectTheApartmentBlock() {
        __itemBlock(int index) {
          return InkWell(
            onTap: () {
              setState(() {
                currentBlock = index;
              });
              print('index $index');
            },
            child: Container(
              width: orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.width * 0.6
                  : MediaQuery.of(context).size.width * 0.5,
              // height: orientation == Orientation.portrait ? MediaQuery.of(context).size.width * 0.6 : MediaQuery.of(context).size.height * 0.25,
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.blue,
                child: Container(
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        blocks[index].address.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.home_work,
                        size: 50,
                        color: Colors.white,
                      )
                    ],
                  )),
                ),
              ),
            ),
          );
        }

        return Container(
          width: double.infinity,
          // color: Colors.red,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'Chọn khu căn hộ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(
                    left: blocks.length == 1
                        ? MediaQuery.of(context).size.width / 2 -
                            (MediaQuery.of(context).size.width * 0.3)
                        : 10),
                // height: MediaQuery.of(context).size.height * 0.35,
                height: orientation == Orientation.portrait
                    ? MediaQuery.of(context).size.width * 0.6
                    : MediaQuery.of(context).size.height * 0.25,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: blocks.length,
                    itemBuilder: (context, index) {
                      return __itemBlock(index);
                    }),
              ),
            ],
          ),
        );
      }

      __selectTheApartment() {
        __itemApartment(int index, Apartment item) {
          return InkWell(
            onTap: () {
              for (int i = 0;
                  i < blocks[currentBlock].listApartments.length;
                  i++) {
                if (blocks[currentBlock].listApartments[i] == item) {
                  blocks[currentBlock].listApartments[i].isSelected = true;
                } else {
                  blocks[currentBlock].listApartments[i].isSelected = false;
                }
              }
              setState(() {});
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: item.isSelected ? Colors.blue : Colors.white,
                child: Container(
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        size: 50,
                        color: item.isSelected ? Colors.white : Colors.blue,
                      ),
                      Text(
                        item.number.toString(),
                        style: TextStyle(
                            color:
                                item.isSelected ? Colors.white : Colors.black87,
                            fontSize: 16.0),
                      ),
                    ],
                  )),
                ),
              ),
            ),
          );
        }

        return Column(
          children: [
            Text(
              'Chọn căn hộ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
                fontSize: 16,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 24.0),
              height: MediaQuery.of(context).size.height * 0.35,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: blocks[currentBlock].listApartments.length,
                  itemBuilder: (context, index) {
                    return __itemApartment(
                        index, blocks[currentBlock].listApartments[index]);
                  }),
            ),
          ],
        );
      }

      return Column(
        children: [
          __selectTheApartmentBlock(),
          __selectTheApartment(),
        ],
      );
    }

    return Scaffold(
      // appBar: _appbar(),
      body: Stack(
        children: [_body(), _iconClose()],
      ),
    );
  }
}
