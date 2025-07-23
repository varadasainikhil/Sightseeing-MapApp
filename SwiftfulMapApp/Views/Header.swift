//
//  Header.swift
//  SwiftfulMapApp
//
//  Created by Sai Nikhil Varada on 7/23/25.
//

import SwiftUI

struct Header: View {
    @Environment(LocationsViewViewModel.self) var viewModel
    var body: some View {
        VStack{
            HStack{
                Text(viewModel.mapLocation.name + ", " + viewModel.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                
                Button {
                    // Trigger drop down menu
                    withAnimation {
                        viewModel.showLocations.toggle()
                    }
                    
                } label: {
                    Image(systemName: viewModel.showLocations ? "arrow.up" : "arrow.down")
                        .fontWeight(.black)
                        .foregroundStyle(.black)
                }
                

            }
            .padding(.horizontal)
            if viewModel.showLocations{
                LocationsListView()
                    .padding(.horizontal)
            }
            
        }
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 20)
        .padding()
    }
}

#Preview {
    Header()
        .environment(LocationsViewViewModel())
}
