//
//  SectionCell.swift
//  AlineaIOS
//
//  Created by Arpit Singh on 02/11/20.
//

import UIKit
class SectionCells : UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func addedChildView(view: UIView){
        contentView.addSubview(view)
        view.anchor(top: contentView.topAnchor, bottom: contentView.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor)
    }
    
}
