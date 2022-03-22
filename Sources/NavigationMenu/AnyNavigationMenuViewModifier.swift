//
//  AnyNavigationMenuViewModifier.swift
//  NavigationMenu
//
//  Created by DeShawn Jackson on 3/19/22.
//

import SwiftUI

/// A type-erased NavigationMenuViewModifier.
public struct AnyNavigationMenuViewModifier {
    
    // MARK: - Stored properties
    
    private let closure: (AnyView, AnyView) -> AnyView
    
    // MARK: - Init
    
    public init<Modifier: NavigationMenuViewModifier>(_ modifier: Modifier) {
        self.closure = { (menuItems, content) in
            AnyView(modifier.body(menuItems: AnyView(menuItems), content: AnyView(content)))
        }
    }
    
    // MARK: - Methods
    
    public func body<MenuItems: View, Content: View>(menuItems: MenuItems, content: Content) -> some View {
        closure(AnyView(menuItems), AnyView(content))
    }
}
