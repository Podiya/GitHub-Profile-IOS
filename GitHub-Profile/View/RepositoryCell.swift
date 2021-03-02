//
//  RepositoryCell.swift
//  GitHub-Profile
//
//  Created by Ravindu Senevirathna on 2/3/21.
//

import UIKit

class RepositoryCell: UITableViewCell {
    
    lazy var parentView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1).cgColor
        view.layer.cornerRadius = 5
        return view
    }()
    
    lazy var projectTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.sourceSansProBold(size: 16)
        label.textColor = .black
        label.text = ""
        return label
    }()
    
    lazy var starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "yellow-star")
        return imageView
    }()
    
    lazy var starCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.sourceSansProRegular(size: 14)
        label.textColor = .black
        label.text = ""
        return label
    }()
    
    lazy var languageDot: UIView = {
        let dot = UIView()
        dot.layer.cornerRadius = 6
        return dot
    }()
    
    lazy var languageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.sourceSansProRegular(size: 14)
        label.textColor = .black
        label.text = ""
        return label
    }()
    
    var item: Node? {
        didSet {
            guard let item = item else { return }
            setItem(item)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        selectionStyle = .none
        
        contentView.addSubview(parentView)
        parentView.snp.makeConstraints { maker in
            maker.edges.equalTo(contentView).inset(UIEdgeInsets(top: 8, left: 15, bottom: 8, right: 15))
            maker.height.equalTo(80)
        }
        
        parentView.addSubview(projectTitle)
        projectTitle.snp.makeConstraints { maker in
            maker.height.equalTo(20)
            maker.top.equalTo(parentView.snp.topMargin).offset(5)
            maker.leading.equalTo(parentView.snp.leadingMargin).offset(5)
            maker.trailing.equalTo(parentView.snp.trailingMargin).offset(5)
        }
        
        parentView.addSubview(starImageView)
        starImageView.snp.makeConstraints { (maker) in
            maker.height.equalTo(10)
            maker.width.equalTo(10)
            maker.top.equalTo(projectTitle.snp.bottom).offset(15)
            maker.leading.equalTo(parentView.snp.leadingMargin).offset(5)
        }
        
        parentView.addSubview(starCountLabel)
        starCountLabel.snp.makeConstraints { maker in
            maker.height.equalTo(20)
            maker.leading.equalTo(starImageView.snp.trailing).offset(5)
            maker.centerY.equalTo(starImageView.snp.centerY)
        }
        
        parentView.addSubview(languageDot)
        languageDot.snp.makeConstraints { maker in
            maker.height.equalTo(12)
            maker.width.equalTo(12)
            maker.leading.equalTo(starCountLabel.snp.trailing).offset(20)
            maker.centerY.equalTo(starCountLabel.snp.centerY)
        }
        
        parentView.addSubview(languageLabel)
        languageLabel.snp.makeConstraints { maker in
            maker.height.equalTo(20)
            maker.leading.equalTo(languageDot.snp.trailing).offset(5)
            maker.centerY.equalTo(languageDot.snp.centerY)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setItem(_ item: Node) {
        projectTitle.text = item.name
        starCountLabel.text = "\(item.stargazers.totalCount)"
        if let language = item.primaryLanguage {
            languageDot.backgroundColor =  UIColor(hex: "\(language.color)")
            languageLabel.text = language.name
        }
        
    }
}
