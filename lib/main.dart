import 'package:flutter/material.dart';
import 'package:flutter_github_graphql/config/service_locator.dart';
import 'package:flutter_github_graphql/screens/base.dart';

void main() {
  setupLocator();
  runApp(const Base());
}
