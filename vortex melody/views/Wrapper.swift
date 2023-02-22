//
//  Wrapper.swift
//  vortex melody
//
//  Created by Samy Mehdid on 8/10/2022.
//

import Foundation
import SwiftUI

struct WrapperView: View {
    var body: some View {
        NavigationView {
            HomeView()
        }
        .navigationViewStyle(.stack)
    }
}
