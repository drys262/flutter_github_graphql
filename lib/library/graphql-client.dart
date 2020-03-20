import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

ValueNotifier<GraphQLClient> getGraphQLClient() {
  final String token = DotEnv().env['GITHUB_TOKEN'];
  final HttpLink httpLink = HttpLink(uri: 'https://api.github.com/graphql');
  final AuthLink authLink = AuthLink(getToken: () => 'Bearer $token');
  final Link link = authLink.concat(httpLink);
  return ValueNotifier<GraphQLClient>(
    GraphQLClient(
      link: link,
      cache: InMemoryCache(),
    ),
  );
}
