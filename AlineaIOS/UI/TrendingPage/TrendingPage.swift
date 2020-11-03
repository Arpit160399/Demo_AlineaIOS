//
//  TrendingPAge.swift
//  AlineaIOS
//
//  Created by Arpit Singh on 02/11/20.
//

import UIKit
class TrendingPage: UIView {
    
    let data = [List(title: "Top Gainer", items: [Treding(icons: "health_book", Title: "Medifast", rate: 50.78, type: "MEDI"),Treding(icons: "pinterest", Title: "Pinterest", rate: -4.77, type: "PINS"),Treding(icons: "slack", Title: "Slack Tenhnologies", rate: -5.99, type: "PINS"),Treding(icons: "bottle_of_water", Title: "Evoqua Water", rate: 5.99, type: "PINS")]),List(title: "Top Seller", items: [Treding(icons: "slack", Title: "Slack Tenhnologies", rate: -5.99, type: "WORK"),Treding(icons: "bottle_of_water", Title: "Evoqua Water", rate: 5.99, type: "AQUA")])]
    let tableview = UITableView(frame: .zero)
    let cellId = "cellID"
    let cellHeader = "cellHeader"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableview)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(TrendindCell.self, forCellReuseIdentifier: cellId)
        tableview.register(TreandingHeaderCell.self, forCellReuseIdentifier: cellHeader)
        tableview.sectionFooterHeight = 5
        tableview.backgroundColor = UIColor(displayP3Red: 250/255, green: 250/255, blue: 251/255, alpha: 1)
        backgroundColor = UIColor(displayP3Red: 250/255, green: 250/255, blue: 251/255, alpha: 1)
        tableview.separatorStyle = .none
        tableview.contentInset = .init(top: 0, left: 0, bottom: 70, right: 0)
        tableview.anchor(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor,padding: .init(top: 0, left: 5, bottom: 0, right: -5))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK:- Trending Page
extension TrendingPage : UITableViewDataSource , UITableViewDelegate {func
      
    numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].items.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableview.dequeueReusableCell(withIdentifier: cellHeader) as! TreandingHeaderCell
            cell.label.text = data[indexPath.section].title
            return cell
        } else {
            let cell = tableview.dequeueReusableCell(withIdentifier: cellId) as! TrendindCell
            let list = data[indexPath.section]
            let item = list.items[indexPath.row - 1]
            cell.separaterView.isHidden = indexPath.row - 1 == 0 ? true : false
            cell.setData(data: item)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UIView()
        return footer
    }
    
}
