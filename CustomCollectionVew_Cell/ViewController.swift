//
//  ViewController.swift
//  CustomCollectionVew_Cell
//
//  Created by Hwang on 2020/02/18.
//  Copyright © 2020 Hwang. All rights reserved.
//

import UIKit

struct CustomData {
    var title : String
    var image : UIImage
    var url : String
}

class ViewController: UIViewController {
    
    var useData : [CustomData] = [
        CustomData(title: "motorcycle", image: #imageLiteral(resourceName: "testImage2"), url: "rangyuGenius.com"),
        CustomData(title: "neonSign", image: #imageLiteral(resourceName: "testImage1"), url: "rangyuGenius.com"),
        CustomData(title: "viewOutside", image: #imageLiteral(resourceName: "testImage3"), url: "rangyuGenius.com"),
    ]
    
    fileprivate let collectionView : UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "Cell")
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionLayout() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 0.5),
        ])
    }
}


extension ViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width / 2, height: collectionView.frame.width / 2)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return useData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCell
        
        let row = useData[indexPath.row]
        
        cell.bg.image = row.image
        
        return cell
    }
}
