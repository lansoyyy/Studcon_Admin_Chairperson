import 'package:consultation_system/constant/colors.dart';
import 'package:consultation_system/services/navigation.dart';
import 'package:consultation_system/widgets/text_widget.dart';
import 'package:consultation_system/widgets/textform_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../widgets/error_dialogue_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final signupformKey = GlobalKey<FormState>();

  final int _dropdownValue1 = 0;

  late String course = 'IT';

  final loginformKey = GlobalKey<FormState>();
  bool secureText = true;

  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    validateLogin(dynamic e) {
      showDialog(
        context: context,
        builder: ((context) {
          return ErrorDialog(
              caption: e.code,
              onPressed: () {
                Navigator.of(context).pop();
              });
        }),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  opacity: 50,
                  image: AssetImage('assets/images/background1.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 140, right: 60),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 280,
                width: 250,
                decoration: BoxDecoration(
                  color: const Color(0xff001C38).withOpacity(0.85),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/bsu.png',
                        height: 90,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BoldText(
                        label: 'BukSu Consultation',
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      NormalText(
                        label: 'Educate. Innovate. Lead',
                        fontSize: 12,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MaterialButton(
                              color: primary,
                              minWidth: 100,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  side: const BorderSide(color: Colors.white)),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: ((context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 0, bottom: 0),
                                          child: Container(
                                            height: 500,
                                            width: 320,
                                            decoration: BoxDecoration(
                                              color: const Color(0xffF5F7FB),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      30, 10, 30, 10),
                                              child: Form(
                                                key: loginformKey,
                                                child: Center(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      Center(
                                                        child: Image.asset(
                                                          'assets/images/bsu.png',
                                                          height: 90,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Center(
                                                        child: BoldText(
                                                            label:
                                                                'Login to BukSu Consultation',
                                                            fontSize: 16,
                                                            color: primary),
                                                      ),
                                                      const SizedBox(
                                                        height: 30,
                                                      ),
                                                      NormalText(
                                                          label: 'Email',
                                                          fontSize: 12,
                                                          color: Colors.black),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      TextformfieldWidget(
                                                        label: 'Email',
                                                        prefixIcon: const Icon(
                                                            Icons.email),
                                                        textFieldController:
                                                            _emailController,
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      NormalText(
                                                          label:
                                                              'Only institutional email address is allowed.\ne.g example@buksu.edu.ph',
                                                          fontSize: 9,
                                                          color: Colors.black),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      NormalText(
                                                          label: 'Password',
                                                          fontSize: 12,
                                                          color: Colors.black),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      TextformfieldWidget(
                                                        isObscure: secureText,
                                                        label: 'Password',
                                                        prefixIcon: const Icon(
                                                            Icons.lock),
                                                        textFieldController:
                                                            _passwordController,
                                                        suffixIcon: IconButton(
                                                          icon: Icon(
                                                            secureText
                                                                ? Icons
                                                                    .visibility
                                                                : Icons
                                                                    .visibility_off,
                                                          ),
                                                          onPressed: () {
                                                            setState(() {
                                                              secureText =
                                                                  !secureText;
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 30,
                                                      ),
                                                      Center(
                                                        child: MaterialButton(
                                                            minWidth: 300,
                                                            height: 18,
                                                            color: primary,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            onPressed:
                                                                (() async {
                                                              if (_emailController
                                                                          .text !=
                                                                      'admin@buksu.edu.ph' &&
                                                                  _passwordController
                                                                          .text !=
                                                                      'adminbuksu') {
                                                                Navigator.pop(
                                                                    context);
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        NormalText(
                                                                      label:
                                                                          'Invalid Admin Credentials',
                                                                      fontSize:
                                                                          18,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                );
                                                              } else {
                                                                Navigation(
                                                                        context)
                                                                    .goToHomeScreen();
                                                              }
                                                            }),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: BoldText(
                                                                  label:
                                                                      'SIGN IN',
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .white),
                                                            )),
                                                      ),
                                                      const Expanded(
                                                        child: SizedBox(
                                                          height: 80,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }));
                              },
                              child: BoldText(
                                  label: 'LOGIN',
                                  fontSize: 12,
                                  color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 80,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/bsu.png',
                        height: 50,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BoldText(
                            label: 'BUKIDNON STATE UNIVERSITY',
                            fontSize: 24,
                            color: const Color(0xff000054),
                          ),
                          NormalText(
                              label:
                                  'Malaybalay City, Bukidnon 8700, Philippines',
                              fontSize: 14,
                              color: Colors.black),
                        ],
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 30),
                //   child: MaterialButton(
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(5),
                //       ),
                //       height: 40,
                //       minWidth: 120,
                //       color: const Color(0xffD7953F),
                //       onPressed: (() {
                //         showDialog(
                //             context: context,
                //             builder: ((context) {
                //               return Dialog(
                //                 child: Padding(
                //                   padding: const EdgeInsets.only(
                //                       right: 0, bottom: 0),
                //                   child: Container(
                //                     height: 550,
                //                     width: 400,
                //                     decoration: BoxDecoration(
                //                       borderRadius: BorderRadius.circular(20),
                //                     ),
                //                     child: Padding(
                //                       padding: const EdgeInsets.fromLTRB(
                //                           30, 10, 30, 10),
                //                       child: Form(
                //                         key: loginformKey,
                //                         child: Center(
                //                           child: Column(
                //                             crossAxisAlignment:
                //                                 CrossAxisAlignment.center,
                //                             children: [
                //                               const SizedBox(
                //                                 height: 20,
                //                               ),
                //                               BoldText(
                //                                   label: 'Login',
                //                                   fontSize: 24,
                //                                   color: primary),
                //                               NormalText(
                //                                   label:
                //                                       'Welcome to our website',
                //                                   fontSize: 14,
                //                                   color: Colors.black),
                //                               const SizedBox(
                //                                 height: 50,
                //                               ),
                //                               TextformfieldWidget(
                //                                 label: 'Email',
                //                                 prefixIcon:
                //                                     const Icon(Icons.email),
                //                                 textFieldController:
                //                                     _emailController,
                //                               ),
                //                               const SizedBox(
                //                                 height: 20,
                //                               ),
                //                               TextformfieldWidget(
                //                                 isObscure: secureText,
                //                                 label: 'Password',
                //                                 prefixIcon:
                //                                     const Icon(Icons.lock),
                //                                 textFieldController:
                //                                     _passwordController,
                //                                 suffixIcon: IconButton(
                //                                   icon: Icon(
                //                                     secureText
                //                                         ? Icons.visibility
                //                                         : Icons.visibility_off,
                //                                   ),
                //                                   onPressed: () {
                //                                     setState(() {
                //                                       secureText = !secureText;
                //                                     });
                //                                   },
                //                                 ),
                //                               ),
                //                               const SizedBox(
                //                                 height: 50,
                //                               ),
                //                               Center(
                //                                 child: MaterialButton(
                //                                     minWidth: 300,
                //                                     color: primary,
                //                                     shape:
                //                                         RoundedRectangleBorder(
                //                                             borderRadius:
                //                                                 BorderRadius
                //                                                     .circular(
                //                                                         100)),
                //                                     onPressed: (() async {
                //                                       if (loginformKey
                //                                           .currentState!
                //                                           .validate()) {
                //                                         try {
                //                                           await AuthRepository()
                //                                               .loginOfuser(
                //                                                   _emailController
                //                                                       .text,
                //                                                   _passwordController
                //                                                       .text);
                //                                           // ignore: use_build_context_synchronously
                //                                           Navigation(context)
                //                                               .goToHomeScreen();
                //                                         } on FirebaseAuthException catch (e) {
                //                                           validateLogin(e);
                //                                         }
                //                                       }
                //                                     }),
                //                                     child: Padding(
                //                                       padding:
                //                                           const EdgeInsets.all(
                //                                               8.0),
                //                                       child: NormalText(
                //                                           label: 'Login',
                //                                           fontSize: 24,
                //                                           color: Colors.white),
                //                                     )),
                //                               ),
                //                               const Expanded(
                //                                 child: SizedBox(
                //                                   height: 80,
                //                                 ),
                //                               ),
                //                               Row(
                //                                 mainAxisAlignment:
                //                                     MainAxisAlignment.center,
                //                                 children: [
                //                                   NormalText(
                //                                       label:
                //                                           'Not a member yet?',
                //                                       fontSize: 14,
                //                                       color: Colors.grey),
                //                                   TextButton(
                //                                     onPressed: (() {
                //                                       // Navigator.of(context).push(MaterialPageRoute(
                //                                       //     builder: (context) => SignupPage()));
                //                                       Navigation(context)
                //                                           .goToSignUpPage();
                //                                     }),
                //                                     child: NormalText(
                //                                         label: 'Register now',
                //                                         fontSize: 16,
                //                                         color: brownAccent),
                //                                   ),
                //                                 ],
                //                               ),
                //                               const SizedBox(
                //                                 height: 20,
                //                               ),
                //                             ],
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               );
                //             }));
                //       }),
                //       child: NormalText(
                //           label: 'Login', fontSize: 16, color: Colors.white)),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
