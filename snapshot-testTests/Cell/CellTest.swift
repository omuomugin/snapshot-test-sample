//
//  CellTest.swift
//  snapshot-testTests
//
//  Created by Shunsuke Saaki on 2020/03/28.
//  Copyright © 2020 omuomugin. All rights reserved.
//

import Foundation
import UIKit
@testable import snapshot_test

class CellTest: SnapshotTestCase {

    func testCell() {
        let setupBlock: SetupBlock = { (cell: UICollectionViewCell) -> Void in
            (cell as! SimpleCell).setupCell(title: "長いタイトルです", description: "短めの説明です")
        }

        let vc = CellHelperViewController(cellName: "SimpleCell", numberOfItems: 3, cellHeight: SimpleCell.cellHeight(), setupBlock: setupBlock)
        FBSnapshotVerifyView(vc.view)
    }

    func testLongTitleCell() {
        let setupBlock: SetupBlock = { (cell: UICollectionViewCell) -> Void in
            (cell as! SimpleCell).setupCell(title: "長いタイトルです長いタイトルです長いタイトルです長いタイトルです長いタイトルです", description: "短めの説明です")
        }

        let vc = CellHelperViewController(cellName: "SimpleCell", numberOfItems: 3, cellHeight: SimpleCell.cellHeight(), setupBlock: setupBlock)
        FBSnapshotVerifyView(vc.view)
    }
    
    func testLongDescription() {
        let setupBlock: SetupBlock = { (cell: UICollectionViewCell) -> Void in
            (cell as! SimpleCell).setupCell(title: "長いタイトルです長いタイトルです長いタイトルです長いタイトルです長いタイトルです", description: "長い説明文長い説明文長い説明文長い説明文長い説明文長い説明文長い説明文長い説明文長い説明文")
        }

        let vc = CellHelperViewController(cellName: "SimpleCell", numberOfItems: 3, cellHeight: SimpleCell.cellHeight(), setupBlock: setupBlock)
        FBSnapshotVerifyView(vc.view)
    }
}
