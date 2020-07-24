//
//  Buttons.swift
//  Buttons
//
//  Created by 楊德忻 on 2020/7/20.
//  Copyright © 2020 Potentia Computing Inc. All rights reserved.
//

import SwiftUI
import UIKit

// SimpleButtonView
struct SimpleButtonView: View {

    let action: (() -> Void)?
    var title: String
    var style: SimpleButtonStyles.Style
    var size: SimpleButtonStyles.SizeStyle = .large
    @Environment(\.isEnabled) private var isEnabled
    var body: some View {
        Button(action: {
            self.action?()
        }){
            Text(self.title).fontWeight(.bold)
        }
        .buttonStyle(SimpleButtonStyles(isEnabled: self.isEnabled, style: self.style, size: self.size))
    }
}

struct SimpleButtonStyles: ButtonStyle {
    
    enum Style {
        case style1, style2
    }
    
    enum SizeStyle {
        case large, small
    }
    
    var isEnabled: Bool
    var style: Style = .style1
    var size: SizeStyle = .large
    
    func getForegroundColor() -> Color {
        switch self.style {
        case .style1:
            return Color(Colors.primary)
        case .style2:
            return Color(Colors.alert)
        }
    }
    
    func getPadding() -> EdgeInsets {
        switch self.size {
        case .large:
            return EdgeInsets(top: 11, leading: 40, bottom: 11, trailing: 40)
        case .small:
            return EdgeInsets(top: 11, leading: 0, bottom: 11, trailing: 0)
        }
    }
    
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(self.getPadding())
            .foregroundColor(self.getForegroundColor())
            .fonts(.button1)
            .opacity(self.isEnabled ? (configuration.isPressed ? 0.6 : 1) : 0.3)
    }
}

// ImageButtonView
struct ImageButtonView: View {
    
    let action: (() -> Void)?
    var image: UIImage
    @Environment(\.isEnabled) private var isEnabled
    var body: some View {
        Button(action: {
            self.action?()
        }){
            Text("")
        }
        .buttonStyle(ImageButtonStyles(isEnabled: self.isEnabled, image: self.image))
    }
}

struct ImageButtonStyles: ButtonStyle {
    
    var isEnabled: Bool
    var image: UIImage
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .background(Image(uiImage: self.image))
            .fonts(.button1)
            .opacity(self.isEnabled ? (configuration.isPressed ? 0.6 : 1) : 0.3)
    }
}

// RoundButtonView
struct RoundButtonView: View {
    
    let action: (() -> Void)?
    var title: String
    var style: RoundButtonStyles.Style
    var size: RoundButtonStyles.SizeStyle
    @Environment(\.isEnabled) private var isEnabled
    var body: some View {
        Button(action: {
            self.action?()
        }){
            Text(self.title).fontWeight(.bold)
        }
        .buttonStyle(RoundButtonStyles(isEnabled: self.isEnabled, size: self.size, style: self.style))
    }
}

struct RoundButtonStyles: ButtonStyle {
    enum Style {
        case style1, style2, style3
    }
    
    enum SizeStyle {
        case large, medium, small
    }
    
    var isEnabled: Bool
    var size: SizeStyle
    var style: Style = .style1
    
    let foregroundColor: Color = .white
    
    func getPadding() -> EdgeInsets {
        switch self.size {
        case .large:
            return EdgeInsets(top: 11, leading: 40, bottom: 11, trailing: 40)
        case .medium:
            return EdgeInsets(top: 8, leading: 30, bottom: 8, trailing: 30)
        case .small:
            return EdgeInsets(top: 6, leading: 24.5, bottom: 6, trailing: 24.5)
        }
    }
    
    func getFont() -> FontsModifier.Style {
        switch self.size {
        case .large:
            return .button1
        case .medium:
            return .button2
        case .small:
            return .button3
        }
    }
    
    func getBackgroundNormalColor() -> AnyView {
        switch self.style {
        case .style1:
            return AnyView(LinearGradient(gradient: Gradient(colors: [Color(Colors.gradientNormal.top), Color(Colors.gradientNormal.bottom)]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
        case .style2:
            return AnyView(Color(Colors.darkgrey))
        case .style3:
            return AnyView(Color.black.opacity(0.0001))
        }
    }
    
    func getBackgroundActiveColor() -> AnyView {
        switch self.style {
        case .style1:
            return AnyView(LinearGradient(gradient: Gradient(colors: [Color(Colors.gradientActive.top), Color(Colors.gradientActive.bottom)]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
        case .style2:
            return AnyView(Color(Colors.backgroundColorMenuHover))
        case .style3:
            return AnyView(Color(Colors.darkgrey))
        }
    }
    
    func getBackgroundDisabledColor() -> AnyView {
        switch self.style {
        case .style1:
            return AnyView(LinearGradient(gradient: Gradient(colors: [Color(Colors.gradientNormal.top), Color(Colors.gradientNormal.bottom)]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
        case .style2:
            return AnyView(Color(Colors.darkgrey))
        case .style3:
            return AnyView(Color.black.opacity(0.0001))
        }
    }
    
    func getBorderColor() -> Color {
        switch self.style {
        case .style1:
            return .clear
        case .style2:
            return .clear
        case .style3:
            return Color(Colors.divider1)
        }
    }

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(self.foregroundColor)
            .padding(self.getPadding())
            .fonts(self.getFont())
            .background(self.isEnabled ? (configuration.isPressed ? self.getBackgroundActiveColor() : self.getBackgroundNormalColor()) : self.getBackgroundDisabledColor())
            .opacity(self.isEnabled ? 1 : 0.3)
            .cornerRadius(.infinity)
            .overlay(RoundedRectangle(cornerRadius: .infinity).stroke(self.getBorderColor(), lineWidth: 1))
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack {
            Color(Colors.backgroundColorBody).edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    RoundButtonView(action: {}, title: "Login", style: .style1, size: .large).disabled(true)
                        
                    RoundButtonView(action: {}, title: "Login", style: .style2, size: .large)
                    RoundButtonView(action: {}, title: "Login", style: .style3, size: .large)
                }
                VStack {
                    RoundButtonView(action: {}, title: "Login", style: .style1, size: .large).disabled(true)
                }
            }
        }
    }
}
