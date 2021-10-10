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
        let button = sender as! UIButton
        button.isSelected = true
    }
    
    func addSliderButton(items: [String]) {
        self.sliderItems = items
        var contentWidth = 20
        
        for index in 0..<items.count {
            let label = UIButton()
            let item = items[index]
            label.setAttributedTitle(NSAttributedString(string: item, attributes: TestCollectionViewCell.noramlAttributes ), for: .normal)
            label.setAttributedTitle(NSAttributedString(string: item, attributes: TestCollectionViewCell.selectAttributes), for: .selected)
            label.tag = index + 100
            label.layer.masksToBounds = true
            label.layer.cornerRadius = 18
            label.sizeToFit()
            
            label.frame = CGRect(x: contentWidth, y: 8, width: Int(label.frame.size.width) + 50, height: 36)
            label.isSelected = false
            label.addTarget(self, action: #selector(onclick(sender: )), for: .touchUpInside)
            self.sliderBar.addSubview(label)
            
            contentWidth = contentWidth + Int(label.frame.size.width) + 10
        }
        
        self.sliderBar.contentSize = CGSize(width: contentWidth, height: 36)
    }
    
    func addTaskDetails(items: [String]) {
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
