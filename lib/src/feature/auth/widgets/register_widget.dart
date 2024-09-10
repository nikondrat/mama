import 'package:flutter/material.dart';
import 'package:mama/src/feature/auth/data/entity/city.dart';

import '../../../core/core.dart';
import '../data/entity/content.dart';

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

class CityTextField extends StatefulWidget {
  final Widget child;
  const CityTextField({super.key, required this.child});

  @override
  State<CityTextField> createState() => _CityTextFieldState();
}

class _CityTextFieldState extends State<CityTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
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
          padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
          child: widget.child,
        ),
      ),
    );
  }
}

class CityContainer extends StatelessWidget {
  final City city;
  final Function() onTap;
  const CityContainer({super.key, required this.city, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
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
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  city.city,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w400),
                ),
                Text(
                  city.republic,
                  style: const TextStyle(
                      fontSize: 10, fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WelcomeContainer extends StatelessWidget {
  final Content content;
  const WelcomeContainer({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          Image.asset(content.assetImage),
          Text(
            content.title,
            style: const TextStyle(
                color: AppColors.primaryColor,
                fontSize: 24,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            content.text,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
