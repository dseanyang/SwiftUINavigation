//
//  MenuView.swift
//  SwiftUINavigation
//
//  Created by 楊德忻 on 2020/7/10.
//  Copyright © 2020 Potentia Computing Inc. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    // TODO: Use viewmodel
    @Binding var isPresented: Bool
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                VStack {
                    Color(CustomizeColor.navigationBackground)
                }
                .frame(width: 300)
                VStack {
                    Color(CustomizeColor.clearBackground)
                }
            }
            .edgesIgnoringSafeArea(.all)
            .onTapGesture {
                self.isPresented.toggle()
            }
        }

    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(isPresented: .constant(false))
    }
}
