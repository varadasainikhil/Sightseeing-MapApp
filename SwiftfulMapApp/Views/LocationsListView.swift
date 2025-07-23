//
//  LocationsListVIew.swift
//  SwiftfulMapApp
//
//  Created by Sai Nikhil Varada on 7/23/25.
//

import SwiftUI

struct LocationsListView: View {
    @Environment(LocationsViewViewModel.self) var viewModel
    var body: some View {
        VStack(spacing:0){
            ForEach(viewModel.allLocationsExpectSelected){location in
                HStack(spacing:0){
                    Image(location.imageNames.first!)
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .frame(width: 40, height: 40)
                        .padding(.trailing)
                    
                    VStack(alignment: .leading){
                        Text(location.name)
                            .font(.title2.bold())
                            .foregroundStyle(.primary)
                            
                        Text(location.cityName)
                            .font(.subheadline.bold())
                            .foregroundStyle(.primary)
                        
                    }
                    .frame(height: 55)
                    
                    Spacer()
                }
                .background(.thinMaterial)
                .frame(maxWidth: .infinity)
                .onTapGesture {
                    viewModel.mapLocation = location
                    withAnimation {
                        viewModel.showLocations.toggle()
                    }
                    
                }
            }
        }
        
    }
}

#Preview {
    LocationsListView()
        .environment(LocationsViewViewModel())
}
