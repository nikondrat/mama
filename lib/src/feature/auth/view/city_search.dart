import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';
import 'package:mama/src/feature/auth/widgets/city_search_body.dart';
import 'package:provider/provider.dart';

class CitySearchView extends StatelessWidget {
  const CitySearchView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final VerifyStore verifyStore = context.watch();

    return Provider(
      create: (context) => SearchCityStore(
        restClient: context.read<Dependencies>().restClient,
      ),
      builder: (context, child) {
        final SearchCityStore store = Provider.of<SearchCityStore>(context);

        return Scaffold(
          body: BodyDecoration(
            backgroundImage: DecorationImage(
              image: AssetImage(
                Assets.images.authDecor.path,
              ),
              alignment: Alignment.topLeft,
            ),
            child: CitySearchBody(
              store: store,
              verifyStore: verifyStore,
              authViewStore: context.watch(),
            ),
          ),
        );
      },
    );
  }
}
