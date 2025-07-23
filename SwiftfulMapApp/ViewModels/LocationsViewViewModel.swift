//
//  LocationsViewViewModel.swift
//  SwiftfulMapApp
//
//  Created by Sai Nikhil Varada on 7/23/25.
//

import Foundation
import MapKit
import SwiftUI

@Observable
class LocationsViewViewModel{
    // All Loaded Locations
    var locations : [Location]
    
    // Current Selected Location
    var mapLocation : Location {
        didSet{
            updateMapPosition(location: mapLocation)
        }
    }

    // Current Map Region
    var mapPosition : MapCameraPosition

    // static map span
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.mapPosition = MapCameraPosition.region(MKCoordinateRegion(center: locations.first!.coordinates, span: mapSpan))
    }
    
    private func updateMapPosition(location : Location){
        withAnimation {
            mapPosition = MapCameraPosition.region(MKCoordinateRegion(center: location.coordinates, span: mapSpan))
        }
    }
}
