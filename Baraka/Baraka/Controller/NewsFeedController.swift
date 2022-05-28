//
//  NewsFeedController.swift
//  Baraka
//
//  Created by Ahmed Abduljawad on 27/05/2022.
//

import UIKit

class NewsFeedController: UIViewController {
    
    enum Section: String, CaseIterable {
        case stockTickers = "Stock Tickers"
        case popular = "Popular News"
        case newsFeed = "News Feed"
    }
    private var dataSource: UICollectionViewDiffableDataSource<Section, StockTicker>! = nil
    private var newsFeedCollectionView: UICollectionView! = nil
    private var viewModel = NewsFeedViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "News Feed"
        preSettings()
    }
    
    func preSettings() {
        configureCollectionView()
        configureDataSource()
    }
}

extension NewsFeedController {
    
    fileprivate func configureCollectionView() {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: generateLayout())
        collectionView.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 0)
        view.addSubview(collectionView)
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.backgroundColor = .systemBackground
        collectionView.registerNib(className: StockTickerCell.self)
        /*
        // collectionView.registerNib(className: HeaderView.self)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: Constants.sectionHeaderElementKind, withReuseIdentifier: Constants.HeaderViewReuseIdentifier)
         */
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = true
        newsFeedCollectionView = collectionView
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource
        <Section, StockTicker>(collectionView: newsFeedCollectionView) {
            [weak self] (collectionView: UICollectionView, indexPath: IndexPath, albumItem: StockTicker) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueCell(StockTickerCell.self, indexPath) else {
                fatalError("Could not create new cell")
            }
            cell.stockTicker = self?.viewModel.stockTickers[indexPath.item]
            return cell
        }
        /*dataSource.supplementaryViewProvider = { (
            collectionView: UICollectionView,
            kind: String,
            indexPath: IndexPath)
            -> UICollectionReusableView? in
            
            guard let supplementaryView = collectionView.dequeueReusableSupplementaryView(
              ofKind: kind,
              withReuseIdentifier: Constants.HeaderViewReuseIdentifier,
              for: indexPath) as? HeaderView else {
                fatalError("Cannot create header view")
            }
            
//            guard let supplementaryView = collectionView.dequeueCell(HeaderView.self, indexPath) else {
//                fatalError("Cannot create header view")
//            }
            supplementaryView.label.text = Section.allCases[indexPath.section].rawValue
            return supplementaryView
        }*/
        let snapshot = snapshotForCurrentState()
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    fileprivate func generateLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(20.5))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let stockTickersGroupSize = NSCollectionLayoutSize(widthDimension: .estimated(145.0), heightDimension: .absolute(20.5))
            let stockTickersGroup = NSCollectionLayoutGroup.horizontal(layoutSize: stockTickersGroupSize, subitems: [item])
            /*let headerSize = NSCollectionLayoutSize(widthDimension: .estimated(145.0), heightDimension: .estimated(44))
            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
              layoutSize: headerSize,
              elementKind: Constants.sectionHeaderElementKind,
              alignment: .top)*/
            
//            let nestedGroup = NSCollectionLayoutGroup.vertical(
//              layoutSize: NSCollectionLayoutSize(
//                widthDimension: .fractionalWidth(1.0),
//                heightDimension: .fractionalWidth(16/9)),
//              subitems: [
//                stockTickersGroup,
//                mainWithPairGroup,
//                tripletGroup,
//                mainWithPairReversedGroup
//              ]
//            )
            
            let section = NSCollectionLayoutSection(group: stockTickersGroup)
            //section.boundarySupplementaryItems = [sectionHeader]
            return section
        }
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.scrollDirection = .horizontal
        layout.configuration = configuration
        return layout
    }
    
    func snapshotForCurrentState() -> NSDiffableDataSourceSnapshot<Section, StockTicker> {
        //        let sharingSuggestions = Array(albumsInBaseDirectory().prefix(3))
        //        let sharedAlbums = Array(albumsInBaseDirectory().suffix(3))
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, StockTicker>()
        snapshot.appendSections([Section.stockTickers])
        snapshot.appendItems(viewModel.stockTickers)
        
        //        snapshot.appendSections([Section.sharedAlbums])
        //        snapshot.appendItems(sharedAlbums)
        //
        //        snapshot.appendSections([Section.myAlbums])
        //        snapshot.appendItems(allAlbums)
        return snapshot
    }
}
