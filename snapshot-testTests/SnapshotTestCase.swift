//
//  File.swift
//  snapshot-testTests
//
//  Created by Shunsuke Saaki on 2020/03/28.
//  Copyright © 2020 omuomugin. All rights reserved.
//

import FBSnapshotTestCase

class SnapshotTestCase: FBSnapshotTestCase {

    var window: UIWindow!

    override func setUp() {
        super.setUp()
        recordMode = true
        fileNameOptions = [.device, .OS, .screenSize, .screenScale]

        window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
    }
}
