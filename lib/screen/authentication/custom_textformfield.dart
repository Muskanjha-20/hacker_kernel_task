import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomPasswordFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomPasswordFormField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  State<CustomPasswordFormField> createState() =>
      _CustomPasswordFormFieldState();
}

class _CustomPasswordFormFieldState extends State<CustomPasswordFormField> {
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    print(hidePassword);
    return TextFormField(
      obscureText: hidePassword,
      cursorColor: Colors.black.withOpacity(0.6),
      controller: widget.controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: widget.hintText,
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              hidePassword = !hidePassword;
            });
          },
          child: Icon(
            hidePassword == true
                ? CupertinoIcons.eye_slash
                : CupertinoIcons.eye,
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
