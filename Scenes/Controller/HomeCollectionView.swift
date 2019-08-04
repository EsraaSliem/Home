//
//  CollectionView.swift
//  iOS Task
//
//  Created by esraa on 8/3/19.
//  Copyright © 2019 esraa. All rights reserved.
//

import Foundation
import UIKit
extension HomeVC : UICollectionViewDelegate,UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case hotspotCollectionView:
            displayedList = hotspotList
        case eventsCollectionView :
            displayedList = eventsList
        case atrractionCollectionView:
            displayedList = attractiontList
        default:
            displayedList = []
        }
        return displayedList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! HomeVC_CollectionCell
        cell.nameLabel.text = displayedList[indexPath.row].name
        let imageUrl :String = displayedList[indexPath.row].photos![0]
        cell.imageViewCollectionCell.sd_setImage(with: URL(string: imageUrl) , completed: nil)
        cell.CategoreyLabel.text = displayedList[indexPath.row].category
        return cell
    }
    func setUpCollectionView(){
        hotspotCollectionView.delegate = self
        hotspotCollectionView.dataSource = self
        eventsCollectionView.delegate = self
        eventsCollectionView.dataSource = self
        atrractionCollectionView.delegate = self
        atrractionCollectionView.dataSource = self
    }
}
