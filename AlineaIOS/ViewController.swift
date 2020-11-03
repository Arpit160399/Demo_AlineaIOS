//
//  ViewController.swift
//  AlineaIOS
//
//  Created by Arpit Singh on 27/10/20.
//

import UIKit

class ViewController: UIViewController {

    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collection.isScrollEnabled = false
        collection.backgroundColor = .white
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    let sections = ["Category","Themes","Trending"]
    let sectionViews = [CategoryPage(),ThemePage(),TrendingPage()]
    lazy var segmentControl = SegementControl(title: sections)
    let cellID = "CellID"
    
    fileprivate func setUpNavbar() {
        view.backgroundColor = Themeing.shared.secondary
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .black
        navigationItem.title = "Explore"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "icons8-menu"), style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "icons8-doorbell"), style: .plain, target: nil, action: nil)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavbar()
        setUpSegementControl()
        setUpCollectionView()
    }
    
    
    fileprivate func setUpSegementControl(){
        segmentControl.backgroundColor = .white
        segmentControl.selectedColor = Themeing.shared.accent
        segmentControl.selectedTextColor = Themeing.shared.accent
        segmentControl.delegate = self
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentControl)
        NSLayoutConstraint.activate([
            segmentControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            segmentControl.heightAnchor.constraint(equalToConstant: 30),
            segmentControl.leftAnchor.constraint(equalTo: view.leftAnchor),
            segmentControl.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    fileprivate func setUpCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.register(SectionCells.self, forCellWithReuseIdentifier: cellID)
        collectionView.anchor(top: segmentControl.bottomAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor)
    }
    
}

extension ViewController : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionViews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SectionCells
        cell.addedChildView(view: sectionViews[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: collectionView.frame.height)
    }
    
}

extension ViewController : SegementControlDelegate {
    
    func indexDidChanged(index: Int) {
        let indexPath = IndexPath(item: index, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
}

