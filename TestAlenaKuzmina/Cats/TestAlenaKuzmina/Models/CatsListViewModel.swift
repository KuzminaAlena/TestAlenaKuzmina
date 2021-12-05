//
//  CatsListViewModel.swift
//  TestAlenaKuzmina
//
//  Created by Алена on 30.11.2021.
//

import Foundation
import SwiftUI

struct CatsListViewModel {
    let title: String
    var viewModels: [CatViewModel]
    var selectedViewModel: CatViewModel?
}
