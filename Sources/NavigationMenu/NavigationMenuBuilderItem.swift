//
//  NavigationMenuBuilderItem.swift
//  NavigationMenu
//
//  Created by DeShawn Jackson on 3/18/22.
//

import SwiftUI

/// An item that can be added to a NavigationMenu stack.
public struct NavigationMenuBuilderItem<Item: NavigationMenuItem>: Hashable {
        
    // MARK: - Hashable
    
    public static func == (lhs: NavigationMenuBuilderItem<Item>, rhs: NavigationMenuBuilderItem<Item>) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    // MARK: - Stored properties
    
    /// An id used to conform  NavigationMenuBuilderItem to hashable.
    private let id: UUID = .init()
    
    /// The view to present once the corresponding NavigationMenuItem is selected
    public let view: AnyView
    
    /// The NavigationMenuItem to display in the NavigationMenu.
    public let item: Item
    
}

extension View {
    
    /// The method to call on a view inside a NavigationMenu declaration to add a NavigationMenuItem to the view. This is similar implementation to .tabItem(label:) inside a TabView.
    public func navigationMenuItem<Item: NavigationMenuItem>(_ item: Item) -> NavigationMenuBuilderItem<Item> {
        .init(view: AnyView(self), item: item)
    }
}
