//
//  Colors.swift
//  lilith
//
//  Created by 楊德忻 on 2020/7/17.
//  Copyright © 2020 Potentia Computing Inc. All rights reserved.
//

import Foundation
import UIKit

struct Colors {
    static let gradientNormal = (
        top: UIColor(named: "color-gradient-normal-top")!,
        bottom: UIColor(named: "color-gradient-normal-bottom")!
    )
    
    static let gradientActive = (
        top: UIColor(named: "color-gradient-active-top")!,
        bottom: UIColor(named: "color-gradient-active-bottom")!
    )
    
    static let gradientDisabled = (
        top: UIColor(named: "color-gradient-disabled-top")!,
        bottom: UIColor(named: "color-gradient-disabled-bottom")!
    )
    
    static let gradientHover = (
        top: UIColor(named: "color-gradient-hover-top")!,
        bottom: UIColor(named: "color-gradient-hover-bottom")!
    )
    
    static let primary = UIColor(named: "color-primary")!
    static let main = UIColor(named: "color-main")!
    static let grey = UIColor(named: "color-grey")!
    static let darkgrey = UIColor(named: "color-darkgrey")!
    static let check = UIColor(named: "color-check")!
    static let warning = UIColor(named: "color-warning")!
    static let alert = UIColor(named: "color-alert")!
    
    static let textWhite = UIColor.white
    static let textLight = UIColor(named: "color-text-light")!
    static let textLabel = UIColor(named: "color-text-label")!
    static let textDusk = UIColor(named: "color-text-dusk")!
    
    static let backgroundColorBody = UIColor(named: "color-background-body")!
    static let backgroundColorContainer = UIColor(named: "color-background-container")!
    static let backgroundColorMenu = UIColor(named: "color-background-menu")!
    static let backgroundColorMenuHover = UIColor(named: "color-background-menu-hover")!
    static let backgroundColorModal = UIColor(named: "color-background-modal")!
    
    static let divider1 = UIColor(named: "color-divider-1")!
    static let divider2 = UIColor(named: "color-divider-2")!
    
    static let textfieldNormal = UIColor(named: "color-textfield-normal")!
    static let textfieldDisabled = UIColor(named: "color-textfield-disabled")!
    static let textfieldLabel = UIColor(named: "color-textinput-label")!
    static let textfieldFocus = Colors.primary
    static let textfieldError = Colors.alert
    
    static let textinputLabel = Colors.textLabel
    static let textinput = UIColor.white
    static let textinputPlaceholder = UIColor(named: "color-text-input-placeholder")!
    static let textinputDisabled = UIColor(named: "color-text-input-disabled")!
    static let textinputHelptext = UIColor(named: "color-text-input-helptext")!
    static let textinputErrorMessage = Colors.alert
}
