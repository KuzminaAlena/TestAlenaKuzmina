//
//  TestAlenaKuzminaApp.swift
//  TestAlenaKuzmina
//
//  Created by Алена on 30.11.2021.
//

import SwiftUI

@main
struct TestAlenaKuzminaApp: App {
    
    let viewModel = CatsListViewModel(
        title: "Cats",
        viewModels: [
            CatViewModel(image: "cat0", buttonTitle: "Zoom"),
            CatViewModel(image: "cat1", buttonTitle: "Zoom"),
            CatViewModel(image: "cat2", buttonTitle: "Zoom"),
            CatViewModel(image: "cat3", buttonTitle: "Zoom"),
            CatViewModel(image: "cat4", buttonTitle: "Zoom"),
            CatViewModel(image: "cat5", buttonTitle: "Zoom"),
            CatViewModel(image: "cat6", buttonTitle: "Zoom")
        ],
        selectedViewModel: nil
    )
    
    var body: some Scene {
        WindowGroup {
            CatsListView(viewModel: viewModel)
        }
    }
}
