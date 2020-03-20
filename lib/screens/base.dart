import 'package:flutter/material.dart';
import 'package:flutter_github_graphql/config/service_locator.dart';
import 'package:flutter_github_graphql/library/graphql-client.dart';
import 'package:flutter_github_graphql/view_models/app/app_model.dart';
import 'package:flutter_github_graphql/screens/app.dart';
import 'package:flutter_github_graphql/view_models/connect/connect_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Base extends StatelessWidget {
  const Base({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<AppModel>(
          create: (_) => locator<AppModel>(),
        ),
        ChangeNotifierProvider<ConnectModel>(
          create: (_) => locator<ConnectModel>(),
        )
      ],
      child: GraphQLProvider(
        client: getGraphQLClient(),
        child: const CacheProvider(child: App()),
      ),
    );
  }
}
