//
//  TextFieldView.swift
//  lilith
//
//  Created by 楊德忻 on 2020/7/23.
//  Copyright © 2020 Potentia Computing Inc. All rights reserved.
//

import SwiftUI

struct TextFieldView : View {

    @ObservedObject private var notifier = TextFieldViewNotifier()

    @State var isSelected: Bool = false
    @State var input = ""
    
    var onEditingChanged: ((Bool) -> Void)?
    var onCommit: (() -> Void)?
    var didValueChanged: ((String) -> Void)?
    
    var body: some View {
        let binding = Binding<String>(get: {
            self.input
        }, set: {
            self.input = $0
            self.didValueChanged?(self.input)
        })
        return ZStack {

            VStack(spacing: 0) {
                HStack() {
                    self.getTitle()
                    Spacer()
                    self.getLabelFromRight()
                    self.getRightTitleButtonText()
                }
                HStack(spacing: 0) {
                    ZStack(alignment:.leading) {
                        if self.input.isEmpty {
                            Text(self.notifier.placeholderText)
                            .fonts(.body1)
                                .foregroundColor(self.notifier.placeholderColor)
                        }
                        TextField("",
                        text: binding,
                        onEditingChanged: { isChanged in
                            self.isSelected = isChanged
                            self.onEditingChanged?(isChanged)
                        },
                        onCommit: {
                            self.onCommit?()
                        })
                        .accentColor(self.notifier.inputColor)
                        .foregroundColor(self.notifier.inputColor)
                        .padding(EdgeInsets(top: 11, leading: 0, bottom: 11, trailing: 0))
                        .fonts(.body1)
                    }
                    
                    self.getRightButtonImage().multilineTextAlignment(.center)
                    self.getRightButtonText()
                    self.getRightText()
                }
                Rectangle()
                .frame(height: 1.0, alignment: .center)
                    .foregroundColor(self.notifier.isError ? self.notifier.errorLineColor : (self.isSelected ? self.notifier.selectedLineColor : self.notifier.lineColor))
                .padding(0)
                
                self.getErrorMessage()
                self.getHelpText()
            }
        }
    }
    
    // Layout view
    func getRightButtonImage() -> ImageButtonView? {
        if let rightButtonImage = self.notifier.rightButtonImage {
            return ImageButtonView(action: self.notifier.buttonAction, image: rightButtonImage)
        }
        return nil
    }
    
    func getRightButtonText() -> SimpleButtonView? {
        if let rightButtonText = self.notifier.rightButtonText {
            return SimpleButtonView(action: self.notifier.buttonAction, title: rightButtonText, style: .style1, size: .small)
        }
        return nil
    }
    
    func getRightText() -> AnyView? {
        if let rightText = self.notifier.rightText {
            return AnyView(Text(rightText).fonts(.body1).foregroundColor(self.notifier.inputColor))
        }
        return nil
    }
    
    func getRightTitleButtonText() -> SimpleButtonView? {
        if let rightTitleButtonText = self.notifier.rightTitleButtonText {
            return SimpleButtonView(action: self.notifier.buttonAction, title: rightTitleButtonText, style: .style1, size: .small)
        }
        return nil
    }
    
    func getLabelFromRight() -> AnyView? {
        if !self.notifier.labelFromRight.isEmpty {
            return AnyView(Text(self.notifier.labelFromRight)
            .fonts(.label2)
                .foregroundColor(self.notifier.labelFromRightColor)
            .minimumScaleFactor(0.9))
        }
        return nil
    }
    
    func getTitle() -> AnyView? {
        if !self.notifier.title.isEmpty {
            return AnyView(Text(self.notifier.title)
                .fonts(.label1).foregroundColor(self.notifier.titleColor).minimumScaleFactor(0.9))
        }
        return nil
    }
    
    func getErrorMessage() -> AnyView? {
        if !self.notifier.errorMessage.isEmpty {
            return AnyView(
                HStack() {
                    Text(self.notifier.errorMessage)
                    .fonts(.caption1)
                        .foregroundColor(self.notifier.errorForegroundColor)
                    .minimumScaleFactor(0.9)
                    Spacer()
                }
                .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
            )
        }
        return nil
    }
    
    func getHelpText() -> AnyView? {
        if !self.notifier.helpText.isEmpty {
            return AnyView(
                HStack() {
                    Text(self.notifier.helpText)
                    .fonts(.caption1)
                        .foregroundColor(self.notifier.helpForegroundColor)
                    .minimumScaleFactor(0.9)
                    Spacer()
                }
                .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
            )
        }
        return nil
    }
}

