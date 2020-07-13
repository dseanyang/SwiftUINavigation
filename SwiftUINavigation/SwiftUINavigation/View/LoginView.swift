//
//  LoginView.swift
//  SwiftUINavigation
//
//  Created by 楊德忻 on 2020/7/10.
//  Copyright © 2020 Potentia Computing Inc. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    // TODO: Use viewmodel
    @State var isLogin = false
    @EnvironmentObject public var navigationViewModel: NavigationViewModel
    
    var body: some View {
        BaseView(content:
            VStack {
                Button(action: {
                    self.isLogin = true
                })
                { Text("login").font(.largeTitle) }.foregroundColor(.black)
                NavigationLink("", destination: self.navigationViewModel.main, isActive: $isLogin)
            }
            .onAppear(perform: {
                UINavigationBar.setAnimationsEnabled(true)
                self.navigationViewModel.isNavigationHide = false
                self.navigationViewModel.setMain(view: Page1())
            })
            .onDisappear(perform: {
            
            })
        )
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
