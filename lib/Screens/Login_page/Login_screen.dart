import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/ConstImages.dart';
import '../../constants/Const_Colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.skyWhite,
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          child: Container(
            width: 340,
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              border: Border.all(color: ConstColors.primaryColor),
              borderRadius: BorderRadius.circular(24),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(ConstImages.appLogo,height: 60,),
                    SizedBox(height: 10,),
                    Text("Log in to Dashboard",style: GoogleFonts.raleway(
                        textStyle: TextStyle(color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 16
                        ))),
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Email ID",
                            style: GoogleFonts.raleway(
                              textStyle: TextStyle(
                                color: ConstColors.primaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: ConstColors.lightBlue),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            cursorColor: ConstColors.lightBlue,
                            style: GoogleFonts.raleway(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 13
                              ),
                            ),
                            decoration: InputDecoration(
                              hintText: "Enter Email Address",
                              border: InputBorder.none,
                              hintStyle: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    color: ConstColors.lightBlue,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Password",
                          style: TextStyle(
                              color: ConstColors.primaryColor,
                              fontFamily: "Raleway",
                              fontWeight: FontWeight.w700,
                              fontSize: 16
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: ConstColors.lightBlue),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            cursorColor: ConstColors.lightBlue,
                            obscureText: passwordObscure,
                            obscuringCharacter: "*",
                            style: GoogleFonts.raleway(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13
                              ),
                            ),
                            decoration: InputDecoration(
                                hintText: "********",
                                border: InputBorder.none,
                                hintStyle: GoogleFonts.raleway(
                                  textStyle: TextStyle(
                                      color: ConstColors.lightBlue,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13
                                  ),
                                ),
                                suffixIcon: IconButton(
                                  padding: EdgeInsets.only(bottom: 12),
                                  onPressed: (){
                                    setState(() {
                                      passwordObscure = !passwordObscure;
                                    });
                                  },
                                  icon: passwordObscure?const Icon(Icons.visibility_off_sharp,color: Colors.grey,size: 22,):const Icon(Icons.visibility,color: Color(0xffCB2936),size: 22,),
                                )
                            ),
                          ),
                        ),),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        // onTap: (){
                        //   Navigator.pushNamed(context, "dashboard");
                        // },
                        child: Container(
                          margin: EdgeInsets.only(left: 10,right: 10),
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: ConstColors.primaryColor
                          ),
                          child: Center(
                            child: Text("Log In",style: GoogleFonts.raleway(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),),
                          ),
                        ),
                      ),
                    )

                  ],
                )
            ),
          ),
        ),
      ),
    );
  }
}
