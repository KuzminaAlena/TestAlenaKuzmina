//
//  CatsListView.swift
//  TestAlenaKuzmina
//
//  Created by Алена on 01.12.2021.
//

import SwiftUI

struct CatsListView: View {
    
    @State
    var viewModel: CatsListViewModel
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    ForEach(viewModel.viewModels) { viewModel in
                        CatView(
                            viewModel: viewModel,
                            isLarge: viewModel.id == self.viewModel.selectedViewModel?.id,
                            onTap: {
                                withAnimation(.easeOut) {
                                    if viewModel.id == self.viewModel.selectedViewModel?.id {
                                        self.viewModel.selectedViewModel = nil
                                    } else {
                                        self.viewModel.selectedViewModel = viewModel
                                    }
                                }
                            }
                        )
                    }
                }
            }
            .navigationTitle(viewModel.title)
        }
    }
}


struct ImageCats_Previews: PreviewProvider {
    static var previews: some View {
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
        CatsListView(viewModel: viewModel)
    }
}
