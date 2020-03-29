//
//  ViewTest.swift
//  snapshot-testTests
//
//  Created by Shunsuke Saaki on 2020/03/28.
//  Copyright © 2020 omuomugin. All rights reserved.
//

import Foundation
@testable import snapshot_test
import FBSnapshotTestCase

class ViewControllerTests: SnapshotTestCase {

    func testDashboardSnapshot() {
        let vc = ViewController()
        FBSnapshotVerifyView(vc.view)
    }
}
