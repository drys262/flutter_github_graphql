import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_github_graphql/config/service_locator.dart';
import 'package:flutter_github_graphql/models/index.dart';
import 'package:flutter_github_graphql/view_models/search/search_model.dart';
import 'package:flutter_github_graphql/widgets/loading_list.dart';
import 'package:flutter_github_graphql/widgets/user_tile.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchModel searchModel = locator<SearchModel>();
    return SafeArea(
      minimum: const EdgeInsets.all(0.0),
      child: SearchBar<User>(
        searchBarPadding: const EdgeInsets.symmetric(horizontal: 10),
        headerPadding: const EdgeInsets.symmetric(horizontal: 10),
        listPadding: const EdgeInsets.symmetric(horizontal: 10),
        onSearch: (String search) async {
          return await searchModel.searchUser(search);
        },
        onItemFound: (User user, int index) {
          return UserTile(
            user: user,
          );
        },
        loader: const LoadingListShimmer(),
      ),
    );
  }
}
