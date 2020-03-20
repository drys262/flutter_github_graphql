import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_github_graphql/config/service_locator.dart';
import 'package:flutter_github_graphql/screens/base.dart';

Future<void> main() async {
  await DotEnv().load('.env');
  setupLocator();
  runApp(const Base());
}
