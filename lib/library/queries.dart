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

String searchQuery = '''
query SearchRepos(\$query: String!, \$type: SearchType!, \$first: Int) {
  search(query: \$query, type: \$type, first: \$first) {
      edges {
          node {
            ... on User {
              name
              databaseId
              login
              email
              avatarUrl
              
            }
            ... on Repository {
              name
              descriptionHTML
              databaseId
              stargazers {
                totalCount
              }
              forks {
                totalCount
              }
              updatedAt
            }
          }
      }
  }
}
''';
