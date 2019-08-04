//
//  ViewController.swift
//  iOS Task
//
//  Created by esraa on 8/2/19.
//  Copyright © 2019 esraa. All rights reserved.
//

import UIKit
import SDWebImage
class HomeVC: UIViewController {
    var hotspotList : Array<Place> = []
    var eventsList : Array<Place> = []
    var attractiontList : Array<Place> = []
    var displayedList: Array<Place> = []
    var interceptor = HomeInteractor()
    @IBOutlet weak var hotspotCollectionView: UICollectionView!
    @IBOutlet weak var atrractionCollectionView: UICollectionView!
    @IBOutlet weak var eventsCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        getHospotList()
        getEventsList()
        getattrActionsList()
    }
    
    func getHospotList(){
        interceptor.placeList(jsonType: JsonType.hotspots.rawValue){
            (hotspots) in
            if let hotspotss = hotspots
            {
                self.hotspotList.append(contentsOf: hotspotss)
                self.hotspotCollectionView.reloadData()
            }
        }
    }
    func getEventsList(){
        interceptor.placeList(jsonType: JsonType.events.rawValue){
            
            if let events = $0
            {
                self.eventsList.append(contentsOf: events)
                self.eventsCollectionView.reloadData()
            }
        }
    }
    func getattrActionsList(){
        interceptor.placeList(jsonType: JsonType.attractions.rawValue){
            if let attractions = $0
            {
                self.attractiontList.append(contentsOf: attractions)
                self.atrractionCollectionView.reloadData()
            }
        }
    }
}

