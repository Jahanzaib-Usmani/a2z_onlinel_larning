import 'package:a2z_online_learning/Components/custom_text_formfield.dart';
import 'package:a2z_online_learning/Utils/AppColors.dart';
import 'package:a2z_online_learning/Utils/AppConstant.dart';
import 'package:a2z_online_learning/screens/Log%20_In/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  var googleAuthCredential = GoogleAuthProvider.credential(accessToken: 'xxxx');
  bool _isPasswordObscure = true; //Password visibility flag
  bool _isConfirmPasswordObscure = true; //Password visibility flag
  bool _isChecked = false;
  bool _isSignUpSuccessful = false; // Track sign-up success
  bool isEmailAlreadyInUse = false;

//////////////////// DIALOG BOX ///////////////////

  void showMessageDialog(String errorMessage) {
    List<Widget> actions;
    if (_isSignUpSuccessful) {
      actions = [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          },
          child: Text('Ok'),
        ),
      ];
    } else if (isEmailAlreadyInUse) {
      actions = [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text("Try Again"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          },
          child: Text("Proceed to Log In"),
        ),
      ];
    } else {
      actions = [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text("OK"),
        ),
      ];
    }

//// Set up the AlertDialog /////
    AlertDialog alert = AlertDialog(
      title: Text('Alert'),
      content: Text(errorMessage),
      actions: actions,
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lighGreyBackground,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
            minWidth: MediaQuery.of(context).size.width,
          ),
          child: SizedBox(
            height: 100.h,
            width: 100.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20.h,
                  width: 100.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 12.h, left: 6.w),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 28,
                              fontFamily: AppConstants.textFont,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 6.w),
                        child: Text(
                          'Enter your details below & free sign up',
                          style: TextStyle(
                              color: Color(0xffB8B8D2),
                              fontSize: 12,
                              fontFamily: AppConstants.textFont,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Expanded(
                  child: Container(
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: AppColors.whiteBackgroundColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 6.h),
                          Padding(
                            padding: EdgeInsets.only(left: 5.w, right: 5.w),
                            child: CustomTextFormField(
                              controller: _emailController,
                              hintText: "abc@example.com",
                              titleText: "Your email",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                } else if (!value.contains('@')) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.w, right: 5.w),
                            child: CustomTextFormField(
                              controller: _passwordController,
                              hintText: "Enter your password here",
                              titleText: "Password",
                              isObscureText: _isPasswordObscure,
                              obscureCharacter: '*',
                              sufixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(
                                    () {
                                      _isPasswordObscure = !_isPasswordObscure;
                                    },
                                  );
                                },
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                } else if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 5.w, right: 5.w),
                              child: CustomTextFormField(
                                controller: _confirmPasswordController,
                                hintText: "Enter your password agan",
                                titleText: "Confirm Password",
                                isObscureText: _isConfirmPasswordObscure,
                                obscureCharacter: '*',
                                sufixIcon: IconButton(
                                  icon: Icon(
                                    _isConfirmPasswordObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(
                                      () {
                                        _isConfirmPasswordObscure =
                                            !_isConfirmPasswordObscure;
                                      },
                                    );
                                  },
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  } else if (value !=
                                      _passwordController.text) {
                                    return 'Password do not match';
                                  }
                                  return null;
                                },
                              )),
                          SizedBox(
                            height: 32,
                          ),
                          CheckboxListTile(
                            title: const Text(
                              "By creating an account you have to agree with our terms & condition.",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: AppConstants.textFont,
                                  fontWeight: FontWeight.w400),
                            ),
                            value: _isChecked,
                            onChanged: (newBool) {
                              setState(() {
                                _isChecked = newBool!;
                              });
                            },
                            activeColor: Colors.orangeAccent,
                            checkColor: Colors.white,
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          ElevatedButton(
                            onPressed: _isChecked
                                ? () async {
                                    if (_formKey.currentState!.validate()) {
                                      try {
                                        await _auth
                                            .createUserWithEmailAndPassword(
                                          email:
                                              _emailController.text.toString(),
                                          password: _passwordController.text
                                              .toString(),
                                        );
                                        //await FireStoreServices.saveUser;
                                        setState(() {
                                          _isSignUpSuccessful = true;
                                        });
                                        showMessageDialog(
                                          "Sign Up Successful",
                                        );
                                      } on FirebaseAuthException catch (e) {
                                        if (e.code == 'email-already-in-use') {
                                          setState(() {
                                            isEmailAlreadyInUse = true;
                                          });
                                          showMessageDialog(
                                            'The account already exists for that email.',
                                          );
                                        } else {
                                          showMessageDialog(
                                            'The error code: ${e.message}',
                                          );
                                        }
                                      }
                                    }
                                  }
                                : null, // Disable the button if _isChecked is false
                            child: const Text('Sign Up'),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: AppConstants.textFont,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()),
                                  );
                                },
                                child: Text(
                                  "Log in",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.blue,
                                      color: Colors.blue,
                                      fontSize: 13,
                                      fontFamily: AppConstants.textFont,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
