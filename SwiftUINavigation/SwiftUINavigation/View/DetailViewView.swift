//
//  DetailViewView.swift
//  SwiftUINavigation
//
//  Created by 楊德忻 on 2020/7/10.
//  Copyright © 2020 Potentia Computing Inc. All rights reserved.
//

import SwiftUI

struct DetailViewView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        BaseView(content:
            Text("detail")
        )
        .navigationBarItems(leading: Image("ic-back").onTapGesture {
            self.presentationMode.wrappedValue.dismiss()
        })

    }
}

struct DetailViewView_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewView()
    }
}
