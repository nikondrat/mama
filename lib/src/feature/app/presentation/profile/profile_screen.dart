// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mama/src/data.dart';
import 'package:mama/src/core/core.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.purpleLighterBackgroundColorScaffold,
        appBar: PreferredSize(
          preferredSize:
              const Size.fromHeight(390), //TODO фиксированная высота аппбара
          child: AppBar(
            backgroundColor: AppColors.purpleLighterBackgroundColorScaffold,
            leadingWidth: 100,
            toolbarHeight: 46,
            leading: const ButtonLeading(),
            flexibleSpace:
                // const DashedPhotoProfile(), //TODO логика переключения на фото
                const ProfilePhoto(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(t.profile.accountTitle),
              ), //TODO текст
              const Gap(8),
              ContainerWhiteForAccountProfile(
                texthint: 'Нажмите, чтобы изменить имя', //TODO текст
                value: 'Кристина Константинова', //TODO текст
                labelStyle: const TextStyle(),
                controller: _usernameController,
                onChange: () {}, //TODO onChangeCallback
              ),
            ],
          ),
        ));
  }
}

class DashedPhotoProfile extends StatelessWidget {
  const DashedPhotoProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.purpleLighterBackgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32), //TODO закругления
          bottomRight: Radius.circular(32), //TODO закругления
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 1.0, left: 1.0, right: 1.0),
        child: DottedBorder(
          strokeWidth: 1.5,
          color: AppColors.primaryColor,
          borderType: BorderType.RRect,
          dashPattern: const [10, 7],
          radius: const Radius.circular(32), //TODO закругления
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  height: 64,
                  image: AssetImage(
                      'assets/images/addPhotoIcon.png'), //TODO путь к ассету
                ),
                Text(t.profile.addPhotoTitle),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32), //TODO закругления
              bottomRight: Radius.circular(32), //TODO закругления
            ),
            image: DecorationImage(
                image: AssetImage(
                    'assets/images/imgprofile.png'), //TODO путь к ассету
                fit: BoxFit.cover),
          ),
        ),
        Positioned.fill(
          bottom: -32,
          right: 32,
          child: Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon: Image.asset(
                'assets/images/iconFhotoAdd.png', //TODO путь к ассету
                height: 64,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}

class ButtonLeading extends StatelessWidget {
  const ButtonLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: AppColors.greyButton,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), //TODO закругления
              bottomRight: Radius.circular(20), //TODO закругления
            ),
          ),
        ),
        onPressed: () {}, //TODO button
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 20.0,
          color: AppColors.blackColor,
        ),
        label: Text(t.profile.backLeadingButton), //TODO текст
      ),
    );
  }
}

class ContainerWhiteForAccountProfile extends StatelessWidget {
  final MaskTextInputFormatter? maskFormatter;
  final String value;
  final String texthint;
  final TextStyle? labelStyle;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final VoidCallback? onChange;
  const ContainerWhiteForAccountProfile({
    super.key,
    required this.texthint,
    required this.value,
    this.labelStyle,
    required this.controller,
    this.onChange,
    this.maskFormatter,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(16), //TODO закругления
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onChanged: (value) => onChange,
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: value,
              hintStyle: labelStyle,
              labelStyle: labelStyle,
            ),
            keyboardType: TextInputType.phone,
          ),
          const Gap(8),
          Text(
            texthint,
            style: const TextStyle(), //TODO style
          ),
        ],
      ),
    );
  }
}
