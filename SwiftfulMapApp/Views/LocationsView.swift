//
//  LocationsView.swift
//  SwiftfulMapApp
//
//  Created by Sai Nikhil Varada on 7/23/25.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    @Environment(LocationsViewViewModel.self) var viewModel
    
    var body: some View {
        @Bindable var viewModel = viewModel
        ZStack{
            Map(position: $viewModel.mapPosition, selection: $viewModel.selectedLocation){
                ForEach(viewModel.locations){location in
                    Marker(location.name, coordinate: location.coordinates)
                        .tag(location)
                        
                }
            }
    
            
            VStack(spacing: 0){
                Header()
                Spacer()
                CardView()
                    .padding(.horizontal)
            }
            
            
        }
    }
}

#Preview {
    LocationsView()
        .environment(LocationsViewViewModel())
}

