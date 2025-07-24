//
//  CardView.swift
//  SwiftfulMapApp
//
//  Created by Sai Nikhil Varada on 7/23/25.
//

import SwiftUI

struct CardView: View {
    @Environment(LocationsViewViewModel.self) var viewModel
    var body: some View {
        ZStack{
            HStack{
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 175)
            .shadow(radius: 20)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
            HStack{
                VStack(alignment: .leading, spacing: 0){
                    ZStack{
                        RoundedRectangle(cornerRadius: 13)
                            .foregroundStyle(.white)
                            .frame(width: 110, height: 110)
                        
                        
                        Image(viewModel.mapLocation!.imageNames.first!)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .shadow(radius: 10)
                    .padding(.bottom)
                    
                    Text(viewModel.mapLocation!.name)
                        .font(.headline.bold())
                        .frame(minHeight: 40)
                    
                }
                .padding(.horizontal)
                .offset(y:-30)
                
                Spacer()
                
                VStack{
                    Button {
                        // Action to open sheet
                        viewModel.showingSheet.toggle()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundStyle(.accent)
                                .frame(width: 150,height: 50)
                            
                            Text("Learn More")
                                .foregroundStyle(.white)
                                .font(.title3.bold())
                        }
                        
                    }
                    
                    Button {
                        // Action to go to next
                        viewModel.goToNextLocation()
                        
                        
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundStyle(.gray)
                                .frame(width: 150,height: 50)
                            
                            Text("Next")
                                .foregroundStyle(.accent)
                                .font(.title3.bold())
                        }
                    }
                    
                }
                .padding(.horizontal)
                
            }
            .padding()
            
        }
    }
}

#Preview {
    CardView()
        .environment(LocationsViewViewModel())
}
