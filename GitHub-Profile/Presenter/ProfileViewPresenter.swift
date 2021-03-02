//
//  ProfileViewPresenter.swift
//  GitHub-Profile
//
//  Created by Ravindu Senevirathna on 2/3/21.
//

import Foundation

protocol ProfileViewDelegate {
    func setProfileDetails(details: Viewer)
    func showError(error: String)
}

class ProfileViewPresenter {
    private let service: ProfileDetailsService
    private var delegate: ProfileViewDelegate?
    
    init(service: ProfileDetailsService) {
        self.service = service
    }
    
    func delegate(_ delegate: ProfileViewDelegate) {
        self.delegate = delegate
    }
    
    func getProfileDetails() {
        service.getProfileDetails { (response, error) in
            guard let response = response else {
                self.delegate?.showError(error: error?.localizedDescription ?? "Error occurred")
                return
            }
            self.delegate?.setProfileDetails(details: response.data.viewer)
        }
    }
}
