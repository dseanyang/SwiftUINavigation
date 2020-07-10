//
//  PresentModifier.swift
//  SwiftUINavigation
//
//  Created by 楊德忻 on 2020/7/9.
//  Copyright © 2020 Potentia Computing Inc. All rights reserved.
//

import SwiftUI

fileprivate struct FullModal<PresentedView: View>: ViewModifier {
    
    @Binding var isPresented: Bool
    let presentedView: PresentedView
    let style: AnimationStyle
    
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            ZStack {
                ZStack {
                    content
                }
                ZStack {
                    Color.clear.edgesIgnoringSafeArea(.all)
                    self.presentedView
                }
                .offset(x: self.xOffset(geometry), y: self.yOffset(geometry))
                .opacity(self.opacity)
            }
        }
    }
    
    private func xOffset(_ geometry: GeometryProxy) -> CGFloat {
        switch style {
        case .none, .modal:
            return 0
        case .push:
            return isPresented ? 0 : viewWidth(geometry)
        }
    }
    
    
    private func yOffset(_ geometry: GeometryProxy) -> CGFloat {
        switch style {
        case .none:
            return 0
        case .modal:
            return isPresented ? 0 : viewHeight(geometry)
        case .push:
            return 0
        }
    }
    
    private var opacity: Double {
        switch style {
        case .none, .modal:
            return 1
        case .push:
            return 1
        }
    }
    
    private func viewHeight(_ proxy: GeometryProxy) -> CGFloat {
        proxy.size.height + proxy.safeAreaInsets.top + proxy.safeAreaInsets.bottom
    }
    
    private func viewWidth(_ proxy: GeometryProxy) -> CGFloat {
        -proxy.size.width
    }
    
}

// Defines all the animation styles
enum AnimationStyle {
    // View will present without animation
    case none
    
    // View will present by sliding from the bottom
    case modal
    
    // View will push in/out
    case push
}

extension View {
    
    func present<Content: View>(_ isPresented: Binding<Bool>, view: Content, style: AnimationStyle = .modal) -> some View {
        self.modifier(FullModal(isPresented: isPresented, presentedView: view, style: style))
                .animation(style != .none ? .easeInOut : .none)
    }
    
}

