//
//  AlertView.swift
//  Presentation
//
//  Created by Maxwell Farias on 25/04/24.
//

import Foundation

public protocol AlertView {
    func showMessage(viewModel: AlertViewModel)
}

public struct AlertViewModel: Equatable {
    var title: String
    var message: String
}
