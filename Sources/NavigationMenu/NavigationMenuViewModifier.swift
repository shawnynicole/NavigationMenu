//
//  NavigationMenuViewModifier.swift
//  NavigationMenu
//
//  Created by DeShawn Jackson on 3/18/22.
//

import SwiftUI

/// Used to create a custom appearance for a NavigationMenu's NavigationMenuItem's and its corresponding views.
public protocol NavigationMenuViewModifier {
    
    typealias NavigationMenuItems = AnyView
    typealias Content = AnyView
    associatedtype ContentBody: View
    
    func body(menuItems: NavigationMenuItems, content: Content) -> ContentBody
}

extension NavigationMenu {
    
    /// The method to call to add a custom appearance to a NavigationMenu's NavigationMenuItem's and their corresponding views.
    public func modifier<Modifier: NavigationMenuViewModifier>(_ modifier: Modifier) -> some View {
        NavigationMenu(self, modifier: modifier)
    }
}
