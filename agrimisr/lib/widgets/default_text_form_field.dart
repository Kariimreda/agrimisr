import 'package:flutter/material.dart';

Widget DefaultTextFormFiled({
  required TextEditingController controller,
  required TextInputType type,
  bool obscureText = false,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
  Function? onPressed,
  required String? Function(String?) validate,
  String? label,
  String? hint,
  IconData? suffix,
  IconData? prefix,
}) =>
    Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        onFieldSubmitted: (s) {
          onSubmit!();
        },
        onChanged: (s) {
          onChange!();
        },
        onTap: () {
          onTap!();
        },
        validator: (s) {
          validate(s!);
        },
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(prefix),
          suffixIcon: IconButton(
              onPressed: () {
                onPressed!();
              },
              icon: Icon(suffix)),
          border: OutlineInputBorder(borderSide: BorderSide(width: 8.0)),
        ),
        obscureText: obscureText,
      ),
    );
