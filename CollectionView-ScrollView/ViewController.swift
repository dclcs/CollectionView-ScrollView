//
//  ViewController.swift
//  CollectionView-ScrollView
//
//  Created by dcl on 2021/10/10.
//

import UIKit

class ViewController: UIViewController {
    var isExpanded = true
    var isSelectedIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(collectionView)
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        view.backgroundColor = .yellow
        view.register(TestCollectionViewCell.self, forCellWithReuseIdentifier: "TestCollectionViewCell")
        view.delegate = self
        view.dataSource = self
        return view
    }()
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if isExpanded {
            return CGSize(width: 335, height: 238)
        }
        return CGSize(width: 335, height: 174)

    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 20, bottom: 18, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TestCollectionViewCell", for: indexPath) as! TestCollectionViewCell
        
        let data =  getTestData()
       
        cell.addSliderButton(items: data.map({ model in
            return model.category!
        }), selected: isSelectedIndex)
        let selectedData = data[isSelectedIndex].tasks!
        print(selectedData)
        cell.addTaskDetails(items: selectedData.map({ task in
            return task.name!
        }))
        cell.btn.isHidden = data[isSelectedIndex].isAllComplete!
        if data[isSelectedIndex].isAllComplete! {
            cell.hideButton(index: isSelectedIndex)
        }
        
       
        cell.changeCardView = {[weak self] index in
            guard let self = self else { return }
            self.isExpanded = !(data[index].isAllComplete!)
            self.isSelectedIndex = index
            collectionView.reloadItems(at: [indexPath])

//            collectionView.reloadData()
            
//
//            let selected = data[index].tasks!
//
//            cell.btn.isHidden = data[index].isAllComplete!
//            if data[index].isAllComplete! {
//                cell.hideButton()
//            }
//            cell.layoutIfNeeded()
//            cell.addTaskDetails(items: selected.map({ model in
//                return model.name!
//            }))
            
        }
        return cell
    }
    
    
}

