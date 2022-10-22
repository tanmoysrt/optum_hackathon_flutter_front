import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final bool? obscureText;
  final TextInputType? keyboardType;

  const InputBox({super.key, this.hintText, this.controller, this.obscureText, this.keyboardType});


  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.87;
    double buttonHeight = MediaQuery.of(context).size.height * 0.06;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        width: buttonWidth,
        height: buttonHeight,
        decoration: const BoxDecoration(
            color: Color(0xff1E1E1E),
            borderRadius: BorderRadius.all(Radius.circular(2))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
            style: const TextStyle(color: Colors.white, fontSize: 15),
            controller: controller,
            obscureText: obscureText ?? false,
            keyboardType: keyboardType??TextInputType.text,
            cursorColor: const Color(0xff848484),
            decoration: InputDecoration(
              hintText: hintText??" ",
              hintStyle: const TextStyle(
                  color: Color(0xff848484),
                  fontStyle: FontStyle.italic
              ),
              border: InputBorder.none,
              focusColor: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
