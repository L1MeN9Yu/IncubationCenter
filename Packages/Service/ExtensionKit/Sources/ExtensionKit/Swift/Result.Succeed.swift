//
// Created by Mengyu Li on 2021/2/10.
//

public extension Result where Success == Void {
    static var success: Self { .success(()) }
}
