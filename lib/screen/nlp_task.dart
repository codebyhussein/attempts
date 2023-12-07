import 'package:flutter/material.dart';
import 'package:qr_code/widgets/custom_text_formfiled.dart';

class Nlp_TaskScreen extends StatefulWidget {
  const Nlp_TaskScreen({super.key});

  @override
  State<Nlp_TaskScreen> createState() => _Nlp_TaskScreenState();
}

class _Nlp_TaskScreenState extends State<Nlp_TaskScreen> {
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Chatify',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Container(
              child: Column(children: [
                CustomTextFormField(
                  nameOferror: "email",
                  obscureText: false,
                  hintText: "Email",
                  regEx:
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                  onSaved: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  nameOferror: "phone",
                  obscureText: false,
                  hintText: "phone",
                  regEx: r"^01[0125][0-9]{8}",
                  onSaved: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
