//
//  PushTestView.swift
//  SwiftUINavigation
//
//  Created by 楊德忻 on 2020/7/10.
//  Copyright © 2020 Potentia Computing Inc. All rights reserved.
//

import SwiftUI

struct PushTestView: View {
    // TODO: Use viewmodel
    @Binding var isPresented: Bool
    var body: some View {
        BaseView(content:
            ZStack {
                Color.white
                Button(action: {
                    self.isPresented.toggle()
                })
                { Text("pop").font(.largeTitle) }.foregroundColor(.black)
            }
        )
        
    }
}

