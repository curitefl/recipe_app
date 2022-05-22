import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_app/domain/provider/repository_providers.dart';
import 'package:recipe_app/domain/use_case/splash_use_case.dart';
import 'package:recipe_app/presentation/presenter/splash_presenter.dart';

final splashUseCaseProvider = Provider(
  (ref) => SplashUseCase(
    ref.watch(applicationRepositoryProvider),
    ref.watch(preferenceRepositoryProvider),
  ),
);

final splashPresenterProvider = Provider(
  (ref) => SplashPresenter(
    ref.watch(splashUseCaseProvider),
  ),
);
