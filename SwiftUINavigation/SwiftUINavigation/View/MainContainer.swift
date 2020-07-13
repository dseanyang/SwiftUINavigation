//
//  MainContainer.swift
//  SwiftUINavigation
//
//  Created by 楊德忻 on 2020/7/13.
//  Copyright © 2020 Potentia Computing Inc. All rights reserved.
//

import SwiftUI
import Combine

struct MainContainer<Content: View> : View {
    let main: AnyView
    var body: some View {
        GeometryReader { proxy in
            self.generateBody(proxy: proxy)
        }.animation(.default)
    }
    
    init(content: Content) {
        
        self.main = AnyView.init(content)
    }
    
    func generateBody(proxy: GeometryProxy) -> some View {
        
        return ZStack {
            self.main
        }
    }
}

