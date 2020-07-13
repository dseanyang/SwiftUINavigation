//
//  Page1.swift
//  SwiftUINavigation
//
//  Created by 楊德忻 on 2020/7/13.
//  Copyright © 2020 Potentia Computing Inc. All rights reserved.
//

import SwiftUI

struct Page1: View {
    // TODO: Use viewmodel
    @State var isDetailShow = false
    @EnvironmentObject var navigationViewModel: NavigationViewModel
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            })
            { Text("logout").font(.largeTitle) }.foregroundColor(.black)
            Button(action: {
                self.navigationViewModel.present(modelView: AnyView(ModelTestView(isPresented: self.$navigationViewModel.isShowModelView)), isShowModelView: true, type: .modal)
            })
            { Text("model").font(.largeTitle) }.foregroundColor(.black)
            Button(action: {
                self.isDetailShow = true
            })
            { Text("detail").font(.largeTitle) }.foregroundColor(.black)
            NavigationLink("", destination: DetailViewView(), isActive: $isDetailShow)
        }

        .navigationBarItems(leading: Image("buttonInform").onTapGesture {
            // TODO: Show menu and change mainView
            self.navigationViewModel.present(modelView: AnyView(MenuView(isPresented: self.$navigationViewModel.isShowModelView)), isShowModelView: true, type: .push)
        })
    }
}

struct Page1_Previews: PreviewProvider {
    static var previews: some View {
        Page1()
    }
}
