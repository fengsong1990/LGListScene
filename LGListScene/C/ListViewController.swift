//
//  ListViewController.swift
//  LGListScene
//
//  Created by Apple on 2017/11/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit
import IGListKit
class ListViewController: UIViewController {

    let loader = JournalEntryLoader()
    let wxScanner = WxScanner()
    let pathfinder = Pathfinder()
    lazy var adapter : ListAdapter = {
        return ListAdapter.init(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loader.loadLatest()
        
        
        view.backgroundColor = UIColor.white
        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        adapter.dataSource = self
        pathfinder.delegate = self
        pathfinder.connecton()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
// MARK: - ListAdapterDataSource
extension ListViewController : ListAdapterDataSource{
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        
        if object is Weather {
            return WeatherSectionController()
        }else if object is Message{
            return ImageSectionController()
        }
        return JournalSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        var items: [ListDiffable] = [wxScanner.currentWeather]
        items += loader.entries as [ListDiffable]
        items += pathfinder.messages as [ListDiffable]
        
        items = items.sorted { (left, right) -> Bool in
            if let left = left as? DateSortable,let right = right as? DateSortable{
                return left.date > right.date
            }
            return false
        }
        
        return items
        
    }
}
extension ListViewController : PathfinderDelegate{
    
    func pathfinderDidUpdateMessage(pathfinder: Pathfinder) {
        
        adapter.performUpdates(animated: true, completion: nil)
    }
}
