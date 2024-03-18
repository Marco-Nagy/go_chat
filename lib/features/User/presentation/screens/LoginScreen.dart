import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_chat/core/theme/styes.dart';
import 'package:go_chat/core/utils/constant.dart';
import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var divWidth;
  final TextEditingController _phoneController = TextEditingController();
  static Country _selectedFilteredDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode('20');
  String _countryCode = _selectedFilteredDialogCountry.phoneCode;

  String _phoneNumber = "";
  var kMarginPadding = 16.0;
  var kFontSize = 13.0;

  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    divWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                  child: Text(
                    "Verify Your Phone number",
                    style: TextStyle(
                        fontFamily: akaya,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: tabColor),
                  ),
                ),
                const Text(
                  "Go Chat will send you SMS message \n(carrier charges may apply) to verify your phone number. Enter the country code and phone number.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                ListTile(
                  onTap: _openFilteredCountryPickerDialog,
                  title: _buildDialogItem(_selectedFilteredDialogCountry),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 22),
                  child: Row(
                    children: [
                      Container(
                          height: 42,
                          width: 80,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: tabColor, width: 1.5))),
                          child: Text(
                            _selectedFilteredDialogCountry.phoneCode,
                            style: const TextStyle(color: Colors.white, fontSize: 14),
                          )),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Container(
                            height: 42,
                            width: 80,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: tabColor, width: 1.5))),
                            child: TextField(
                              controller: _phoneController,
                              decoration: const InputDecoration(
                                  hintText: 'Phone Number',
                                  border: InputBorder.none,
                                  hintStyle:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const OtpScreen()));
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              width: 120,
              height: 40,
              decoration: BoxDecoration(
                color: tabColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Center(
                child: Text(
                  "Next",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }



  _openFilteredCountryPickerDialog() {
    showAdaptiveDialog(
      context: context,
      builder: (context) => Theme(
          data: Theme.of(context).copyWith(primaryColor: tabColor),
          child: CountryPickerDialog(
            titlePadding: const EdgeInsets.all(8.0),
            searchCursorColor: tabColor,
            searchInputDecoration: const InputDecoration(
              hintText: "Search",
            ),
            isSearchable: true,
            title: const Text("Select your phone code"),
            onValuePicked: (Country value) {
              setState(() {
                _selectedFilteredDialogCountry = value;
                _countryCode = value.phoneCode;
              });
            },
            itemBuilder: _buildDialogItem,
          )),
    );
  }

  Widget _buildDialogItem(Country country) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: tabColor, width: 1.5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CountryPickerUtils.getDefaultFlagImage(country),
          Text(
            ' ${country.phoneCode}',
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          Expanded(
              child: Text(
            ' ${country.name}',
            style: const TextStyle(color: Colors.white, fontSize: 14),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )),
          const Spacer(),
          const Icon(Icons.arrow_drop_down)
        ],
      ),
    );
  }
}
