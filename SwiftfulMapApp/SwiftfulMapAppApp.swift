//
//  SwiftfulMapAppApp.swift
//  SwiftfulMapApp
//
//  Created by Sai Nikhil Varada on 7/22/25.
//

import SwiftUI

@main
struct SwiftfulMapAppApp: App {
    var body: some Scene {
        @State var viewModel = LocationsViewViewModel()
        WindowGroup {
            LocationsView()
                .environment(viewModel)
        }
    }
}
