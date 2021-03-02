//
//  Viewer.swift
//  GitHub-Profile
//
//  Created by Ravindu Senevirathna on 2/3/21.
//

import Foundation

// MARK: - GraphQLResponse
struct GraphQLResponse: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let viewer: Viewer
}

// MARK: - Viewer
struct Viewer: Codable {
    let id: String
    let avatarURL: String
    let login, name, email: String
    let followers, following: Followers
    let pinnedItems, starredRepositories: PinnedItems

    enum CodingKeys: String, CodingKey {
        case id
        case avatarURL = "avatarUrl"
        case login, name, email, followers, following, pinnedItems, starredRepositories
    }
}

// MARK: - Followers
struct Followers: Codable {
    let totalCount: Int
}

// MARK: - PinnedItems
struct PinnedItems: Codable {
    let nodes: [Node]
}

// MARK: - Node
struct Node: Codable {
    let name: String
    let stargazers: Followers
    let primaryLanguage: PrimaryLanguage?
}

// MARK: - PrimaryLanguage
struct PrimaryLanguage: Codable {
    let name: String
    let color: String
}
