import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swasthya_setu/backend/authorization.dart';
import 'package:swasthya_setu/get_image/getimage.dart';
import 'package:swasthya_setu/pages/loginpage.dart';
import 'package:swasthya_setu/utils/colours.dart';
import 'package:swasthya_setu/utils/customcheckbox.dart';
import 'package:swasthya_setu/utils/customtextfield.dart';
import 'package:swasthya_setu/utils/toast.dart';

class SigninDoctorPage extends StatefulWidget {
  final Size size;
  const SigninDoctorPage({super.key, required this.size});

  @override
  State<SigninDoctorPage> createState() => _SigninDoctorPageState();
}


class _SigninDoctorPageState extends State<SigninDoctorPage> {

  final TextEditingController _getName = TextEditingController();
  final TextEditingController _getQualification = TextEditingController();
  final TextEditingController _getBio = TextEditingController();
  final TextEditingController _getAge = TextEditingController();
  final TextEditingController _getNumber = TextEditingController();
  final TextEditingController _getEmail = TextEditingController();
  final TextEditingController _getAddress = TextEditingController();
  final TextEditingController _getPassword = TextEditingController();

  static List<String> item = ["Male", "Female"];
  bool? pediatrician = false;
  bool? neurologist = false;
  bool? cardiologist = false;
  bool? dermatologist = false;
  bool? dentist = false;
  bool? physician = false;
  bool? homeopathy = false;
  bool? alopathy = false;
  bool? ayurved = false;
  bool? ent = false;
  String? dropDownvalue = item.first;
  Uint8List? _imagedp;
  @override
  Widget build(BuildContext context) {
    List<String> specializations = [];
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 199, 215, 180),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.02,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const LoginPage()));
                    },
                    child: const Text(
                      "Already Have Account? Click Here",
                      style: TextStyle(color: maingreen,fontSize: 20,fontFamily: 'Dosis-Regular'),
                    )),
                SizedBox(
                  height: constraints.maxHeight * 0.02,
                ),
                Stack(children: [
                  _imagedp != null
                      ? CircleAvatar(
                          backgroundImage: MemoryImage(_imagedp!),
                          radius: constraints.maxHeight * 0.1,
                        )
                      : CircleAvatar(
                          backgroundImage: const AssetImage("assets/dp.jpg"),
                          radius: constraints.maxHeight * 0.1,
                        ),
                  Positioned(
                    bottom: constraints.maxHeight * 0.01,
                    right: constraints.maxWidth * 0.02,
                    child: IconButton(
                      icon: Icon(Icons.add_a_photo,
                          size: constraints.maxHeight * 0.05),
                      onPressed: () async {
                        Uint8List dp = await getImage(ImageSource.gallery);

                        _imagedp = dp;
                        setState(() {});
                      },
                    ),
                  ),
                ]),
                Expanded(
                  child: ListView(
                    children: [
                      SizedBox(
                        height: constraints.maxHeight * 0.05,
                      ),
                      getTextField(
                          "Name", constraints.maxHeight * 0.05, _getName),
                      SizedBox(
                        height: constraints.maxHeight * 0.05,
                      ),
                      getTextField("Qualification",
                          constraints.maxHeight * 0.05, _getQualification),
                      SizedBox(
                        height: constraints.maxHeight * 0.05,
                      ),
                      getTextField(
                          "Bio", constraints.maxHeight * 0.05, _getBio),
                      SizedBox(
                        height: constraints.maxHeight * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: getTextNumberField(
                                "Exp.",
                                constraints.maxHeight * 0.05,
                                TextInputType.number,
                                _getAge),
                          ),
                          SizedBox(
                            width: constraints.maxWidth * 0.09,
                          ),
                          Expanded(
                              child: DropdownButton<String>(
                                  autofocus: true,
                                  focusColor: Colors.grey.shade200,
                                  dropdownColor: Colors.grey.shade200,
                                  value: dropDownvalue,
                                  items: item.map((String value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? value) {
                                    setState(() {
                                      dropDownvalue = value;
                                    });
                                  }))
                        ],
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.05,
                      ),
                      getTextField("Phone Number", constraints.maxHeight * 0.05,
                          _getNumber),
                      SizedBox(
                        height: constraints.maxHeight * 0.05,
                      ),
                      getTextField("Email Address",
                          constraints.maxHeight * 0.05, _getEmail),
                      SizedBox(
                        height: constraints.maxHeight * 0.05,
                      ),
                      Text(
                        "SELECT YOUR SPECIALIZATION",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: constraints.maxHeight * 0.05),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              GetCheckBox(isName: ent, name: "ENT", specializations: specializations,),
                              GetCheckBox(isName: physician, name: "Physician", specializations: specializations),
                              GetCheckBox(isName: dentist, name: "Dentist", specializations: specializations),
                            ],
                          ),
                          Row(
                            children: [
                              GetCheckBox(
                                  isName: pediatrician, name: "Pediatrician", specializations: specializations),
                              GetCheckBox(
                                  isName: cardiologist, name: "Cardiologist", specializations: specializations),
                            ],
                          ),
                          Row(
                            children: [
                              GetCheckBox(
                                  isName: neurologist, name: "Neurologist", specializations: specializations),
                              GetCheckBox(
                                  isName: dentist, name: "Dermatologist", specializations: specializations),
                            ],
                          ),
                          Row(
                            children: [
                              GetCheckBox(
                                  isName: homeopathy, name: "Homeopathy", specializations: specializations),
                              GetCheckBox(isName: alopathy, name: "Alopathy", specializations: specializations),
                              GetCheckBox(isName: ayurved, name: "Ayurvedic", specializations: specializations),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.05,
                      ),
                      Text(
                        "Clinic/Hospital Address",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: constraints.maxHeight * 0.03),
                      ),
                      getTextField(
                          "", constraints.maxHeight * 0.07, _getAddress),
                      SizedBox(
                        height: constraints.maxHeight * 0.05,
                      ),
                      getTextField("Password", constraints.maxHeight * 0.05,
                          _getPassword),
                      SizedBox(
                        height: constraints.maxHeight * 0.05,
                      ),
                      CupertinoButton(
                        onPressed: () {
                          if (_getAddress.text.isEmpty ||
                              _imagedp == null ||
                              _getAge.text.isEmpty ||
                              _getEmail.text.isEmpty ||
                              _getPassword.text.isEmpty ||
                              _getQualification.text.isEmpty ||
                              specializations.isEmpty) {
                            getScaffold("Some Enteries are not filled", context,
                                Colors.red);
                          } else {
                            Uint8List image = _imagedp!;
                            Authorization(
                                    FirebaseAuth.instance,
                                    "null by me",
                                    _getAge.text.trim(),
                                    _getAddress.text,
                                    _getEmail.text.trim(),
                                    "null by me",
                                    _getName.text.trim(),
                                    dropDownvalue!,
                                    _getBio.text,
                                    _getQualification.text,
                                    _getPassword.text.trim(),
                                    specializations,
                                    context,
                                    widget.size,_getNumber.text)
                                .signUpWithEmail(image);
                          }
                        },
                        color: maingreen,
                        child: const Text("Sign Up"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    ));
  }
}
