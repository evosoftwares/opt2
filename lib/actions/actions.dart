import 'package:flutter/material.dart';

Future alertaNegativo(
  BuildContext context, {
  String? mensagem,
}) async {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        mensagem!,
        style: TextStyle(
          color: Color(0xFF900000),
        ),
      ),
      duration: Duration(milliseconds: 4000),
      backgroundColor: Color(0xFFFFAAAA),
    ),
  );
}
