//
//  location.swift
//  SwiftfulMapApp
//
//  Created by Sai Nikhil Varada on 7/22/25.
//

import Foundation
import MapKit

struct Location : Identifiable{
    var name : String
    var cityName : String
    var coordinates : CLLocationCoordinate2D
    var description : String
    var imageNames : [String]
    var link : String
    var id : String{
        name+cityName
    }
}
