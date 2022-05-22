import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_app/domain/provider/splash_providers.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final presenter = ref.watch(splashPresenterProvider);

    Future.delayed(
      Duration.zero,
      () async {
        await presenter.showPolicyDialog(context);
        await presenter.showAppUpdateDialog(context);
        // TODO サインインページに遷移する
        // Navigator.of(context).pushNamed('/${TextData.signInPage}');
      },
    );

    return const Scaffold();
  }
}
