//
//  Permission+PermissionPromptViewModel.swift
//  PermissionsKit
//
//  Created by David Messing on 5/19/18.
//  Copyright © 2018 davemess. All rights reserved.
//

import UIKit

/// Extends Permission with factory method to generate PermissionPromptViewModel.
extension Permission {
    
    private var displayTitle: String {
        return String(describing: self).capitalized
    }
    
    private var iconImage: UIImage {
        let iconName: String
        
        switch self {
        case .camera, .contacts, .microphone, .photos:
            iconName = String(format: "icon_%@", String(describing: self))
        case .locationAlways, .locationWhenInUse:
            iconName = "icon_location"
        }
        
        let bundle = Bundle(for: PermissionPromptView.self)
        return UIImage(named: iconName, in: bundle, compatibleWith: nil)!
    }
    
    private var displayReason: String {
        // TODO: replace text
        switch self {
        case .camera:
            return NSLocalizedString("Camera permission is necessary for accessing your camera.", comment: "")
        case .contacts:
            return NSLocalizedString("Contacts permission is necessary for accessing your list of contacts.", comment: "")
        case .locationAlways:
            return NSLocalizedString("Location permission is necessary for determining your current location.", comment: "")
        case .locationWhenInUse:
            return NSLocalizedString("Location permission is necessary for determining your current location.", comment: "")
        case .microphone:
            return NSLocalizedString("Microphone permission is necessary for recording audio.", comment: "")
        case .photos:
            return NSLocalizedString("Photos permission is necessary for accessing your photo album.", comment: "")
        }
    }
    
    func toPromptViewModel() -> PermissionPromptViewModel {
        let viewModel = PermissionPromptViewModel(icon: iconImage, title: displayTitle, reason: displayReason)
        return viewModel
    }
}
