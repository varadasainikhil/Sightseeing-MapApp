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
    
    // For Map selection binding only
    var selectedLocation : Location? {
        didSet {
            if let selectedLocation = selectedLocation, selectedLocation.id != mapLocation.id {
                mapLocation = selectedLocation
            }
        }
    }
    
    // Show list of locations
    var showLocations = false
    
    // Current Map Region
    var mapPosition : MapCameraPosition
    
    // static map span
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        
        guard let firstLocation = locations.first else {
            fatalError("No locations available in LocationsDataService")
        }
        
        self.mapLocation = firstLocation
        self.mapPosition = MapCameraPosition.region(MKCoordinateRegion(center: firstLocation.coordinates, span: mapSpan))
        self.selectedLocation = firstLocation
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
            withAnimation {
                mapLocation = locations[0]
            }
        }
        else{
            withAnimation {
                mapLocation = locations[index + 1]
            }
        }
    }
}
