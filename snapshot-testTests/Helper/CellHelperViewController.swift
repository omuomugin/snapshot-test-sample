//
//  CellHelperViewController.swift
//  snapshot-testTests
//
//  Created by Shunsuke Saaki on 2020/03/28.
//  Copyright © 2020 omuomugin. All rights reserved.
//

import UIKit

typealias SetupBlock = ((UICollectionViewCell) -> ())

class CellHelperViewController: UIViewController {
    
    var cellName: String
    var numberOfItems: Int
    var cellHeight: CGFloat
    var setupBlock: SetupBlock
    
    init(cellName: String, numberOfItems: Int, cellHeight: CGFloat, setupBlock: @escaping SetupBlock) {
        self.cellName = cellName
        self.numberOfItems = numberOfItems
        self.cellHeight = cellHeight
        self.setupBlock = setupBlock
        
        super.init(nibName: nil, bundle: nil)
    }
        

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height ), collectionViewLayout: layout)
        
        collectionView.backgroundColor = UIColor.white

        collectionView.register(UINib(nibName:self.cellName, bundle: nil), forCellWithReuseIdentifier:self.cellName)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        self.view.addSubview(collectionView)
    }
}

extension CellHelperViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.numberOfItems;
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellName, for: indexPath)
        self.setupBlock(cell)
        return cell
    }
}

extension CellHelperViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width, height: self.cellHeight)

    }
}
