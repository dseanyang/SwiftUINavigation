//
//  BaseView.swift
//  SwiftUINavigation
//
//  Created by 楊德忻 on 2020/7/10.
//  Copyright © 2020 Potentia Computing Inc. All rights reserved.
//

import SwiftUI

struct BaseView<Content>: View where Content: View {
    var backgroundColor: Color = Color.clear
    
    let content: Content
    
    var body: some View {
        ZStack {
            self.backgroundColor
            self.content
        }
        .edgesIgnoringSafeArea(.all)
    }
}
