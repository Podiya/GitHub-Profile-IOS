//
//  ProfileViewController.swift
//  GitHub-Profile
//
//  Created by Ravindu Senevirathna on 1/3/21.
//

import UIKit
import SnapKit
import Kingfisher

class ProfileViewController: UIViewController {
    
    private let presenter = ProfileViewPresenter(service: ProfileDetailsService())
    private let pinnedRepositoryAdapter = RepositoryAdapter()
    
    lazy var headerView: UIView = {
        let header = UIView()
        return header
    }()
    
    lazy var headerTitle: UILabel = {
        let title = UILabel()
        title.text = "Profile"
        title.font = UIFont.sourceSansProBold(size: 20)
        title.textColor = .black
        return title
    }()

    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.sourceSansProBlack(size: 32)
        label.textColor = .black
        label.text = ""
        return label
    }()
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.sourceSansProLight(size: 16)
        label.textColor = .black
        label.text = ""
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.sourceSansProRegular(size: 16)
        label.textColor = .black
        return label
    }()
    
    lazy var followersCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.sourceSansProBold(size: 16)
        label.textColor = .black
        label.text = "0"
        return label
    }()
    
    lazy var followersLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.sourceSansProLight(size: 16)
        label.textColor = .black
        label.text = "followers"
        return label
    }()
    
    lazy var followingCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.sourceSansProBold(size: 16)
        label.textColor = .black
        label.text = "0"
        return label
    }()
    
    lazy var followingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.sourceSansProLight(size: 16)
        label.textColor = .black
        label.text = "following"
        return label
    }()
    
    
    
    lazy var nameAndUserNameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 5
        stackView.distribution = .fill
        let topSpacerView = UIView()
        topSpacerView.setContentHuggingPriority(.defaultLow, for: .vertical)
        let bottomSpacerView = UIView()
        bottomSpacerView.setContentHuggingPriority(.defaultLow, for: .vertical)
        stackView.addArrangedSubview(topSpacerView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(userNameLabel)
        stackView.addArrangedSubview(bottomSpacerView)
        return stackView
    }()
    
    lazy var followerCountLabelAndFollowerLabel: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.distribution = .fill
        let spacerView = UIView()
        spacerView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        stackView.addArrangedSubview(followersCountLabel)
        stackView.addArrangedSubview(followersLabel)
        stackView.addArrangedSubview(spacerView)
        return stackView
    }()
    
    lazy var followingCountLabelAndFollowingLabel: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.distribution = .fill
        let spacerView = UIView()
        spacerView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        stackView.addArrangedSubview(followingCountLabel)
        stackView.addArrangedSubview(followingLabel)
        stackView.addArrangedSubview(spacerView)
        return stackView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = pinnedRepositoryAdapter.self
        tableView.dataSource = pinnedRepositoryAdapter
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.backgroundColor = .white
        tableView.register(RepositoryCell.self, forCellReuseIdentifier: pinnedRepositoryAdapter.identifier)
        tableView.tableFooterView = UIView()
        return tableView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        headerView.addSubview(headerTitle)
        headerTitle.snp.makeConstraints { maker in
            maker.center.equalTo(headerView)
        }
        view.addSubview(headerView)
        headerView.snp.makeConstraints { maker in
            maker.height.equalTo(50)
            maker.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            maker.width.equalTo(UIScreen.main.bounds.width)
        }
        
        view.addSubview(profileImageView)
        profileImageView.snp.makeConstraints { maker in
            maker.height.equalTo(100)
            maker.width.equalTo(100)
            maker.leading.equalTo(view).inset(20)
            maker.top.equalTo(self.headerView.snp.bottom).offset(10)
        }

        view.addSubview(nameAndUserNameStackView)
        nameAndUserNameStackView.snp.makeConstraints { maker in
            maker.height.equalTo(80)
            maker.leading.equalTo(profileImageView.snp.trailing).offset(6)
            maker.trailing.equalTo(view).inset(20)
            maker.top.equalTo(self.headerView.snp.bottom).offset(20)
        }
        
        view.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { maker in
            maker.height.equalTo(25)
            maker.leading.equalTo(view).inset(20)
            maker.top.equalTo(self.profileImageView.snp.bottom).offset(10)
        }
        
        view.addSubview(followerCountLabelAndFollowerLabel)
        followerCountLabelAndFollowerLabel.snp.makeConstraints { maker in
            maker.height.equalTo(25)
            maker.leading.equalTo(view).inset(20)
            maker.top.equalTo(self.emailLabel.snp.bottom).offset(10)
        }
        
        view.addSubview(followingCountLabelAndFollowingLabel)
        followingCountLabelAndFollowingLabel.snp.makeConstraints { maker in
            maker.height.equalTo(25)
            maker.leading.equalTo(followerCountLabelAndFollowerLabel.snp.trailing).offset(10)
            maker.top.equalTo(self.emailLabel.snp.bottom).offset(10)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { maker in
            maker.top.equalTo(self.followingCountLabelAndFollowingLabel.snp.bottom).offset(10)
            maker.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            maker.width.equalTo(UIScreen.main.bounds.width)
        }
        presenter.delegate(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.getProfileDetails()
    }
}


extension ProfileViewController: ProfileViewDelegate {
    func setProfileDetails(details: Viewer) {
        DispatchQueue.main.async {
            self.nameLabel.text = details.name
            self.userNameLabel.text = details.login
            self.emailLabel.text = details.email
            self.followersCountLabel.text = "\(details.followers.totalCount)"
            self.followingCountLabel.text = "\(details.following.totalCount)"
            self.profileImageView.kf.setImage(with: URL(string: details.avatarURL)!)
            self.pinnedRepositoryAdapter.list = details.pinnedItems.nodes
            self.tableView.reloadData()
        }
    }
    
    func showError(error: String) {
        
    }
}