extension TextFieldView {
    public func rightButtonImage(_ image: UIImage?, action: (() -> Void)?) -> Self {
        self.clearRightView()
        self.notifier.rightButtonImage = image
        self.notifier.buttonAction = action
        return self
    }
    
    public func rightButtonText(_ text: String?, action: (() -> Void)?) -> Self {
        self.clearRightView()
        self.notifier.rightButtonText = text
        self.notifier.buttonAction = action
        return self
    }
    
    public func rightTitleButtonText(_ text: String?, action: (() -> Void)?) -> Self {
        self.notifier.rightTitleButtonText = text
        self.notifier.titleButtonAction = action
        return self
    }
    
    public func rightText(_ text: String?) -> Self {
        self.clearRightView()
        self.notifier.rightText = text
        return self
    }
    
    
    public func inputColor(_ color: Color) -> Self {
        self.notifier.inputColor = color
        return self
    }
    
    public func placeholderColor(_ color: Color) -> Self {
        self.notifier.placeholderColor = color
        return self
    }
    
    public func helpForegroundColor(_ color: Color) -> Self {
        self.notifier.helpForegroundColor = color
        return self
    }
    
    public func lineColor(_ color: Color) -> Self {
        self.notifier.lineColor = color
        return self
    }
    
    public func selectedLineColor(_ color: Color) -> Self {
        self.notifier.selectedLineColor = color
        return self
    }
    
    public func errorLineColor(_ color: Color) -> Self {
        self.notifier.errorLineColor = color
        return self
    }
    
    public func titleColor(_ color: Color) -> Self {
        self.notifier.titleColor = color
        return self
    }
    
    public func labelFromRightColor(_ color: Color) -> Self {
        self.notifier.labelFromRightColor = color
        return self
    }
    
    public func helpText(_ text: String) -> Self {
        self.notifier.helpText = text
        return self
    }
    
    public func errorMessage(_ text: String) -> Self {
        self.notifier.errorMessage = text
        return self
    }
    
    public func placeholderText(_ text: String) -> Self {
        self.notifier.placeholderText = text
        return self
    }
    
    public func title(_ text: String) -> Self {
        self.notifier.title = text
        return self
    }
    
    public func labelFromRight(_ text: String) -> Self {
        self.notifier.labelFromRight = text
        return self
    }
    
    public func isError(_ isError: Bool) -> Self {
        self.notifier.isError = isError
        return self
    }
    
    public func clearRightView() {
        self.notifier.rightButtonImage = nil
        self.notifier.rightButtonText = nil
        self.notifier.rightText = nil
    }
}

class TextFieldViewNotifier: ObservableObject {
    @Published var isError: Bool = false
    
    @Published var rightButtonImage: UIImage?
    @Published var buttonAction: (() -> Void)?
    
    @Published var rightTitleButtonText: String?
    @Published var titleButtonAction: (() -> Void)?
    @Published var rightButtonText: String?
    @Published var rightText: String?
    
    @Published var title: String = ""
    @Published var labelFromRight: String = ""
    @Published var helpText: String = ""
    @Published var errorMessage: String = ""
    @Published var placeholderText: String = ""
    
    @Published var inputColor: Color = Color(Colors.textinput)
    @Published var placeholderColor: Color = Color(Colors.textinputPlaceholder)
    @Published var helpForegroundColor: Color = Color(Colors.textinputHelptext)
    @Published var errorForegroundColor: Color = Color(Colors.textfieldError)
    @Published var lineColor: Color = Color(Colors.textfieldNormal)
    @Published var selectedLineColor: Color = Color(Colors.textfieldFocus)
    @Published var errorLineColor: Color = Color(Colors.textfieldError)
    @Published var titleColor: Color = Color(Colors.textinputLabel)
    @Published var labelFromRightColor: Color = Color(Colors.textinput)
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(Colors.backgroundColorBody).edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    TextFieldView(onEditingChanged: { value in
                        print(value)
                    })
                    .rightButtonImage(UIImage(named: "buttons-scan")!, action: {
                            
                        })
                    .title("adasd")
                    .helpText("123dsda")
                    .frame(width: 300, alignment: .leading)
                    
                    TextFieldView(didValueChanged: { value in
                        print(value)
                    })
                    .rightButtonText("1234", action: {
                        
                    })
                    .rightTitleButtonText("adasd", action: {})
                    .placeholderText("abcd")
                    .errorMessage("1234fsdf3")
                    .isError(true)
                    .frame(width: 300, alignment: .leading)
                    
                    TextFieldView(onCommit: {
                        
                    })
                    .rightText("1234")
                    .placeholderText("abcd")
                    .errorMessage("1234fsdf3")
                    .helpText("123dsda1")
                    .frame(width: 300, alignment: .leading)
                }
            }
        }
    }
}
