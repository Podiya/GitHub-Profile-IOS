//
//  ProfileDetailsService.swift
//  GitHub-Profile
//
//  Created by Ravindu Senevirathna on 2/3/21.
//

import Foundation

class ProfileDetailsService {
    
    func getProfileDetails(completion: @escaping (GraphQLResponse?, Error?) -> Void) {
        Network.shared.fetchDetails(completion: completion)
    }
}
