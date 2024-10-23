import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/data.dart';
import 'package:provider/provider.dart';

class RegisterInfoAboutChildbirth extends StatelessWidget {
  final bool isNotRegister;
  const RegisterInfoAboutChildbirth({
    super.key,
    required this.isNotRegister,
  });

  @override
  Widget build(BuildContext context) {
    final AuthViewStore store = context.watch();
    final ChildStore childStore = context.watch();

    void next() {
      if (isNotRegister) {
        childStore.add(model: store.child);
        context.goNamed(AppViews.profile);
      } else {
        context.pushNamed(
          AppViews.citySearch,
        );
      }
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: isNotRegister ? const CustomAppBar() : null,
      body: BodyDecoration(
        backgroundImage: DecorationImage(
          image: AssetImage(
            Assets.images.authDecor.path,
          ),
          alignment: Alignment.topLeft,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Spacer(),
              TitleWidget(text: t.register.howWasBirth),
              20.h,
              CustomToggleButton(
                  fontSize: 17,
                  items: [t.register.natural, t.register.caesarean],
                  onTap: (index) {
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
                        type: CustomButtonType.outline,
                        title: t.register.skip,
                        maxLines: 1,
                        onTap: next,
                      ),
                    ),
                    20.w,
                    Expanded(
                        flex: 2,
                        child: CustomButton(
                          height: 50,
                          maxLines: 1,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 16),
                          title: t.register.next,
                          onTap: next,
                        ))
                  ],
                ),
              ),
              40.h
            ],
          ),
        ),
      ),
    );
  }
}
