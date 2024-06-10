//
//  FeedViewController+DataSource.swift
//  feed-layout
//
//  Created by Samuel Kubinský on 10/06/2024.
//

import UIKit

extension FeedViewController {
    
    enum Section: Hashable {
        case post(Int)
    }
    
    enum Item: Hashable {
        case medium(UIColor)
    }
    
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    
    func updateDataSource() {
        var snapshot = Snapshot()
        snapshot.appendSections([.post(0), .post(1), .post(2)])
        snapshot.appendItems([.medium(.blue)], toSection: .post(0))
        snapshot.appendItems([.medium(.red), .medium(.yellow)], toSection: .post(1))
        snapshot.appendItems([.medium(.purple), .medium(.green), .medium(.brown)], toSection: .post(2))
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    func createDataSource() -> DataSource {
        let postCell = registerPostCell()
        return .init(collectionView: collectionView) { collectionView, indexPath, item in
            switch item {
                case .medium(let color):
                    return collectionView.dequeueConfiguredReusableCell(using: postCell, for: indexPath, item: color)
            }
        }
    }
    
    func registerPostCell() -> UICollectionView.CellRegistration<PostCell, UIColor> {
        .init { cell, indexPath, color in
            cell.label.text = "\(indexPath)"
            cell.backgroundColor = color
        }
    }
    
}
