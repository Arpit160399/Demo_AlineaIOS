//
//  SegementControll.swift
//  AlineaIOS
//
//  Created by Arpit Singh on 27/10/20.
//

import UIKit


protocol SegementControlDelegate {
    func indexDidChanged(index: Int)
}


class SegementControl: UIView {
    
    private var views = [UIView]()
    private var numberOFSection = 0
    private var selectedView : UIView!
    
    var textColor : UIColor = .black
    var selectedTextColor: UIColor = Themeing.shared.accent
    var selectedColor: UIColor = .systemBlue
    var separatorColor: UIColor = .gray
    var fontText : UIFont = .systemFont(ofSize: 12, weight: .semibold)
    var delegate : SegementControlDelegate?
    
     init(title : [String]) {
      super.init(frame: .zero)
      setTitle(titles: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setUpStackView()
        configureSelectorView()
    }
    
}

extension SegementControl {
    
    private func setUpStackView(){

        let stack = UIStackView(arrangedSubviews: views)
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.anchor(top: topAnchor,
                     bottom: bottomAnchor,
                     left: leftAnchor,
                     right: rightAnchor)
        views.enumerated().forEach { (index,button) in
            if index != 0 {
                let view = UIView()
                view.backgroundColor = separatorColor
                addSubview(view)
                view.translatesAutoresizingMaskIntoConstraints = false
                view.widthAnchor.constraint(equalToConstant: 0.5).isActive = true
                view.heightAnchor.constraint(equalToConstant: 12).isActive = true
                view.rightAnchor.constraint(equalTo: button.leftAnchor,constant:  -1 * button.frame.width).isActive = true
                view.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            }
        }
        
    }
    
private func setTitle(titles: [String]) {
         views = [UIView]()
         views.removeAll()
         numberOFSection = titles.count
        subviews.forEach { $0.removeFromSuperview()}
        for (index , title) in titles.enumerated() {
            let button = UIButton()
            button.setTitle(title, for: .normal)
            button.titleLabel?.font = fontText
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            button.setTitleColor(textColor, for: .normal)
            if index == 0 {
               button.setTitleColor(selectedTextColor, for: .normal)
            }
            views.append(button)
        }
    
    }
    
    private func configureSelectorView(){
        let selectorWidth = (frame.width / CGFloat(numberOFSection) - 40)
        selectedView = UIView(frame: .init(x: 20, y: frame.height - 3, width: selectorWidth, height: 3))
        selectedView.backgroundColor = selectedColor
        addSubview(selectedView)
    }
    
}

extension SegementControl {
    
    @objc func buttonAction(sender: UIButton){
        
        for (index , view) in views.enumerated() {
            if let button = view as? UIButton {
                if sender == button {
                    let selectorPoition = ((frame.width / CGFloat(numberOFSection)) * CGFloat(index)) + 20
                    UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseInOut,animations: {
                        self.selectedView.frame.origin.x = selectorPoition
                    }, completion: nil)
                    delegate?.indexDidChanged(index: index)
                    sender.setTitleColor(selectedTextColor, for: .normal)
                } else {
                    button.setTitleColor(textColor, for: .normal)
                }
            }
        }
    }
}
