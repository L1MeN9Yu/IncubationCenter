//
// Created by Mengyu Li on 2022/6/30.
//

enum DiskUsageError: Error {
    case statfs(code: Int)
}
