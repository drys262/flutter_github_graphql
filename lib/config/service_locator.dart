import 'package:flutter_github_graphql/view_models/app/app_model.dart';
import 'package:flutter_github_graphql/view_models/app/app_model_impl.dart';
import 'package:flutter_github_graphql/view_models/connect/connect_model.dart';
import 'package:flutter_github_graphql/view_models/connect/connect_model_impl.dart';
import 'package:flutter_github_graphql/view_models/search/search_model.dart';
import 'package:flutter_github_graphql/view_models/search/search_model_impl.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<AppModel>(() => AppModelImplementation());
  locator.registerLazySingleton<SearchModel>(() => SearchModelImplementation());
  locator
      .registerLazySingleton<ConnectModel>(() => ConnectModelImplementation());
}
