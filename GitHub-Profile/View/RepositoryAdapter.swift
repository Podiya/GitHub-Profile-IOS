//
//  RepositoryAdapter.swift
//  GitHub-Profile
//
//  Created by Ravindu Senevirathna on 2/3/21.
//

import UIKit
import SnapKit

class RepositoryAdapter: NSObject, UITableViewDelegate, UITableViewDataSource {
    let identifier = "RepositoryCell"
    
    var list: [Node]?
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! RepositoryCell
        cell.item = list?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .white
        let titleLabel = UILabel()
        titleLabel.font = UIFont.sourceSansProBlack(size: 20)
        titleLabel.textColor = .black
        titleLabel.text = "Pinned"
        headerView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { maker in
            maker.edges.equalTo(headerView).inset(UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15))
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
