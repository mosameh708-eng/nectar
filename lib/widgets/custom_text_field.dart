import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  final bool ispassword;

  const CustomTextField({
    super.key,
    required this.label,
    this.controller,
    required this.ispassword,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;
  @override
  void initState() {
    _obscureText = widget.ispassword;
    super.initState();
  }

  void _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (v) {
        if (v == null||v.isEmpty) {
          return "please fill this";
        }

      },
      obscureText: _obscureText,

      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(color: Color(0xff7C7C7C)),
        suffixIcon: widget.ispassword
            ? GestureDetector(
                onTap: _togglePassword,
                child: Icon(CupertinoIcons.eye),
              )
            : null,
        enabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey), // Unfocused = grey
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 2),
        ),
      ),
    );
  }
}
