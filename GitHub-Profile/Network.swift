//
//  Network.swift
//  GitHub-Profile
//
//  Created by Ravindu Senevirathna on 2/3/21.
//

import Foundation

class Network {
    private init() { }
    public static let shared = Network()
    
    func fetchDetails(completion: @escaping (GraphQLResponse?, Error?) -> Void) {
        let semaphore = DispatchSemaphore (value: 0)

        let parameters = "{\"query\":\"query {\\n  viewer {\\n    id\\n    avatarUrl\\n    login\\n    name\\n    email\\n    followers {\\n      totalCount\\n    }\\n    following {\\n      totalCount\\n    }\\n    pinnedItems(first: 3, types: REPOSITORY) {\\n      nodes {\\n        ... on Repository {\\n          name\\n          stargazers {\\n            totalCount\\n          }\\n          primaryLanguage {\\n            name\\n            color\\n          }\\n        }\\n      }\\n    },\\n    starredRepositories(first: 10) {\\n      nodes {\\n          name\\n          stargazers {\\n            totalCount\\n          }\\n          primaryLanguage {\\n            name\\n            color\\n          }\\n      }\\n    }\\n  }\\n}\",\"variables\":{}}"
        let postData = parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: "https://api.github.com/graphql")!,timeoutInterval: Double.infinity)
        request.addValue("Bearer dbf39623be8a9d2663babdbe6aa6019735f7b88d", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.graphQLResponseTask(with: request) { (graphQLResoponse, urlResponse, error) in
            completion(graphQLResoponse, error)
            semaphore.signal()
        }

        task.resume()
        semaphore.wait()
    }
}
