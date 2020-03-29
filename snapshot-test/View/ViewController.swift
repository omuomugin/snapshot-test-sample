//
//  ViewController.swift
//  snapshot-test
//
//  Created by Shunsuke Saaki on 2020/03/28.
//  Copyright © 2020 omuomugin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height ), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white

        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.register(UINib(nibName:"SimpleCell", bundle: nil), forCellWithReuseIdentifier:"SimpleCell")
        
        self.view.addSubview(collectionView)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10;
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SimpleCell", for: indexPath) as! SimpleCell
        cell.setupCell(title: "hogehoge", description: "hogehoge")
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width, height: SimpleCell.cellHeight())

    }
}

