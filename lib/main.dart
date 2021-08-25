import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:registration_page_ui/otp.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/otp': (BuildContext context) => new OtpPage(
              phoneNumber: '',
            )
      },
      home: RegistrationScreen(),
    ));

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  static Country _selectedFilteredDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode("62");

  TextEditingController _phoneAuthController = TextEditingController();

  @override
  void dispose() {
    _phoneAuthController.dispose();
    super.dispose();
  }

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
                Text(''),
                Text(
                  "Verify your mobile number",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text('')
              ],
            ),
            SizedBox(height: 30),
            Text(
              "Enter your phone number, so we will send you Verification Code.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 50,
            ),
            ListTile(
              onTap: _openFilteredCountryPickerDialog,
              title: _buildDialogItem(_selectedFilteredDialogCountry),
            ),
            Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    width: 1.0,
                    color: Colors.green,
                  ))),
                  width: 80,
                  height: 42,
                  alignment: Alignment.center,
                  child: Icon(Icons.phone_android),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    child: TextField(
                      controller: _phoneAuthController,
                      decoration: InputDecoration(hintText: "Phone Number"),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  color: Colors.green,
                  minWidth: double.infinity,
                  height: 50,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/otp');
                  },
                  child: Text(
                    "Get The Code",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "By signing up, you agree to the Privacy and Terms of Service.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openFilteredCountryPickerDialog() {
    showDialog(
        context: context,
        builder: (_) => Theme(
              data: Theme.of(context).copyWith(primaryColor: Colors.blueGrey),
              child: CountryPickerDialog(
                titlePadding: EdgeInsets.all(8.0),
                searchCursorColor: Colors.black,
                searchInputDecoration: InputDecoration(
                  hintText: "Search",
                ),
                isSearchable: true,
                title: Text("Select your phone code"),
                onValuePicked: (Country country) {
                  setState(() {
                    _selectedFilteredDialogCountry = country;
                  });
                },
                itemBuilder: _buildDialogItem,
              ),
            ));
  }

  Widget _buildDialogItem(Country country) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.green, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          SizedBox(
            width: 8.0,
          ),
          Text("${country.name}"),
          SizedBox(
            width: 8.0,
          ),
          Text("(+${country.phoneCode})"),
          Spacer(),
          Icon(Icons.chevron_right)
        ],
      ),
    );
  }
}
