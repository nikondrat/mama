
import 'package:flutter/material.dart';
import 'package:mama/src/core/constant/colors.dart';
import 'package:mama/src/feature/register/state/register_state/register_state.dart';

import '../../../core/core.dart';

class FillTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool isName;
  final Widget child;

  const FillTextField(
      {super.key,
        required this.controller,
        required this.isName,
        required this.child});

  @override
  State<FillTextField> createState() => _FillTextFieldState();
}

class _FillTextFieldState extends State<FillTextField> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 1,
                  offset: const Offset(0, 3),
                  spreadRadius: 0,
                  color: const Color(0xFF340589).withOpacity(0.1)),
              BoxShadow(
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                  spreadRadius: 0,
                  color: const Color(0xFF2B0F60).withOpacity(0.15)),
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              widget.child,
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  widget.isName
                      ? t.register.clickToEnterName
                      : t.register.clickToEnterSurname,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                      color: AppColors.greyBrighterColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}