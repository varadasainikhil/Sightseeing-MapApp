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
    
    var allLocationsExpectSelected : [Location]{
        locations.filter({$0.id != mapLocation.id})
    }
    
    // Current Selected Location
    var mapLocation : Location {
        didSet{
            updateMapPosition(location: mapLocation)
            selectedLocation = mapLocation
        }
    }
    
    //
    var selectedLocation : Location?
    
    // Show list of locations
    var showLocations = false
    
    // Current Map Region
    var mapPosition : MapCameraPosition
    
    // static map span
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.mapPosition = MapCameraPosition.region(MKCoordinateRegion(center: locations.first!.coordinates, span: mapSpan))
        self.selectedLocation = locations.first!
    }
    
    private func updateMapPosition(location : Location){
        withAnimation {
            mapPosition = MapCameraPosition.region(MKCoordinateRegion(center: location.coordinates, span: mapSpan))
        }
    }
    
    func goToNextLocation(){
        guard let index = locations.firstIndex(where: {$0.id == mapLocation.id}) else {
            print("Index not found.")
            return
        }
        if index == locations.count-1{
            
            mapLocation = locations[0]
            
        }
        else{
            mapLocation = locations[index + 1]
            
        }
    }
}
