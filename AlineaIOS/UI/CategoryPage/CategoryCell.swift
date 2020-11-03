//
//  CategoryCell.swift
//  AlineaIOS
//
//  Created by Arpit Singh on 02/11/20.
//

import UIKit

class CategoryCell: UITableViewCell {
    
   private let ovelView = UIView()
   private let icons = UIImageView()
   lazy var sperater = UIView(frame: .init(x: 0, y: 0, width: contentView.frame.width, height: 0.5))
   private let title = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        preservesSuperviewLayoutMargins = false
        separatorInset = .zero
        layoutMargins = .zero
        setUpCategoryView()
        setUpIconView()
        setUpTitleLable()
        sperater.backgroundColor = .systemGray5
        contentView.addSubview(sperater)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        ovelView.layer.cornerRadius = ovelView.frame.height / 2
        icons.layer.cornerRadius = icons.frame.width / 2
    }
    
    fileprivate func setUpIconView() {
        icons.layer.borderWidth = 2
        icons.layer.borderColor = UIColor.white.cgColor
        icons.tintColor = .white
        icons.clipsToBounds = true
        icons.contentMode = .scaleAspectFit
        ovelView.addSubview(icons)
        icons.translatesAutoresizingMaskIntoConstraints = false
        icons.leftAnchor.constraint(equalTo: ovelView.leftAnchor,constant: 25).isActive = true
        icons.centerYAnchor.constraint(equalTo: ovelView.centerYAnchor).isActive = true
        icons.topAnchor.constraint(greaterThanOrEqualTo: ovelView.topAnchor,constant: 20).isActive = true
        icons.widthAnchor.constraint(equalToConstant: 30).isActive = true
        icons.heightAnchor.constraint(equalToConstant: 30).isActive = true
        icons.bottomAnchor.constraint(lessThanOrEqualTo: ovelView.bottomAnchor,constant: -20).isActive = true
    }
    
   fileprivate func setUpCategoryView(){
        ovelView.layer.shadowOpacity = 0.15
        ovelView.layer.shadowOffset = .init(width: 0.0, height: 0.4)
        ovelView.layer.shadowRadius = 4
        contentView.addSubview(ovelView)
        ovelView.translatesAutoresizingMaskIntoConstraints = false
        ovelView.anchor(top: contentView.topAnchor, bottom: contentView.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor,padding: .init(top: 15, left: 20, bottom: -15, right: -20))
    }
    
   fileprivate func setUpTitleLable(){
        title.textColor = .white
        title.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        ovelView.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints  = false
        title.leftAnchor.constraint(equalTo: icons.rightAnchor,constant: 20).isActive = true
        title.centerYAnchor.constraint(equalTo: ovelView.centerYAnchor).isActive = true
        title.topAnchor.constraint(greaterThanOrEqualTo: ovelView.topAnchor,constant: 20).isActive = true
        title.bottomAnchor.constraint(lessThanOrEqualTo: ovelView.bottomAnchor,constant: -20).isActive = true
   }
    
    func SetCategory(categoryName: String ,color: UIColor){
        title.text = categoryName
        icons.image = UIImage(named: categoryName)?.imageWithInsets(insets: .init(top: 10, left: 10, bottom: 10, right: 10))?.withRenderingMode(.alwaysTemplate)
        ovelView.backgroundColor = color
    }
}
