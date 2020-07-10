//
//  ContentView.swift
//  SwiftUINavigation
//
//  Created by 楊德忻 on 2020/7/9.
//  Copyright © 2020 Potentia Computing Inc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationViewPage(content:
            BaseView(content:
                VStack {
                    Text("")
                }
            )
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
