# NavigationMenu

**NavigationMenu** makes ease of creating fully customizable navigation menus for navigating multiple views.

<p align="center">
<img src="../assets/gif1.gif?raw=true" alt="Screenshot" width="300" />
</p>

<p align="center">
    <a href="#requirements">Requirements</a> • <a href="#usage">Usage</a> • <a href="#installation">Installation</a> • <a href="#author">Author</a> • <a href="#license-mit">License</a>
</p>

## Requirements

- iOS 13.0+ / Mac OS X 10.15+
- Xcode 10.2+
- Swift 5.0+

## Usage

```swift

import SwiftUI
import NavigationMenu

struct MenuItem: NavigationMenuItem {
    
    public static let home = NavigationMenuItem_Example(SFSymbol().house, title: "Home")
    public static let calendar = NavigationMenuItem_Example(SFSymbol().calendar, title: "Calendar")
    public static let settings = NavigationMenuItem_Example(SFSymbol().gear, title: "Settings")

    let image: Image
    let title: String
    
    @Environment(\.navigationMenuItemIsSelected) var isSelected: Bool

    public init(_ symbol: SFSymbol, title: String) {
        self.image = Image(systemName: symbol.rawValue)
        self.title = title
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                image
                    .frame(width: 24)
                    Text(title)
                    Spacer()
            }
            .padding(.horizontal, 5)
        }
        .foregroundColor(isSelected ? .orange : .gray)
    }
} 

struct CustomModifier: NavigationMenuViewModifier {
    
    func body(menuItems: NavigationMenuItems, content: Content) -> some View {
        
        HStack(spacing: 0) {
            VStack(spacing: 10) {
                Spacer()
                    .frame(height: 44)
                menuItems
                Spacer()
            }
            .frame(minWidth: 44, maxWidth: 135)
            content
        }
    }
}

struct ContentView: View {
        
    var body: some View {
        
        NavigationMenu {
            
            Text("Home")
                .navigationMenuItem(MenuItem.home)
                
            Text("Calendar")
                .navigationMenuItem(MenuItem.calendar)
                
            Text("Settings")
                .navigationMenuItem(MenuItem.settings)
        }
        .modifier(CustomModifier())
    }
}

```

## Installation

#### Swift Package Manager
You can use [The Swift Package Manager](https://swift.org/package-manager) to install `NavigationMenu` by adding the proper description to your `Package.swift` file:
```swift
import PackageDescription

let package = Package(
    name: "YOUR_PROJECT_NAME",
    targets: [],
    dependencies: [
        .package(url: "https://github.com/shawnynicole/NavigationMenu.git", from: "1.0.0")
    ]
)
```
For more information on [Swift Package Manager](https://swift.org/package-manager), checkout its [GitHub Page](https://github.com/apple/swift-package-manager).

#### Manually

[Download](https://github.com/shawnynicole/NavigationMenu/archive/master.zip) the project and copy the `NavigationMenu` folder into your project to use it in.

## Author

shawnynicole

## License (MIT)

**NavigationMenu** is available under the MIT license. See the LICENSE file for more info.
