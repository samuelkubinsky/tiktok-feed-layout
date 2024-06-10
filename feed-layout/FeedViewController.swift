//
//  FeedViewController.swift
//  feed-layout
//
//  Created by Samuel Kubinský on 10/06/2024.
//

import UIKit

final class FeedViewController: UICollectionViewController {
    
    lazy var dataSource = createDataSource()
    
    init() {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: size, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        // section.orthogonalScrollingProperties.bounce = .never
        let layout = UICollectionViewCompositionalLayout(section: section)
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        updateDataSource()
    }
    
    func setupCollectionView() {
        installsStandardGestureForInteractiveMovement = false
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.preservesSuperviewLayoutMargins = false
        collectionView.delaysContentTouches = false
        collectionView.isPagingEnabled = true
    }
    
    // UI glitch fix
    func scrollToItem(indexPath: IndexPath) {
        collectionView.isPagingEnabled = false
        collectionView.scrollToItem(at: indexPath, at: [], animated: true)
        collectionView.isPagingEnabled = true
    }

}
