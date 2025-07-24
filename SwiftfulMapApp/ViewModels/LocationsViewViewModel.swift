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
        locations.filter({$0.id != mapLocation!.id})
    }
    
    // Current Selected Location
    var mapLocation : Location? {
        didSet{
                updateMapPosition(location: mapLocation ?? Location(
                    name: "Colosseum",
                    cityName: "Rome",
                    coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922),
                    description: "The Colosseum is an oval amphitheatre in the centre of the city of Rome, Italy, just east of the Roman Forum. It is the largest ancient amphitheatre ever built, and is still the largest standing amphitheatre in the world today, despite its age.",
                    imageNames: [
                        "rome-colosseum-1",
                        "rome-colosseum-2",
                        "rome-colosseum-3",
                    ],
                    link: "https://en.wikipedia.org/wiki/Colosseum"))
        }
    }
    
    // Show list of locations
    var showLocations = false
    
    // Current Map Region
    var mapPosition : MapCameraPosition
    
    // static map span
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    // showing the sheet for Detail View
    var showingSheet = false
    
    // Private flag to prevent circular updates
    private var isUpdatingProgrammatically = false
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        
        guard let firstLocation = locations.first else {
            fatalError("No locations available in LocationsDataService")
        }
        
        self.mapLocation = firstLocation
        self.mapPosition = MapCameraPosition.region(MKCoordinateRegion(center: firstLocation.coordinates, span: mapSpan))
    }
    
    private func updateMapPosition(location : Location){
        withAnimation {
            mapPosition = MapCameraPosition.region(MKCoordinateRegion(center: location.coordinates, span: mapSpan))
        }
    }
    
    func goToNextLocation(){
        guard let index = locations.firstIndex(where: {$0.id == mapLocation!.id}) else {
            print("Index not found.")
            return
        }
        let nextLocation: Location
        if index == locations.count-1{
            nextLocation = locations[0]
        } else {
            nextLocation = locations[index + 1]
        }
        
        withAnimation {
            mapLocation = nextLocation
        }
    }
}
