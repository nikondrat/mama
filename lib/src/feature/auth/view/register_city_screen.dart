import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/data.dart';
import '../widgets/widgets.dart';

class RegisterCityScreen extends StatefulWidget {
  const RegisterCityScreen({super.key});

  @override
  State<RegisterCityScreen> createState() => _RegisterCityScreenState();
}

class _RegisterCityScreenState extends State<RegisterCityScreen> {
  final controller = TextEditingController();
  var textFieldTap = false;
  var isFull = false;
  final searchState = SearchState();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    return Scaffold(
      body: BodyDecoration(
        backgroundImage: DecorationImage(
          image: AssetImage(
            Assets.images.authDecor.path,
          ),
          alignment: Alignment.topLeft,
        ),
        child: Observer(builder: (context) {
          var resultOfSearch = searchState.newList;
          return Column(
            children: [
              Spacer(),
              Text(
                t.register.whatCityYouLive,
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              20.h,
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
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            if (resultOfSearch.isEmpty) {
                              return Container(child: const Text('Не найдена'));
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
                          onPressed: isFull
                              ? () {
                                  context.goNamed(AppViews.welcomeScreen);
                                }
                              : null,
                          child: isFull
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
                                      color: AppColors.whiteDarkerButtonColor),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              30.h
            ],
          );
        }),
      ),
    );
  }
}
