import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/data.dart';
import 'package:mama/src/feature/auth/state/register_state/register_state.dart';
import 'package:mama/src/feature/auth/state/search_state/search_state.dart';

import '../widgets/register_widget.dart';

class RegisterCityScreen extends StatefulWidget {
  const RegisterCityScreen({super.key});

  @override
  State<RegisterCityScreen> createState() => _RegisterCityScreenState();
}

class _RegisterCityScreenState extends State<RegisterCityScreen> {
  final controller = TextEditingController();
  final registerState = RegisterState();
  var textFieldTap = false;
  var isFull = false;
  final searchState = SearchState();

  @override
  Widget build(BuildContext context) {
    return StartScreenBody(
      child: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              const AuthSplashIcon(),
              Observer(builder: (context) {
                var resultOfSearch = searchState.newList;
                return Column(
                  children: [
                    textFieldTap
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height * 0.08)
                        : SizedBox(
                            height: MediaQuery.of(context).size.height * 0.25,
                          ),
                    Text(
                      t.register.whatCityYouLive,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 17),
                    ),
                    const SizedBox(height: 20),
                    CityTextField(
                      child: TextField(
                        onChanged: (value) {
                          searchState.searchCity(city: value);
                          setState(() {
                            if (value.isNotEmpty) {
                              isFull = true;
                            } else {
                              isFull = false;
                            }
                          });
                        },
                        onTap: () {
                          setState(() {
                            textFieldTap = true;
                          });
                        },
                        controller: controller,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: t.register.searchPlace,
                            prefixIcon: const Icon(
                              Icons.search,
                              color: AppColors.primaryColor,
                            )),
                      ),
                    ),
                    textFieldTap
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: ListView.separated(
                                itemBuilder: (context, index) {
                                  if (resultOfSearch.isEmpty) {
                                    return Container(
                                        child: const Text('Не найдена'));
                                  } else {
                                    return CityContainer(
                                      city: resultOfSearch[index],
                                      onTap: () {
                                        final city = resultOfSearch[index].city;
                                        controller.text = city;
                                        searchState.choose(city: city);
                                        setState(() {
                                          isFull = true;
                                        });
                                      },
                                    );
                                  }
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(height: 5);
                                },
                                itemCount: resultOfSearch.length),
                          )
                        : const SizedBox(),
                    const Spacer(),
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
                                      color: AppColors
                                          .purpleLighterBackgroundColor,
                                    ),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              onPressed: () {
                                context.goNamed(AppViews.welcomeScreen);
                              },
                              child: Text(
                                t.register.skip,
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryColor),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size.fromHeight(48),
                                    backgroundColor:
                                        AppColors.greenLighterBackgroundColor,
                                    disabledBackgroundColor:
                                        AppColors.greyColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    )),
                                onPressed: isFull
                                    ? () {
                                        registerState.fillCity(
                                            city: controller.text);
                                        context.goNamed(AppViews.welcomeScreen);
                                      }
                                    : null,
                                child: isFull
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.check,
                                            color: AppColors.greenTextColor,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            t.register.complete,
                                            style: const TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600,
                                                color:
                                                    AppColors.greenTextColor),
                                          ),
                                        ],
                                      )
                                    : Text(
                                        t.register.complete,
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors
                                                .whiteDarkerButtonColor),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30)
                  ],
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
