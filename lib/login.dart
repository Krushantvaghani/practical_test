import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practical_test/controllers/login_controller.dart';

import 'main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _ct = Get.put(LoginController());
  final fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
        child: Form(
          key: fromKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70,
                ),
                Text(
                  "Let's Sign You In.",
                  style: GoogleFonts.rubik(fontSize: 23, color: color, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  "To Continue, first Verify that it's You.",
                  style: GoogleFonts.rubik(fontSize: 18, color: color),
                ),
                SizedBox(
                  height: 80,
                ),
                Text(
                  "User name",
                  style: GoogleFonts.rubik(fontSize: 20, color: color),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: Get.height * 0.07,
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      controller: _ct.userName,
                      validator: (value) {
                        if (_ct.userName == null) {
                          return 'Enter correct userName!';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      cursorHeight: 20,
                      cursorColor: color,
                      decoration: InputDecoration(
                          border: InputBorder.none, contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  " Password",
                  style: GoogleFonts.rubik(fontSize: 20, color: color),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: Get.height * 0.07,
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      controller: _ct.pass,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter New Password";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      cursorHeight: 20,
                      cursorColor: color,
                      decoration: InputDecoration(
                          border: InputBorder.none, contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "Forgot Passord",
                    style: GoogleFonts.rubik(fontSize: 20, color: color, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 60,
                  width: Get.width * 0.9,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: color, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      if (fromKey.currentState!.validate()) {
                        _ct.login();
                        dataStorage.write('isLogged', true);
                      } else {
                        return null;
                      }
                    },
                    child: Text(
                      "Login",
                      style: GoogleFonts.rubik(fontSize: 21, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
