//
//  CategoryPage.swift
//  AlineaIOS
//
//  Created by Arpit Singh on 02/11/20.
//

import UIKit
class CategoryPage: UIView{
    
    let items = [Category(name: "Stocks", Color: UIColor.init(displayP3Red: 165/255, green: 164/255, blue: 249/255, alpha: 1)),Category(name: "ETFs",Color: UIColor.init(displayP3Red: 78/255, green: 79/255, blue: 204/255, alpha: 1)),Category(name:"Crypto",Color: UIColor.init(displayP3Red: 251/255, green: 215/255, blue: 74/255, alpha: 1))]
    let tableView = UITableView(frame: .zero)
    let cellID = "CellID"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
        tableView.backgroundColor = Themeing.shared.secondary
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CategoryCell.self, forCellReuseIdentifier: cellID)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.anchor(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
//MARK: - data source
extension CategoryPage : UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CategoryCell
        let catgory = items[indexPath.row]
        cell.sperater.isHidden = indexPath.row == 0 ? true : false
        cell.SetCategory(categoryName: catgory.name, color: catgory.Color)
        return cell
    }

}
