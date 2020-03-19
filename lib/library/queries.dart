String getFollowersQuery = '''
  query GetFollowersQuery(\$first: Int!){
      viewer {
          followers(first: \$first) {
              totalCount
              pageInfo {
                  endCursor
                  hasNextPage
                  hasPreviousPage
                  startCursor
              }
              nodes {
                  databaseId
                  avatarUrl
                  email
                  name
              }
          }
      }
  }
''';

String getFollowingsQuery = '''
  query GetFollowingsQuery(\$first: Int!){
      viewer {
          following(first: \$first) {
            totalCount
            pageInfo {
                endCursor
                hasNextPage
                hasPreviousPage
                startCursor
            }
            nodes {
                databaseId
                avatarUrl
                email
                name
            }
        }
      }
  }
''';
