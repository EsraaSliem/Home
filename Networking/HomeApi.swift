//
//  Routing.swift
//  iOS Task
//
//  Created by esraa on 8/3/19.
//  Copyright © 2019 esraa. All rights reserved.
//

import Foundation
enum HomeRouting : String{
    case Events , Hotspots , Attractions = "http://tourista.167.99.5.134.xip.io/api/home"
}

enum JsonType :String
{
    case attractions = "attractions"
    case events = "events"
    case hotspots = "hot_spots"
}
