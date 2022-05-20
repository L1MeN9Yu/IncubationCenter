//
// Created by Mengyu Li on 2022/3/8.
//

import UIKit

open class CollectionView: UICollectionView {}

public extension CollectionView {
    func register<CellClass: CollectionViewCell>(_ cellClass: CellClass.Type) {
        register(cellClass, forCellWithReuseIdentifier: cellClass.cellID)
    }

    func dequeueReusableCell<CellClass: CollectionViewCell>(for indexPath: IndexPath) -> CellClass {
        guard let cell = dequeueReusableCell(withReuseIdentifier: CellClass.cellID, for: indexPath) as? CellClass else { fatalError("\(CellClass.cellID) dequeue for \(indexPath) error") }
        return cell
    }
}
