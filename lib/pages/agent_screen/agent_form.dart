import 'package:flutter/material.dart';

class AgentForm extends StatefulWidget {
  const AgentForm({Key? key}) : super(key: key);

  @override
  State<AgentForm> createState() => _AgentFormState();
}

class _AgentFormState extends State<AgentForm> {
  final formKey = GlobalKey<FormState>(); //key for form
  String name = "";
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: const Color(0xFFffffff),
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Form(
                key: formKey, //key for form
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.04),
                    const Text(
                      "Here to Get",
                      style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                    ),
                    const Text(
                      "Welcomed !",
                      style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Enter Your First Name",
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[a-z A-Z]').hasMatch(value!)) {
                          return "Enter Correct First name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Enter Your Last Name",
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[a-z A-Z]').hasMatch(value!)) {
                          return "Enter Correct Last Name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Enter Your Phone Number",
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[789]\d{9}$').hasMatch(value!)) {
                          return "Enter Correct Phone Number";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Enter Your Aadhaar Card Number",
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[2-9][0-9]{3}\s[0-9]{4}\s[0-9]{4}$')
                                .hasMatch(value!)) {
                          return "Enter Correct Aadhaar Card Number";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Enter Your Pan Card Number",
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]$')
                                .hasMatch(value!)) {
                          return "Enter Correct Pan Card Number";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Enter Your Email Id",
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                                .hasMatch(value!)) {
                          return "Enter Correct Email id";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Enter Your Address",
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^(?!\s*$).+').hasMatch(value!)) {
                          return "Enter Correct Address";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Sign up",
                          style:
                              TextStyle(fontSize: 22, color: Color(0xFF363f93)),
                        ),
                        FloatingActionButton(
                            backgroundColor: Colors.blue,
                            child: const Stack(
                              children: [
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ), // Arrow icon
                              ],
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                final snackBar =
                                    SnackBar(content: Text('Submitting Form'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            })
                        // NeumorphicButton(
                        //   margin: EdgeInsets.only(top: 12),
                        //   onPressed: () {
                        //     if (formKey.currentState!.validate()) {
                        //       final snackBar =
                        //           SnackBar(content: Text('Submitting Form'));
                        //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        //     }
                        //   },
                        //   style: const NeumorphicStyle(
                        //     shape: NeumorphicShape.flat,
                        //     boxShape: NeumorphicBoxShape.circle(),
                        //   ),
                        // )
                        //   ],
                        // )
                      ],
                    ),
                  ],
                ),
              )),
        ));
  }
}
