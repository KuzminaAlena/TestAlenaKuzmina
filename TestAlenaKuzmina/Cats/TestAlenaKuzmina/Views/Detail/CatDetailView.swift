//
//  CatDetailScreen.swift
//  TestAlenaKuzmina
//
//  Created by Алена on 30.11.2021.
//

import SwiftUI

struct CatDetailScreen: View {
   
    @State
    var viewModel: CatDetailViewModel
    
    var body: some View {
        Image(viewModel.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
    }
}

struct DetailScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        CatDetailScreen(viewModel: CatDetailViewModel(image: "cat0"))
    }
}
