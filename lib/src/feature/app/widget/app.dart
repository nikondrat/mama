import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mama/src/data.dart';

/// [App] is an entry point to the application.
///
/// Scopes that don't depend on widgets returned by [MaterialApp]
/// ([Directionality], [MediaQuery], [Localizations]) should be placed here.
class App extends StatelessWidget {
  const App({required this.result, super.key});

  /// The initialization result from the [InitializationProcessor]
  /// which contains initialized dependencies.
  final InitializationResult result;

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          Provider(
            create: (context) => result.dependencies,
          ),
          Provider(
              create: (context) => AuthStore(
                    restClient: context.read<Dependencies>().restClient,
                    tokenStorage: context.read<Dependencies>().tokenStorage,
                  )),
          Provider(
            create: (context) => AuthViewStore(),
            dispose: (context, value) => value.dispose(),
          ),
          Provider(
              create: (context) => VerifyStore(
                    restClient: context.read<Dependencies>().restClient,
                    tokenStorage: context.read<Dependencies>().tokenStorage,
                  )),
          Provider(
            create: (context) => UserStore(
              restClient: context.read<Dependencies>().restClient,
            ),
          ),
          Provider(
            create: (context) => ChildStore(
              userStore: context.read<UserStore>(),
              restClient: context.read<Dependencies>().restClient,
            ),
          ),
        ],
        child: TranslationProvider(child: const MaterialContext()),
      );
}
