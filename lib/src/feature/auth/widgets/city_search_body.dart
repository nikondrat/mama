import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/data.dart';
import 'package:mobx/mobx.dart';

import 'search_input.dart';

class CitySearchBody extends StatefulWidget {
  final VerifyStore? verifyStore;
  final SearchCityStore store;
  final AuthViewStore authViewStore;
  const CitySearchBody({
    super.key,
    required this.verifyStore,
    required this.store,
    required this.authViewStore,
  });

  @override
  State<CitySearchBody> createState() => _CitySearchBodyState();
}

class _CitySearchBodyState extends State<CitySearchBody> {
  late final FocusNode focusNode;
  bool isFocused = false;

  City? selectedCity;

  @override
  void initState() {
    focusNode = FocusNode();
    focusNode.addListener(() {
      setState(() {
        isFocused = focusNode.hasFocus;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    widget.store.dispose();
    super.dispose();
  }

  void go() {
    if (widget.verifyStore != null && !widget.verifyStore!.isRegistered) {
      widget.verifyStore!.register(
          data: RegisterData(
        user: AccountModel(
            gender: Gender.female,
            firstName: widget.authViewStore.name.value,
            secondName: widget.authViewStore.surname.value,
            phone: widget.verifyStore!.phoneNumber),
        child: widget.authViewStore.child,
        city: selectedCity?.name ?? '',
      ));
      context.goNamed(AppViews.welcomeScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return Observer(builder: (value) {
      switch (widget.store.fetchCitiesFuture.status) {
        case FutureStatus.pending:
        case FutureStatus.rejected:
        case FutureStatus.fulfilled:
          return SafeArea(
            child: Column(
              children: [
                if (!isFocused && widget.store.cities.isEmpty) const Spacer(),
                SearchInput(focusNode: focusNode),
                20.h,
                Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return CityContainer(
                          isSelected:
                              selectedCity == widget.store.cities[index],
                          city: widget.store.cities[index],
                          onTap: () {
                            setState(() {
                              selectedCity = widget.store.cities[index];
                            });
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 5);
                      },
                      itemCount: widget.store.cities.length),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    height: 100,
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            textStyle:
                                textTheme.labelLarge?.copyWith(fontSize: 15),
                            type: CustomButtonType.outline,
                            title: t.register.skip,
                            onTap: () {
                              go();
                              // context.goNamed(AppViews.welcomeScreen);
                            },
                          ),
                        ),
                        10.w,
                        Expanded(
                            flex: 2,
                            child: CustomButton(
                              onTap: selectedCity != null
                                  ? () {
                                      go();
                                      // context.goNamed(AppViews.welcomeScreen);
                                    }
                                  : null,
                              icon: selectedCity != null
                                  ? IconModel(
                                      icon: Icons.check,
                                      color: AppColors.greenTextColor,
                                    )
                                  : null,
                              title: t.register.complete,
                              backgroundColor: selectedCity != null
                                  ? AppColors.greenLighterBackgroundColor
                                  : AppColors.greyColor,
                            ))
                        // Expanded(
                        //   child: ElevatedButton(
                        //     style: ElevatedButton.styleFrom(
                        //         minimumSize: const Size.fromHeight(48),
                        //         backgroundColor:
                        //             AppColors.greenLighterBackgroundColor,
                        //         disabledBackgroundColor: AppColors.greyColor,
                        //         shape: RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(8),
                        //         )),
                        //     onPressed: selectedCity != null
                        //         ? () {
                        //             context.goNamed(AppViews.welcomeScreen);
                        //           }
                        //         : null,
                        //     child: selectedCity != null
                        //         ? Row(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             children: [
                        //               const Icon(
                        //                 Icons.check,
                        //                 color: AppColors.greenTextColor,
                        //               ),
                        //               const SizedBox(width: 5),
                        //               Text(
                        //                 t.register.complete,
                        //                 style: textTheme.bodyMedium?.copyWith(
                        //                     color: AppColors.greenTextColor),
                        //               ),
                        //             ],
                        //           )
                        //         : Text(
                        //             t.register.complete,
                        //             style: textTheme.bodyMedium?.copyWith(
                        //                 color:
                        //                     AppColors.whiteDarkerButtonColor),
                        //           ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                30.h
              ],
            ),
          );
      }
    });
  }
}
