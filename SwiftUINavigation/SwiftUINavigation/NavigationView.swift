//
//  NavigationView.swift
//  SwiftUINavigation
//
//  Created by 楊德忻 on 2020/7/10.
//  Copyright © 2020 Potentia Computing Inc. All rights reserved.
//

import SwiftUI

struct NavigationViewPage<Content>: View where Content: View {
    
    @EnvironmentObject public var viewModel: NavigationViewModel
    @Environment(\.presentationMode) var presentationMode
    let content: Content
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                NavigationView {
                    ZStack {
                        self.content
                        .navigationBarHidden(self.viewModel.isNavigationHide)
                        .navigationBarTitle("", displayMode: .inline)
                    }
                    .edgesIgnoringSafeArea(.all)
                }
            }
            .onAppear(perform: {
                
            }).onDisappear(perform: {
                
            })
            .present(self.$viewModel.isShowModelView, view: self.viewModel.modelView, style: .push)
        }
    }
}

