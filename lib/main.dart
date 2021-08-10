import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:registration_page_ui/otp.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/otp': (BuildContext context) => new OtpPage()
      },
      home: new MyHomePage(),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();

  TextEditingController phoneController = new TextEditingController();
  String phoneNumber = "";

  // ignore: unused_element
  void _onCountryChange(CountryCode countryCode) {
    this.phoneNumber = countryCode.toString();
    print("Full Text: " + this.phoneNumber + phoneController.text);
  }
}

class _MyHomePageState extends State<MyHomePage> {
  var check;

  get phoneController => null;

  get _onCountryChange => null;

  @override
  Widget build(BuildContext context) {
    final phone = new TextFormField(
      controller: phoneController,
      keyboardType: TextInputType.phone,
      autofocus: false,
      style: new TextStyle(
          fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w400),
    );
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.fromLTRB(20.0, 65.0, 0.0, 0.0),
                      child: Center(
                        child: Text('Verify your mobile number',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center),
                      )),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 125.0, 0.0, 0.0),
                    child: Text(
                        'Enter your phone number, so we will send you Verification Code.',
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center),
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    CountryCodePicker(
                      onChanged: _onCountryChange,
                      initialSelection: "ID",
                      favorite: ['+62', 'ID'],
                      showCountryOnly: true,
                      showOnlyCountryWhenClosed: true,
                      alignLeft: true,
                    ),
                    SizedBox(height: 16.0),
                    phone,
                    SizedBox(height: 40.0),
                    Container(
                      height: 40.0,
                      child: Material(
                        shadowColor: Colors.greenAccent,
                        color: Colors.green,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/otp');
                          },
                          child: Center(
                            child: Text(
                              'Get The Code',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                  ],
                )),
            SizedBox(height: 15.0),
          ],
        ));
  }
}
