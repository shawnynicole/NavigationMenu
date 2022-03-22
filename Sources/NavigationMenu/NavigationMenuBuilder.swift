//
//  NavigationMenuBuilder.swift
//  NavigationMenu
//
//  Created by DeShawn Jackson on 3/18/22.
//

import Foundation

/// Used to add NavigationMenuItem's and their corresponding views (as NavigationMenuBuilderItem's) to a NavigationMenu
@resultBuilder
public struct NavigationMenuBuilder<Item: NavigationMenuItem> {
    public typealias Content = NavigationMenuBuilderItem<Item>
    public static func buildBlock() -> [Content] { [] }
    public static func buildBlock(_ components: Content...) -> [Content] { components }
}
