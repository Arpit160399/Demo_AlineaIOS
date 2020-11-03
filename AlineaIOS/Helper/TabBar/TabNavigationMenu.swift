//
//  TabNavigationMenu.swift
//  AlineaIOS
//
//  Created by Arpit Singh on 28/10/20.
//

import UIKit


class CustomTabMenu: UIView {
    var selectedColor: UIColor = Themeing.shared.accent
    var color : UIColor = .black
    var selectedTintColor :UIColor = .white
    var itemTapped : ((_ tab: Int) -> Void)?
    private var activeTab = 0
    private let shadowView = UIView()
    private var customView = [UIView]()
    private var selectedBar : UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    fileprivate func updateView(_ menuItems: [TabItem]) {
        menuItems.enumerated().forEach { (index,item) in
            let view = createTabItem(item: item)
            view.clipsToBounds = true
            view.tag = index
            customView.append(view)
        }
        shadowView.backgroundColor = UIColor.white
        shadowView.layer.cornerRadius = 13
        addSubview(shadowView)
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.anchor(top: topAnchor,
                          bottom: bottomAnchor,
                          left: leftAnchor,
                          right: rightAnchor)
        let stackH = UIStackView(arrangedSubviews: customView)
        stackH.axis = .horizontal
        stackH.alignment = .fill
        stackH.distribution = .fillEqually
        createSelectedBar()
        shadowView.addSubview(stackH)
        stackH.anchor(top: shadowView.topAnchor, bottom: shadowView.bottomAnchor, left: shadowView.leftAnchor, right:shadowView.rightAnchor,padding: .init(top: 15, left: 0, bottom: -15, right: -0))
        activateTab(tab: 1)
    }
    
    convenience init(menuItems: [TabItem] ,frame: CGRect) {
        self.init(frame: frame)
        updateView(menuItems)
    }
    
    func createSelectedBar(){
        let frame = self.frame
        let width = frame.width / CGFloat(customView.count)
        selectedBar = UIView(frame: .init(x: 0, y: 0, width: width, height: frame.height))
        selectedBar.backgroundColor = selectedColor
        selectedBar.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        selectedBar.layer.cornerRadius = 5
        shadowView.addSubview(selectedBar)
    }
    
    func createTabItem(item: TabItem) -> UIView {
        let imageView = UIImageView(frame: .zero)
        imageView.image = item.name.withRenderingMode(.alwaysTemplate)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFit
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
        imageView.tintColor = color
        return imageView
    }
    
    @objc func handleTap(_ sender: UIGestureRecognizer){
        switchTab(from: activeTab, to: sender.view?.tag ?? 0)
    }
    
    func switchTab(from: Int,to: Int){
        deactiveTab(tab: from)
        activateTab(tab: to)
    }
    
    func activateTab(tab: Int){
        let postions =  frame.width / CGFloat(customView.count) * CGFloat(tab)
        UIView.animate(withDuration: 0.4, delay: 0.1, options: .curveEaseInOut, animations: {
            self.selectedBar.frame.origin.x = postions
            if tab < self.customView.count {
                self.customView[tab].tintColor = self.selectedTintColor
            }

        }, completion: nil)
        self.itemTapped?(tab)
    }
    
    func deactiveTab(tab: Int){
        customView.forEach { (view) in
            view.tintColor  = color
        }
    }
    
}
