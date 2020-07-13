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
    @EnvironmentObject public var navigationViewModel: NavigationViewModel
    var pages = ["Page1", "Page2"]
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                ZStack() {
                    Color(CustomizeColor.navigationBackground)
                    VStack {
                        List(self.pages, id: \.self) { (page)  in
                            HStack {
                                Text(page).foregroundColor(.white)
                            }
                            .contentShape(Rectangle())
                            .onTapGesture {
                                if page == "Page1" {
                                    self.navigationViewModel.setMain(view: Page1())
                                }
                                else {
                                    self.navigationViewModel.setMain(view: Page2())
                                }
                                self.isPresented.toggle()
                            }
                        }
                        .onAppear {
                            UITableView.appearance().separatorColor = .clear
                            UITableView.appearance().backgroundColor = .clear
                            UITableViewCell.appearance().backgroundColor = .clear
                        }
                    }
                    .padding(44)
                }
                .frame(width: 300)
                .gesture(
                    DragGesture(minimumDistance: 5, coordinateSpace: .global)
                        .onChanged { value in
                        }
                        .onEnded { _ in
                            self.isPresented.toggle()
                        }
                )
                VStack {
                    Color(CustomizeColor.clearBackground)
                }
                .onTapGesture {
                    self.isPresented.toggle()
                }
            }
            .edgesIgnoringSafeArea(.all)
        }

    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(isPresented: .constant(false))
    }
}
