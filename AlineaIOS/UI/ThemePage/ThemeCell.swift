//
//  ThemeCEll.swift
//  AlineaIOS
//
//  Created by Arpit Singh on 02/11/20.
//

import UIKit

class ThemeCells: UICollectionViewCell {
    private let icons  = UIImageView()
    private let labelText = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = Themeing.shared.secondary
        contentView.layer.cornerRadius = 6
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = Themeing.shared.secondaryDark.cgColor
        icons.contentMode = .scaleAspectFit
        let vstack = UIStackView(arrangedSubviews: [icons,labelText])
        vstack.axis = .vertical
        vstack.alignment = .center
        vstack.distribution = .fillProportionally
        contentView.addSubview(vstack)
        vstack.anchor(top: contentView.topAnchor, bottom: contentView.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor,padding: .init(top: 10, left: 10, bottom: -10, right: -10))
        contentView.layer.cornerRadius = 6
    }
    
    func setData(name: String,image: String){
        labelText.text = name
        labelText.numberOfLines = 0
        labelText.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        icons.image = UIImage(named: image)?.withRenderingMode(.alwaysOriginal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
