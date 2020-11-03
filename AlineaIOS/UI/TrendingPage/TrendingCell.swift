//
//  TrendingCell.swift
//  AlineaIOS
//
//  Created by Arpit Singh on 02/11/20.
//

import UIKit

class TrendindCell: UITableViewCell {
    
    private let ratingView = UIView()
    var separaterView :UIView!
    private let icons : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    private let title : UILabel = {
         let title = UILabel()
         title.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        title.textColor = Themeing.shared.fontPrimary
         return title
    }()
    private let type : UILabel = {
        let type = UILabel()
        type.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        type.textColor = Themeing.shared.fontSecondary
        return type
    }()
    private let rate : UILabel = {
        let rate = UILabel()
        rate.textColor = .white
        rate.textAlignment = .center
        rate.font = UIFont.systemFont(ofSize: 11, weight: .bold)
        return rate
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        separaterView = UIView(frame: .init(x: 0, y: 0, width: frame.width, height: 0.5))
        contentView.backgroundColor = .white
        separaterView.backgroundColor = .systemGray5
        contentView.addSubview(separaterView)
        setUpIcon()
        setUpRating()
        setUpTitle()
        setUpSubTitle()
    }
    
    fileprivate func setUpIcon(){
        contentView.addSubview(icons)
        icons.translatesAutoresizingMaskIntoConstraints = false
        icons.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor,constant: 10).isActive = true
        icons.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 20).isActive = true
        icons.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        icons.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor,constant: -10).isActive = true
        icons.heightAnchor.constraint(equalToConstant: 50).isActive = true
        icons.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    fileprivate func setUpRating(){
        contentView.addSubview(ratingView)
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        ratingView.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -20).isActive = true
        ratingView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor,constant: 10).isActive = true
        ratingView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor,constant: 10).isActive = true
        ratingView.widthAnchor.constraint(equalToConstant: 73).isActive = true
        ratingView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        ratingView.addSubview(rate)
        rate.translatesAutoresizingMaskIntoConstraints = false
        rate.anchor(top: ratingView.topAnchor, bottom: ratingView.bottomAnchor, left: ratingView.leftAnchor, right: ratingView.rightAnchor,padding: .init(top: 3, left: 7, bottom: -3, right: -7))
    }

    fileprivate func setUpTitle(){
        contentView.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor,constant: 10).isActive = true
        title.bottomAnchor.constraint(equalTo: contentView.centerYAnchor,constant: -2).isActive = true
        title.rightAnchor.constraint(equalTo: ratingView.leftAnchor,constant: 10).isActive = true
        title.leftAnchor.constraint(equalTo: icons.rightAnchor,constant: 10).isActive = true
    }
    
    fileprivate func setUpSubTitle(){
        contentView.addSubview(type)
        type.translatesAutoresizingMaskIntoConstraints = false
        type.topAnchor.constraint(equalTo: contentView.centerYAnchor,constant: 2).isActive = true
        type.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor,constant: -10).isActive = true
        type.rightAnchor.constraint(equalTo: ratingView.leftAnchor,constant: -10).isActive = true
        type.leftAnchor.constraint(equalTo: icons.rightAnchor,constant: 10).isActive = true
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        icons.clipsToBounds = true
        icons.layer.cornerRadius = icons.frame.width / 2
        ratingView.layer.cornerRadius = ratingView.frame.height / 2
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setData(data: Treding){
        icons.image = UIImage(named: data.icons)?.withRenderingMode(.alwaysOriginal)
        title.text = data.Title
        type.text = data.type
        if data.rate > 0 {
        rate.text = "+\(data.rate)%"
            ratingView.backgroundColor = Themeing.shared.success
        } else {
            rate.text = "\(data.rate)%"
            ratingView.backgroundColor = Themeing.shared.failer
        }
    }
}
