//
//  NavigationMenuItemIsSelectedEnvironmentKey.swift
//  
//
//  Created by DeShawn Jackson on 3/22/22.
//

import SwiftUI

internal struct NavigationMenuItemIsSelectedEnvironmentKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

extension EnvironmentValues {
    
    /// A value representing whether the NavigationMenuItem is the currently selected NavigationMenuItem in its NavigationMenu.
    public var navigationMenuItemIsSelected: Bool {
        get { self[NavigationMenuItemIsSelectedEnvironmentKey.self] }
        set { self[NavigationMenuItemIsSelectedEnvironmentKey.self] = newValue }
    }
}

extension NavigationMenuItem {
    
    /// A method called on a NavigationMenuItem in NavigationMenu to update its navigationMenuItemIsSelected value.
    internal func selected(_ selected: Bool) -> some View {
        environment(\.navigationMenuItemIsSelected, selected)
    }
}
