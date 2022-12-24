import 'package:flutter/material.dart';

var textInputDecoration = InputDecoration(
  hintText: 'Email',
  filled: true,
  fillColor: Colors.white30,
  prefixIcon: const Icon(Icons.email_rounded, color: Colors.black,),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(width: 0)
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.grey, width: 1),
    borderRadius: BorderRadius.circular(15)
  ),
  errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.red, width: 1),
    borderRadius: BorderRadius.circular(15)
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.red, width: 1),
    borderRadius: BorderRadius.circular(15)
  ),
);