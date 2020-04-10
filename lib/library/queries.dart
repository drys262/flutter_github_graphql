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
                  login
                  name
                  email
                  followers {
                      totalCount
                  }
                  following {
                      totalCount
                  }
                  repositories {
                      totalCount
                  }
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
                login
                name
                email
                followers {
                    totalCount
                }
                following {
                    totalCount
                }
                repositories {
                    totalCount
                }
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
              databaseId
              avatarUrl
              login
              name
              email
              followers {
                  totalCount
              }
              following {
                  totalCount
              }
              repositories {
                  totalCount
              }
              
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

String getUserProfileQuery = '''
query {
  viewer {
    databaseId
    avatarUrl
    login
    name
    email
    followers {
        totalCount
    }
    following {
        totalCount
    }
    repositories {
        totalCount
    }
  }
}
''';
