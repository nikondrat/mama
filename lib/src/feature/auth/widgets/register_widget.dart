import 'package:flutter/material.dart';
import 'package:mama/src/feature/auth/data/entity/city.dart';
import '../../../core/core.dart';

class FillTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool isName;
  final Widget child;

  const FillTextField(
      {super.key,
      required this.controller,
      required this.isName,
      required this.child});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

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
              child,
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  isName
                      ? t.register.clickToEnterName
                      : t.register.clickToEnterSurname,
                  style: textTheme.bodySmall?.copyWith(fontSize: 12),
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
  final bool isSelected;
  final Function() onTap;
  const CityContainer(
      {super.key,
      required this.isSelected,
      required this.city,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              border: isSelected
                  ? Border.all(
                      color: AppColors.primaryColor,
                      width: 2,
                    )
                  : null,
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
                  city.name,
                  style: textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w400),
                ),
                Text(
                  city.countryName,
                  style: textTheme.bodySmall
                      ?.copyWith(fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
