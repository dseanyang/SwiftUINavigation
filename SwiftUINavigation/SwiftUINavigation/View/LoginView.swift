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
    @State var isError = false
    @EnvironmentObject public var navigationViewModel: NavigationViewModel
    var body: some View {
        BaseView(content:
            ZStack {
                Color(Colors.backgroundColorBody).edgesIgnoringSafeArea(.all)
                VStack {
                    RoundButtonView(action: {
//                        self.isLogin = true

                    }, title: "Login", style: .style3, size: .large)
                    .disabled(false)
                    
                    TextFieldView(didValueChanged: { value in
                        print(value)
                        if value.count > 8 {
                            self.isError = true
                        }
                        else {
                            self.isError = false
                        }
                    })
                    .title("title")
                    .rightButtonImage(UIImage(named: "buttons-scan")!, action: {
                            
                    })
                    .isError(self.isError)
                    .helpText("123dsda")
                    .frame(width: 300, alignment: .leading)
                    
                    TextFieldView()
                    .rightButtonText("1234", action: {
                        
                    })
                    .placeholderText("abcd")
                    .errorMessage("1234fsdf3")
                    .frame(width: 300, alignment: .leading)
                    
                    TextFieldView()
                    .rightText("1234")
                    .placeholderText("abcd")
                    .errorMessage("1234fsdf3")
                    .helpText("123dsda")
                    .frame(width: 300, alignment: .leading)
                    .keyboardType(.numberPad)
                    
                    NavigationLink("", destination: self.navigationViewModel.main, isActive: $isLogin)
                }
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
        LoginView().environmentObject(NavigationViewModel())
    }
}
