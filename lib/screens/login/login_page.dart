import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "/loginPage";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    _body() {
      __header() {
        return Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 50,
              ),
              Icon(
                Icons.ac_unit_outlined,
                size: 80,
                color: Colors.blue,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'P R O P E R T Y\nC U B E',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        );
      }

      __middle() {
        ___inputText(
            {TextEditingController controller, String hint, IconData icon}) {
          return Card(
            elevation: 2,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Color(0xffFFFFFF), width: 0.8),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  new Flexible(
                    child: new TextField(
                      decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(right: 10),
                          hintText: hint,
                          hintStyle: TextStyle(color: Colors.grey)),
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        ___buttonLogin() {
          return SizedBox(
            width: double.infinity,
            child: RaisedButton(
              textColor: Colors.white,
              padding: EdgeInsets.all(0.0),
              shape: StadiumBorder(),
              child: Container(
                height: 50,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  gradient: kPrimaryGradient,
                ),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              onPressed: () {
                print('Gradient RaisedButton clicked');
              },
            ),
          );
        }

        return Container(
          child: Column(
            children: [
              ___inputText(hint: 'Username', icon: Icons.person),
              SizedBox(
                height: 20,
              ),
              ___inputText(hint: 'Password', icon: Icons.lock),
              SizedBox(
                height: 20,
              ),
              ___buttonLogin(),
            ],
          ),
        );
      }

      __bottom() {
        ___buttonChangeLang({bool isSelected}) {
          return SizedBox(
            width: 35,
            height: 35,
            child: RaisedButton(
              elevation: 0,
              color: Color(0xffF7F8FD),
              textColor: Colors.white,
              padding: EdgeInsets.all(0.0),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color(0xffF7F8FD),
                    border: Border.all(
                        color: isSelected ? Colors.grey : Color(0xffF7F8FD),
                        width: 0.5)),
                child: Icon(
                  Icons.flag,
                  color: Colors.red,
                ),
              ),
              onPressed: () {
                print('Gradient RaisedButton clicked');
              },
            ),
          );
        }

        return Container(
          child: Column(
            children: [
              Text(
                'Terms of conditions',
                style: TextStyle(color: Colors.blue),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Forgot password ?',
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ___buttonChangeLang(isSelected: true),
                  ___buttonChangeLang(isSelected: false)
                ],
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        );
      }

      return OrientationBuilder(builder: (context, orientation) {
        return LayoutBuilder(builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: <Widget>[
                      __header(),
                      SizedBox(
                        height: 20,
                      ),
                      __middle(),
                      SizedBox(
                        height: 20,
                      ),
                      __bottom()
                    ],
                  ),
                ),
              ),
            ),
          );
        });
      });
    }

    return Scaffold(
      backgroundColor: Color(0xffF7F8FD),
      resizeToAvoidBottomPadding: false,
      body: _body(),
    );
  }
}

