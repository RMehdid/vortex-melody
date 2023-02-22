//
//  Comparable.swift
//  vortex melody
//
//  Created by Samy Mehdid on 8/10/2022.
//

import Foundation

extension Comparable {
    func clamp<T: Comparable>(lower: T, _ upper: T) -> T {
        return min(max(self as! T, lower), upper)
    }
}
