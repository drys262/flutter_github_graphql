import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

ValueNotifier<GraphQLClient> getGraphQLClient() {
  const String token = 'f2934c2f8911d84ceb2dd925460d873d317b8fad';
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
