import 'package:flutter/material.dart';

final FormDecoration = InputDecoration(
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white10,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(10)),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white10,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(10)),
  errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(10)),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.redAccent,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(10),
  ),
  fillColor: Colors.black12,
  filled: true,
);
