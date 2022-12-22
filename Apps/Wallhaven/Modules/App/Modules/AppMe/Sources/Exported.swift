//
// Created by Mengyu Li on 2022/5/20.
//

import UIBase
import UIRoute

public let meNavigationControllerType: NavigationController.Type = MeNavigationViewController.self

public let routableViewControllers: [Routable.Type] = [
    APIKeyViewController.self,
    DiskUsageViewController.self,
]

public let actions: [Actable.Type] = []
