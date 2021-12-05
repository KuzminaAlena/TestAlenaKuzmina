//
//  CatView.swift
//  TestAlenaKuzmina
//
//  Created by Алена on 05.12.2021.
//

import SwiftUI

struct CatView: View {
    
    let viewModel: CatViewModel
    let isLarge: Bool
    let onTap: () -> Void
    
    init(
        viewModel: CatViewModel,
        isLarge: Bool,
        onTap: @escaping () -> Void) {
        self.viewModel = viewModel
        self.isLarge = isLarge
        self.onTap = onTap
        print(viewModel)
    }
    
    var body: some View {
        VStack(alignment: .trailing) {
            ZStack {
                Button(
                    action: {
                        onTap()
                    },
                    label: {
                        Image(viewModel.image).resizable()
                    }
                )
                .frame(
                    width: isLarge ? 200.0 : 150.0,
                    height: isLarge ? 200.0 : 150.0
                )
            }
            .frame(
                width: isLarge ? 200 : 150,
                height: isLarge ? 200 : 150
            ) .padding()
            
            if isLarge {
                NavigationLink(
                    viewModel.buttonTitle,
                    destination: CatDetailScreen(viewModel: CatDetailViewModel(image: viewModel.image))
                ).padding(.trailing, 30)
            }
        }
    }
}
