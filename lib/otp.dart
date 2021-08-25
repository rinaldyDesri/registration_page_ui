import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPage extends StatefulWidget {
  final String phoneNumber;

  const OtpPage({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  // ignore: unused_element
  String get _phoneNumber => widget.phoneNumber;
  TextEditingController _pinCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.grey), onPressed: () => Navigator.of(context).pop(),),
                Text(
                  "Verification code sent!",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(""),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "We have sent you an SMS with a code to your number +62 85771XXXX",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.normal
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Wrong number? Edit",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.normal
              ),
            ),
            _pinCodeWidget(),
             Expanded(
              child: Align(
                alignment: Alignment.center,
                child: MaterialButton(
                  color: Colors.green,
                  minWidth: double.infinity,
                  height: 50,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/otp');
                  },
                  child: Text(
                    "Verify",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _pinCodeWidget() {
    return Container(
      child: Column(
        children: <Widget>[
          PinCodeTextField(
            controller: _pinCodeController,
            length: 6,
            backgroundColor: Colors.transparent,
            obscureText: true,
            autoDisposeControllers: false,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            onChanged: (pinCode) {
              print(pinCode);
            },
            appContext: context,
          ),
          Text("Enter your 6 digit code")
        ],
      ),
    );
  }
}
