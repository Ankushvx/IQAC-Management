import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Stack(
        children: [
          const Positioned(
            top: 136,
            left: 30,
            child: Text(
              'Create\nAccount',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 300),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 36, vertical: 8),
                      child: SizedBox(
                        height: 50,
                        child: Material(
                          elevation: 8,
                          //  shadowColor: Colors.black87,
                          // color: Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                          child: TextField(
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                              // filled: true,
                              // fillColor: Theme.of(context).focusColor, // Colors.white,
                              //    hintText: hint,
                              //   prefixIcon: Icon(iconData),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // const Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Padding(
          //     padding: EdgeInsets.only(top: 700),
          //     child: BottomText(),
          //   ),
          // )
        ],
      ),
    );
  }
}
