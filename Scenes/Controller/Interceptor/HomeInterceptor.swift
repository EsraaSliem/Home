//
//  EventInterceptor.swift
//  iOS Task
//
//  Created by esraa on 8/2/19.
//  Copyright © 2019 esraa. All rights reserved.
//

import Foundation
import Alamofire

class HomeInteractor {
    
    func placeList(jsonType: String,completionHandler: @escaping (Array<Place>?)->Void) {
        var placeList : Array<Place>?
        Alamofire.request(HomeRouting.HomeURl.rawValue).responseJSON  {
            response in
            switch response.result {
            case .success:
                print("sucess")
                let sucessDataValue = response.result.value
                let returnedData = sucessDataValue as! Dictionary<String, Any>
                print("enter")
                
                let code =  returnedData["status_code"]  as! Int
                
                if(code == 200)
                {
                    let data =  returnedData["data"] as! Dictionary<String, Any>
                    print("ccccccc")
                    let returnedEvents = data[jsonType] as! [Dictionary<String, Any>]
                    
                    placeList = []
                    for i in returnedEvents
                    {
                        var place = Place()
                        place.id = (i["id"] as?  Int)!
                        place.name = (i["name"] as?  String)!
                        print(place.name)
                        place.description = (i["description"] as?  String)!
                        print(place.description! )
                        place.photos = (i["photos"] as? [String]!)!
                        print(place.photos)
                        let categorey = i["categories"] as! [Dictionary<String, Any>]
                        place.category = categorey[0]["name"] as? String
                        print(place.category)
                        placeList?.append(place)
                    }
                    
                }
                
                completionHandler(placeList)
                break
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
