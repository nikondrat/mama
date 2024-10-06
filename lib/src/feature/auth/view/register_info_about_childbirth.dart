import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_toggle_button/flutter_toggle_button.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/core/widgets/custom_toggle_button.dart';
import 'package:mama/src/data.dart';
import 'package:provider/provider.dart';

class RegisterInfoAboutChildbirth extends StatelessWidget {
  const RegisterInfoAboutChildbirth({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthViewStore store = context.watch();

    return Scaffold(
      body: BodyDecoration(
        backgroundImage: DecorationImage(
          image: AssetImage(
            Assets.images.authDecor.path,
          ),
          alignment: Alignment.topLeft,
        ),
        child: AppBody(
          builder: (windowWidth, windowSize) => Padding(
            padding: HorizontalSpacing.centered(windowWidth),
            child: Column(
              children: [
                Spacer(),
                TitleWidget(text: t.register.howWasBirth),
                20.h,
                CustomToggleButton(
                  fontSize: 17,
                    items: [
                      t.register.natural, t.register.caesarean
                    ],
                    onTap: (index){
                      store.child.setChildbirth(Childbirth.values[index]);
                    },
                    btnWidth: 175,
                    btnHeight: 38),
                20.h,
                Row(
                  children: [
                    Text(t.register.wasComplications),
                    const Spacer(),
                    Observer(builder: (context) {
                      return CupertinoSwitch(
                          activeColor: AppColors.primaryColor,
                          value: store.child.childBirthWithComplications,
                          onChanged: (value) {
                            store.child.setChildbirthWithComplications(value);
                          });
                    }),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          height: 50,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          type: CustomButtonType.outline,
                          title: t.register.skip,
                          maxLines: 1,
                          onTap: () => context.pushNamed(AppViews.citySearch),
                        ),
                      ),
                      10.w,
                      Expanded(
                          flex: 2,
                          child: CustomButton(
                            height: 50,
                            maxLines: 1,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 16),
                            title: t.register.next,
                            onTap: () => context.pushNamed(AppViews.citySearch),
                          ))
                    ],
                  ),
                ),
                40.h
              ],
            ),
          ),
        ),
      ),
    );
  }
}
