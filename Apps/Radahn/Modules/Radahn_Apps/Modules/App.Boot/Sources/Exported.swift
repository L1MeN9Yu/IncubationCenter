//
// Created by Mengyu Li on 2022/6/29.
//

import UIBase
import UIRoute

public let bootViewControllerType: ViewController.Type = BootViewController.self
public let diagnoseViewControllerType: ViewController.Type = DiagnoseViewController.self

public let routableViewControllers: [Routable.Type] = []

public let actions: [Actable.Type] = []

public typealias BootComplete = (Swift.Result<Void, Error>) -> Void

public func register(bootComplete: Optional<BootComplete>) {
    Module.bootComplete = bootComplete
}
