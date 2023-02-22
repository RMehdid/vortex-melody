//
//  CGSize.swift
//  vortex melody
//
//  Created by Samy Mehdid on 8/10/2022.
//

import Foundation
import SwiftUI

extension CGSize {
    static var thumbSize:CGSize {
        return CGSize(width: 80, height: 80)
    }
    
    static var trackSize:CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 40, height: 100)
    }
}
