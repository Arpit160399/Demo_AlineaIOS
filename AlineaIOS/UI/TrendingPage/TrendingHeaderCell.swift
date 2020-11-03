//
//  TrendingCell.swift
//  AlineaIOS
//
//  Created by Arpit Singh on 02/11/20.
//

import UIKit

class TreandingHeaderCell: UITableViewCell {
    let label = UILabel()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setUpData(){
        contentView.backgroundColor = .white
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        contentView.addSubview(label)
        contentView.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.anchor(top: contentView.topAnchor, bottom: contentView.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor,padding: .init(top: 20, left: 20, bottom: -10, right: -20))
        contentView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        contentView.layer.cornerRadius = 4
    }
    
}
