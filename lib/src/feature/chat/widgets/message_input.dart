import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:reactive_forms/reactive_forms.dart';

class MessageInput extends StatelessWidget {
  final String formControllName;
  const MessageInput({super.key, required this.formControllName});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    return ReactiveTextField(
      textAlignVertical: TextAlignVertical.center,
      formControlName: formControllName,
      keyboardType: TextInputType.multiline,
      minLines: 1,
      maxLines: null,
      style: textTheme.titleSmall,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: t.chat.messageHint,
        hintStyle:
            textTheme.titleSmall!.copyWith(color: AppColors.greyBrighterColor),

        //TODO! сделать кнопки внизу
        prefixIcon: IconButton(
          onPressed: () {},
          icon: Image.asset(
            Assets.icons.smile.path,
            height: 28,
          ),
        ),
        suffixIcon: ReactiveValueListenableBuilder(
          formControlName: formControllName,
          builder: (context, control, child) {
            if (control.value != null && control.value != '') {
              return IconButton(
                onPressed: () {},
                icon: Image.asset(
                  Assets.icons.send.path,
                  height: 28,
                ),
              );
            }
            return Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    Assets.icons.attach.path,
                    height: 24,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    Assets.icons.sound.path,
                    height: 28,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
