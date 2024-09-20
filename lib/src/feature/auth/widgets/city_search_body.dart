import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/data.dart';
import 'package:mobx/src/api/async.dart';

import 'search_input.dart';

class CitySearchBody extends StatefulWidget {
  final SearchCityStore store;
  const CitySearchBody({
    super.key,
    required this.store,
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
                if (!isFocused) Spacer(),
                SearchInput(focusNode: focusNode),
                20.h,
                // textFieldTap
                //     ?
                Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return CityContainer(
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
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        ElevatedButton(
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size(120, 48),
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  width: 2,
                                  color: AppColors.purpleLighterBackgroundColor,
                                ),
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          onPressed: () {
                            context.goNamed(AppViews.welcomeScreen);
                          },
                          child: Text(
                            t.register.skip,
                            style: textTheme.bodyMedium
                                ?.copyWith(color: AppColors.primaryColor),
                          ),
                        ),
                        20.w,
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size.fromHeight(48),
                                backgroundColor:
                                    AppColors.greenLighterBackgroundColor,
                                disabledBackgroundColor: AppColors.greyColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                            onPressed: selectedCity != null
                                ? () {
                                    context.goNamed(AppViews.welcomeScreen);
                                  }
                                : null,
                            child: selectedCity != null
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.check,
                                        color: AppColors.greenTextColor,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        t.register.complete,
                                        style: textTheme.bodyMedium?.copyWith(
                                            color: AppColors.greenTextColor),
                                      ),
                                    ],
                                  )
                                : Text(
                                    t.register.complete,
                                    style: textTheme.bodyMedium?.copyWith(
                                        color:
                                            AppColors.whiteDarkerButtonColor),
                                  ),
                          ),
                        ),
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
