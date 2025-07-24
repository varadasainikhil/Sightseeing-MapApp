//
//  DetailView.swift
//  SwiftfulMapApp
//
//  Created by Sai Nikhil Varada on 7/23/25.
//

import SwiftUI
import MapKit

struct DetailView: View {
    @Environment(LocationsViewViewModel.self) var viewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            ZStack{
                ScrollView(.horizontal) {
                    HStack{
                        ForEach(viewModel.mapLocation!.imageNames, id: \.self){imageName in
                                Image(imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                                .frame(height: 300)
                        }
                    }
                }
                
                VStack{
                    HStack{
                        Button {
                            //Close the sheet
                            dismiss()
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundStyle(.accent)
                                .font(.title)
                        }
                        Spacer()
                    }
                    .padding()
                    
                    Spacer()
                }
                
            }
            
            
            Text(viewModel.mapLocation!.name + ", " + viewModel.mapLocation!.cityName)
                .font(.title.bold())
                
            
            Text(viewModel.mapLocation!.description)
                .padding()
            
            VStack(alignment: .leading){
                Button("Learn more about \(viewModel.mapLocation!.name) here") {
                    // Open link to wikipedia
                    if let url = URL(string: viewModel.mapLocation!.link){
                        UIApplication.shared.open(url)
                    }
                }
            }
            
            Spacer()
            
            Button{
                // Give directions to the location
                viewModel.openMapsWithDirections()
            }label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 12)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                    
                    Text("Get Directions on Apple Maps")
                        .foregroundStyle(.white)
                        .font(.title3.bold())
                    
                }
                .padding()
                
            }
            
            
            
        }
        .background(.thinMaterial)
    }
}

#Preview {
    DetailView()
        .environment(LocationsViewViewModel())
}
