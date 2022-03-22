//
//  NavigationMenu.swift
//  NavigationMenu
//
//  Created by DeShawn Jackson on 3/7/22.
//

import SwiftUI

/// A view for presenting corresponding views that represent custom NavigationMenuItem's.
public struct NavigationMenu<Item: NavigationMenuItem>: View {
    
    // MARK: - Stored properties
    
    /// Used to animate the transition to the corresponding view when a NavigationMenuItem is tapped.
    let animation: Bool
    
    /// The NavigationMenuItem's and their corresponding views that were passed to the NavigationMenu.
    let content: [NavigationMenuBuilder<Item>.Content]
    
    /// The modifier used to customize the appearance and position of the NavigationMenuItem's and their corresponding views.
    let modifier: AnyNavigationMenuViewModifier?
    
    /// The index of the selected NavigationMenuItem.
    @State private var selectedItemIndex: Int = 0
    
    // MARK: - Init
    
    public init(withAnimation animation: Bool = true, @NavigationMenuBuilder<Item> content: () -> [NavigationMenuBuilder<Item>.Content]) {
        self.animation = animation
        self.content = content()
        self.modifier = nil
    }
    
    /// Internally used to add a custom layout to NavigationMenu using a NavigationMenuViewModifier via .modifier(_:).
    internal init<Modifier: NavigationMenuViewModifier>(_ navigationMenu: Self, modifier: Modifier) {
        self.animation = navigationMenu.animation
        self.content = navigationMenu.content
        self.modifier = AnyNavigationMenuViewModifier(modifier)
    }
    
    // MARK: - View
    
    public var body: some View {
        
        // If a NavigationMenuViewModifier has been added to the NavigationMenu,
        // then present the NavigationMenuItem's and their corresponding views according to its customizations.
        // Otherwise, present a default appearance.
        
        if let modifier = modifier {
            modifier.body(menuItems: menuItems, content: views)
        } else {
            // Default implementation
            HStack(spacing: 0) {
                VStack(spacing: 0) {
                    menuItems
                }
                views
            }
        }
    }
    
    /// The views to display when the corresponding menu item is selected
    var views: some View {
        ZStack {
            ForEach(content.indices, id: \.self) { index in
                content[index].view
                    .opacity(index == selectedItemIndex ? 1 : 0)
            }
        }
    }
    
    /// The NavigationMenu's menu items
    var menuItems: some View {
        ForEach(content.indices, id: \.self) { index in
            Button {
                if animation {
                    withAnimation {
                        selectItem(at: index)
                    }
                } else {
                    selectItem(at: index)
                }
            } label: {
                content[index].item
                    .selected(index == selectedItemIndex)
            }
        }
    }
    
    /// When a menu item is tapped, updates the selectedItemIndex, which updates which view to display.
    func selectItem(at index: Int) {
        selectedItemIndex = index
    }
}
