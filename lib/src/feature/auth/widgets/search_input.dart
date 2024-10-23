import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';
import 'package:provider/provider.dart';

class SearchInput extends StatelessWidget {
  final FocusNode focusNode;
  const SearchInput({
    super.key,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    final TextTheme textTheme = themeData.textTheme;

    final SearchCityStore store = context.watch();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
            focusNode: focusNode,
            onTapOutside: (event) {
              focusNode.unfocus();
            },
            onChanged: (value) {
              store.setQuery(value);
              // searchState.searchCity(city: value);
              // setState(() {
              //   if (value.isNotEmpty) {
              //     isFull = true;
              //   } else {
              //     isFull = false;
              //   }
              // });
            },
            // onTap: () {
            //   setState(() {
            //     textFieldTap = true;
            //   });
            // },
            // controller: controller,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: t.register.searchPlace,
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.primaryColor,
                )),
          ),
        ),
      ],
    );
  }
}
