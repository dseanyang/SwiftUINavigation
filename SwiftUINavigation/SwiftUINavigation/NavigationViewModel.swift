//
//  NavigationViewModel.swift
//  SwiftUINavigation
//
//  Created by 楊德忻 on 2020/7/9.
//  Copyright © 2020 Potentia Computing Inc. All rights reserved.
//

import SwiftUI
import Combine

final class NavigationViewModel:  ObservableObject {

    @Published var isNavigationHide = false
    @Published var isShowModelView = false
    @Published private(set) var modelView: AnyView?
    @Published private(set) var type: AnimationStyle = .none
    
    func present(modelView: AnyView, isShowModelView: Bool, type: AnimationStyle) {
        self.modelView = modelView
        self.type = type
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.isShowModelView = isShowModelView
        }
    }
    
}
