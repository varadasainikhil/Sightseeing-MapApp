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
        Map(position: $viewModel.mapPosition){
            
        }
    }
}

#Preview {
    LocationsView()
        .environment(LocationsViewViewModel())
}
