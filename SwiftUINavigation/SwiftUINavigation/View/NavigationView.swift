//
//  NavigationView.swift
//  SwiftUINavigation
//
//  Created by 楊德忻 on 2020/7/10.
//  Copyright © 2020 Potentia Computing Inc. All rights reserved.
//

import SwiftUI

struct NavigationViewPage<Content: View>: View {
    
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
                    .background(NavigationConfigurator { nc in
                        nc.navigationBar.barTintColor = CustomizeColor.navigationBackground
                        nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
                    })
                }
                .navigationViewStyle(StackNavigationViewStyle())
            }
            .onAppear(perform: {
                
            }).onDisappear(perform: {
                
            })
            .present(self.$viewModel.isShowModelView, view: self.viewModel.modelView, style: self.viewModel.type)
        }
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
