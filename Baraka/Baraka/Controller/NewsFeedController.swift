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
        case popularNewsFeed = "Popular News Feed"
        case remindedNewsFeed = "reminded News Feed"
    }
    private var newsFeedDataSource: UICollectionViewDiffableDataSource<Section, SectionData>! = nil
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
        let collectionView = UICollectionView(frame: view.bounds,
                                              collectionViewLayout: generateLayout())
        collectionView.contentInset = UIEdgeInsets(top: 16,
                                                   left: 16,
                                                   bottom: 16,
                                                   right: 16)
        view.addSubview(collectionView)
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = true
        collectionView.registerNib(className: StockTickerCell.self)
        collectionView.registerNib(className: SmallNewsFeedCell.self)
        collectionView.registerNib(className: LargeNewsFeedCell.self)
        // collectionView.registerNib(className: HeaderView.self)
        collectionView.register(HeaderView.self,
                                forSupplementaryViewOfKind: Constants.sectionHeaderElementKind,
                                withReuseIdentifier: Constants.HeaderViewReuseIdentifier)
        // collectionView.isScrollEnabled = true
//        collectionView.showsHorizontalScrollIndicator = true
        newsFeedCollectionView = collectionView
    }
    
    func configureDataSource() {
        // Stock Tickers DataSource
        newsFeedDataSource = UICollectionViewDiffableDataSource<Section, SectionData>(collectionView: newsFeedCollectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, sectionData: SectionData) -> UICollectionViewCell? in
            switch indexPath.section {
            case 0:
                guard let cell = collectionView.dequeueCell(StockTickerCell.self, indexPath) else {
                    fatalError("Could not create new cell")
                }
                cell.stockTicker = sectionData.stockTicker
                return cell
            case 1:
                guard let cell = collectionView.dequeueCell(SmallNewsFeedCell.self, indexPath) else {
                    fatalError("Could not create new cell")
                }
                cell.article = sectionData.secondSectionArticle
                return cell
            case 2:
                guard let cell = collectionView.dequeueCell(LargeNewsFeedCell.self, indexPath) else {
                    fatalError("Could not create new cell")
                }
                cell.article = sectionData.thirdSectionArticle
                return cell
            default: return nil
            }
            
        }
        newsFeedDataSource.supplementaryViewProvider = { (
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
        }
        newsFeedDataSource.apply(snapshotForCurrentNewsFeedState(), animatingDifferences: false)
    }
    
    fileprivate func generateLayout() -> UICollectionViewLayout {
        
        let sectionProvider = { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            switch sectionIndex {
            case 0:
                // Stock Ticker Item & Group
                let stockTickerItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                 heightDimension: .absolute(Constants.StockTickersGroupHeight))
                let stockTickerItem = NSCollectionLayoutItem(layoutSize: stockTickerItemSize)
                let stockTickersGroupSize = NSCollectionLayoutSize(widthDimension: .estimated(Constants.StockTickersGroupWidth),
                                                                   heightDimension: .absolute(Constants.StockTickersGroupHeight))
                let stockTickersGroup = NSCollectionLayoutGroup.horizontal(layoutSize: stockTickersGroupSize,
                                                                           subitems: [stockTickerItem])
//                let headerSize = NSCollectionLayoutSize(widthDimension: .absolute(0),
//                                                        heightDimension: .absolute(44))
//                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
//                                                                                elementKind: Constants.sectionHeaderElementKind,
//                                                                                alignment: .topLeading)
//                sectionHeader.pinToVisibleBounds = true
//                let section = NSCollectionLayoutSection(group: popularNewsFeedGroup)
//                section.boundarySupplementaryItems = [sectionHeader]
//                return section
                let section = NSCollectionLayoutSection(group: stockTickersGroup)
                section.interGroupSpacing = 10
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
                section.orthogonalScrollingBehavior = .continuous
                return section
            case 1:
                // Popular News Feed Item & Group
                let popularNewsFeedItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),                                                                                           heightDimension: .fractionalHeight(1.0))
                let popularNewsFeedItem = NSCollectionLayoutItem(layoutSize: popularNewsFeedItemSize)
                popularNewsFeedItem.contentInsets = NSDirectionalEdgeInsets(top: Constants.PopularNewsFeedGroupSpace,
                                                                            leading: Constants.PopularNewsFeedGroupSpace,
                                                                            bottom: Constants.PopularNewsFeedGroupSpace,
                                                                            trailing: Constants.PopularNewsFeedGroupSpace)
                let popularNewsFeedGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),                                                                                           heightDimension: .absolute(Constants.PopularNewsFeedGroupHeight))
                let popularNewsFeedGroup = NSCollectionLayoutGroup.horizontal(layoutSize: popularNewsFeedGroupSize,
                                                                              subitems: [popularNewsFeedItem])
                let section = NSCollectionLayoutSection(group: popularNewsFeedGroup)
                section.interGroupSpacing = 10
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
                section.orthogonalScrollingBehavior = .continuous
                return section
            case 2:
                // All News Feed Item & Group
                let newsFeedItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),                                                                                           heightDimension: .fractionalHeight(1.0))
                let newsFeedItem = NSCollectionLayoutItem(layoutSize: newsFeedItemSize)
                newsFeedItem.contentInsets = NSDirectionalEdgeInsets(top: Constants.PopularNewsFeedGroupSpace,
                                                                            leading: Constants.PopularNewsFeedGroupSpace,
                                                                            bottom: Constants.PopularNewsFeedGroupSpace,
                                                                            trailing: Constants.PopularNewsFeedGroupSpace)
                let newsFeedGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),                                                                                           heightDimension: .absolute(Constants.NewsFeedGroupHeight))
                let newsFeedGroup = NSCollectionLayoutGroup.vertical(layoutSize: newsFeedGroupSize,
                                                                              subitems: [newsFeedItem])
                let section = NSCollectionLayoutSection(group: newsFeedGroup)
                //section.interGroupSpacing = 10
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
                //section.orthogonalScrollingBehavior = .continuous
                return section
            default: return nil
            }
        }
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        let layout = UICollectionViewCompositionalLayout(sectionProvider: sectionProvider)
        layout.configuration = configuration
        return layout
    }
    
    func snapshotForCurrentNewsFeedState() -> NSDiffableDataSourceSnapshot<Section, SectionData> {
        var snapshot = NSDiffableDataSourceSnapshot<Section, SectionData>()
        snapshot.appendSections([Section.stockTickers, Section.popularNewsFeed, Section.remindedNewsFeed])
        snapshot.appendItems(viewModel.stockTickers, toSection: .stockTickers)
        snapshot.appendItems(viewModel.popularNewsFeed, toSection: .popularNewsFeed)
        snapshot.appendItems(viewModel.remindedNewsFeed, toSection: .remindedNewsFeed)
        return snapshot
    }
}
