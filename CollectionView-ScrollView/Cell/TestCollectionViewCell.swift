//
//  TestCollectionViewCell.swift
//  CollectionView-ScrollView
//
//  Created by dcl on 2021/10/10.
//

import UIKit
import Foundation


class TestCollectionViewCell: UICollectionViewCell {
    var sliderItems: [String]?
    var selectedIndex = 0
    var oldSelectedIndex = 0
    var buttons: [UIButton] = []
    
    var changeCardView: ((_ index: Int)->())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = .red
        
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupUI() {
        addSubview(sliderBar)
        addSubview(cardView)
        cardView.addSubview(taskCardView)
        cardView.addSubview(btn)
    }
    
    static var noramlAttributes: [NSAttributedString.Key : Any] = [
        .font: UIFont.systemFont(ofSize: 14),
        .foregroundColor: UIColor.black
    ]
    
    static var selectAttributes: [NSAttributedString.Key : Any] = [
        .font: UIFont.systemFont(ofSize: 14),
        .foregroundColor: UIColor.red
    ]
    
    @objc func onclick(sender: UIButton) {
        let index = sender.tag - 100
        if changeCardView != nil {
            changeCardView!(index)
        }
        
        
//        buttons[selectedIndex].isSelected = true
//        buttons[oldSelectedIndex].isSelected = false
       
        
    }
    
    func addSliderButton(items: [String], selected: Int = 0) {
        self.sliderItems = items
        var contentWidth = 20
        
        for index in 0..<items.count {
            let label = UIButton()
            let item = items[index]
            label.setTitle(item, for: .normal)
            label.setTitleColor(.black, for: .normal)
            label.tag = index + 100
            label.layer.masksToBounds = true
            label.layer.cornerRadius = 18
            label.sizeToFit()
            
            label.frame = CGRect(x: contentWidth, y: 8, width: Int(label.frame.size.width) + 50, height: 36)
            label.addTarget(self, action: #selector(onclick(sender: )), for: .touchUpInside)
            buttons.append(label)
            self.sliderBar.addSubview(label)
            contentWidth = contentWidth + Int(label.frame.size.width) + 10
        }
        buttons[selected].setTitleColor(.red, for: .normal)
        self.sliderBar.contentSize = CGSize(width: contentWidth, height: 36)
    }
    
    func hideButton(index: Int) {
        
        self.cardView.frame.size.height = 98
        self.cardView.layoutIfNeeded()
        self.layoutIfNeeded()
        
        
        oldSelectedIndex = selectedIndex
        selectedIndex = index
        buttons[selectedIndex].setTitleColor(.red, for: .normal)
        buttons[oldSelectedIndex].setTitleColor(.black, for: .normal)
    }
    
    func addTaskDetails(items: [String]) {
        if taskCardView.subviews.count > 0 {
            for v in taskCardView.subviews {
                v.removeFromSuperview()
            }
        }
        
        var contentWidth = 10
        for index in 0..<items.count {
            let label = UILabel()
            let item = items[index]
            label.text = item
            
            label.font = UIFont.systemFont(ofSize: 17)
            label.textColor = .red
            label.sizeToFit()
            
            label.frame = CGRect(x: contentWidth, y:8 , width: Int(label.frame.size.width) + 50, height: 36)
            
            self.taskCardView.addSubview(label)
            contentWidth = contentWidth + Int(label.frame.size.width) + 10
        }
        
        self.taskCardView.contentSize = CGSize(width: contentWidth, height: 36)
    }
    
    lazy var sliderBar: UIScrollView = {
        let view = UIScrollView()
        view.frame = CGRect(x: 0, y: 0, width: self.contentView.frame.size
                                .width, height: 52)
        view.backgroundColor = .blue
        return view
    }()
    
    
    lazy var cardView: UIView = {
        let view = UIView(frame: CGRect(x: 10, y: 64, width: 315, height: 162))
        view.backgroundColor = .white
        return view
    }()
    
    
    lazy var taskCardView: UIScrollView = {
        let view = UIScrollView()
        view.frame = CGRect(x: 0, y: 20, width: self.cardView.frame.size.width, height: 70)
        view.backgroundColor = .gray
        return view
    }()
    
    lazy var btn: UIButton = {
        let btn = UIButton(frame: CGRect(x: 20, y: 106, width: self.cardView.frame.size.width - 40, height: 48))
        btn.backgroundColor = .black
        return btn
    }()
}
