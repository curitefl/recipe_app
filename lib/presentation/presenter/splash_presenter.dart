import 'package:flutter/cupertino.dart';
import 'package:recipe_app/domain/use_case/splash_use_case.dart';
import 'package:recipe_app/presentation/component/policy_component.dart';
import 'package:recipe_app/presentation/component/app_update_component.dart';

class SplashPresenter {
  final SplashUseCase _splashUseCase;

  SplashPresenter(
    final this._splashUseCase,
  );

  Future<void> showPolicyDialog(BuildContext context) async {
    final isPolicyUpdated = await _splashUseCase.isPolicyUpdated();

    if (isPolicyUpdated) {
      return;
    }
    await PolicyComponent(
      onConfirmed: () async => await _splashUseCase.agreeNewPolicyVersion(),
    ).showPolicyDialog(context);
  }

  Future<void> showAppUpdateDialog(BuildContext context) async {
    final isAppUpdated = await _splashUseCase.isAppUpdated();

    if (isAppUpdated) {
      return;
    }
    await AppUpdateComponent().showAppUpdateDialog(context);
  }
}
