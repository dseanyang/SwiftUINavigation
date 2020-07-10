//
//  ContentView.swift
//  SwiftUINavigation
//
//  Created by 楊德忻 on 2020/7/9.
//  Copyright © 2020 Potentia Computing Inc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var isPushView = false
    var body: some View {
        NavigationViewPage(content:
            BaseView(content:
                VStack {
                    Text("LaunchView")
                    NavigationLink("", destination: LoginView(), isActive: $isPushView)
                }
                .onAppear(perform:  {
                    UINavigationBar.setAnimationsEnabled(false)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        self.isPushView = true
                    }
                })
                .onDisappear(perform: {
                    
                })
            )
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
