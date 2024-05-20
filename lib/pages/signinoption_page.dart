import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:swasthya_setu/pages/signin_as_doctor.dart';
import 'package:swasthya_setu/pages/signin_as_user.dart';
import 'package:swasthya_setu/utils/colours.dart';

class SignInOptionPage extends StatelessWidget {
  const SignInOptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: maingreen,
          /*appBar: AppBar(
            centerTitle: true,
            backgroundColor: maingreen,
            title: Text(
              "Swasthya Setu",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Dosis-Bold',
                  fontSize: size.height * 0.05),
            ),
          ),*/
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Swasthya Setu",style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Dosis-Bold',
                    fontSize: size.height * 0.05),
                ),
                Center(
                  child: Lottie.asset("assets/medical.json"),
                ),
                CupertinoButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SigninDoctorPage(size: size,)));
                  },
                  color: mainwhite,
                  child: const Text(
                    "I'm Doctor",
                    style: TextStyle(color: maingreen,fontSize: 30),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                CupertinoButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SigninUserPage(size: size)));
                  },
                  color: mainwhite,
                  child: const Text(
                    "I'm User ",
                    style: TextStyle(color: maingreen,fontSize: 30,fontFamily: 'Dosis-Bold'),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
