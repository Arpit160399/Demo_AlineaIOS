//
//  ThemePage.swift
//  AlineaIOS
//
//  Created by Arpit Singh on 02/11/20.
//

import UIKit
class  ThemePage: UIView {
    
    let items = [Theme(name: "Diversity & Inclusion", icon: "male_and_female"),Theme(name: "Bold Biotech", icon: "biotech"),Theme(name: "Crypto Central", icon: "bitcoin"),Theme(name: "She runs it", icon: "royal"),Theme(name: "Clean & Green", icon: "recycle"),Theme(name: "Cannabis-ness", icon: "cannabis"),Theme(name: "Power it", icon: "lightning_bolt"),Theme(name: "Foodies Fun", icon: "food"),Theme(name: "Art & Fashion", icon: "womens_suit")]
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor  = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = true
       return collectionView
    }()
    let cellID = "CellID"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ThemeCells.self, forCellWithReuseIdentifier: cellID)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.anchor(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor,padding: .init(top: 0, left: 15, bottom: 0, right: -15))
        collectionView.contentInset = .init(top: 20, left: 0, bottom: 70, right: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - data source
extension ThemePage: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! ThemeCells
        let theme = items[indexPath.row]
        cell.setData(name: theme.name, image: theme.icon)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (frame.width / 2) - 25
        let height = width + width * 0.089
        return .init(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }

}


