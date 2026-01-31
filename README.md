# SwiftCraft

A toolkit for accelerating programmatic UIKit development with declarative view factories, loading indicators, alerts, and a centralized appearance system.

**Requirements:** iOS 16+, Swift 5.9+

## Features

### App Themes
At the core of SwiftCraft is a centralized, configurable theme manager that lets you easily manage fonts, colors, buttons, and more from anywhere in your app via the `SC.appearance` namespace.

Examples:
```swift
// out of the box
label.font = SC.appearance.font.callout
label.textColor = SC.appearance.color.onPrimary

// with SwiftCraftShortcuts
label.font = AppFont.callout
label.textColor = AppColor.onContainer
```

This lets you set your theme configuration in one place and forget about it, encouraging consistency and quick development patterns.

#### Fonts
SwiftCraft supports **Dynamic Type** out of the box. By default, all fonts are scaled automatically based on the user's accessibility settings, aligning with Apple's recommended practices. If you do need a fixed font size that doesn't scale (e.g., for constrained UI elements), use the `.fixed` accessor:

```swift
titleLabel.font = SC.appearance.font.title3         // scaling
titleLabel.font = SC.appearance.font.fixed.title3   // non-scaling
```

The following text styles are available:
* `largeTitle`
* `title1`
* `title2`
* `title3`
* `headline`
* `body`
* `callout`
* `subheadline`
* `footnote`
* `caption1`
* `caption2`

#### Colors
Similar to fonts, SwiftCraft exposes the following configurable colors.
* `primary`
* `secondary`
* `textPrimary`
* `textSecondary`
* `container`
* `containerLight`
* `outline`
* `onPrimary`
* `onSecondary`
* `surface`
* `error`

#### Buttons
SwiftCraft exposes configurable primary, secondary, tertiary, and bordered buttons. 

```swift
let button = SC.primaryButton(
    title: "My primary button"
)
```

These buttons are configured by setting `ButtonAppearance` inside `SC.appearance.buttons`. Examples:

```swift
// Round primary button
var primary = ButtonAppearance()
primary.baseBackgroundColor = SC.appearance.color.primary
primary.font = AppFont.callout
primary.cornerStyle = .capsule

SC.appearance.buttons.primary = primary
```

SwiftCraft supports adding images to buttons via either directly using `UIImage`, or using a custom `ButtonImage` class that can be accessed either directly or via extension on `UIImage`. `ButtonImage` lets you change the configuration of the button at the call-site.

```swift
// From UIImage
let button = SC.primaryButton(
    title: "Testing",
    image: UIImage(systemName: "arrow.forward")
)

// From ButtonImage
let button2 = SC.secondaryButton(
    title: "Testing",
    image: ButtonImage(image: UIImage(systemName: "arrow.forward")!)
)

// UIImage to ButtonImage extension with additional parameters
let button = SC.tertiaryButton(
    title: "Testing",
    image: UIImage(systemName: "arrow.forward")?.toButtonImage(
        placement: .trailing,
        padding: 12.0,
        cornerStyle: 
    )
)
```

### View Factory
Create common UIKit views with sensible defaults. All views are returned with Auto Layout disabled for use with `NSLayoutConstraint`s.

```swift
let label = SC.label(
    text: "Hello, world",
    font: SC.appearance.font.headline,
    textColor: SC.appearance.color.textPrimary
)

let stack = SC.stackView(
    axis: .vertical,
    spacing: SC.appearance.margin.standard,
    arrangedSubviews: [label, anotherView]
)

let image = SC.imageView(
    image: UIImage(systemName: "star"),
    tintColor: SC.appearance.color.primary,
    height: 24,
    width: 24
)

let divider = SC.separator()

let spacer = SC.view(height: 20)
```

### Other Features
#### Loading Overlay

Display a loading indicator over a view controller:

```swift
SC.startLoading(parent: self)

// Later...
SC.stopLoading()

// Or auto-dismiss after duration:
SC.startLoading(parent: self, durationMillis: 2000)
```

#### Alerts and Confirmations**

Present alerts, confirmation dialogs, and action sheets:

```swift
SC.alert(
    title: "Error",
    message: "Something went wrong.",
    presenter: self
)

SC.confirm(
    title: "Delete Item",
    message: "Are you sure?",
    presenter: self,
    positiveCompletion: { /* delete */ },
    cancelCompletion: nil
)

SC.actionSheet(
    title: "Options",
    message: "Choose an action",
    actions: [action1, action2],
    presenter: self
)
```

## Installation and Setup

Add SwiftCraft to your project via Swift Package Manager:

```swift
dependencies: [
    .package(url: "https://github.com/michaeldmueller/SwiftCraft.git", from: "1.0.0")
]
```

We recommend initializing your theme configuration in `AppDelegate` before the app launches. Create an `AppTheme` class to centralize your customizations:

```swift
// AppTheme.swift
import SwiftCraft

enum AppTheme {
    static func initTheme() {
        // Colors
        SC.appearance.color.primary = .systemIndigo
        SC.appearance.color.secondary = .systemPink
        SC.appearance.color.textPrimary = .label

        // Typography
        SC.appearance.font.headline = .systemFont(ofSize: 18, weight: .bold)
        SC.appearance.font.body = .systemFont(ofSize: 16, weight: .regular)

        // Spacing
        SC.appearance.margin.standard = 16.0

        // Button styles
        SC.appearance.buttons.primary = ButtonAppearance(
            baseBackgroundColor: .systemIndigo,
            baseForegroundColor: .white,
            cornerRadius: 12.0
        )
    }
}
```

Then call it in your `AppDelegate`:

```swift
// AppDelegate.swift
func application(_ application: UIApplication,
                 didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    AppTheme.initTheme()
    return true
}
```

## SwiftCraftShortcuts
To reduce code at the call-site, you can optionally include SwiftCraftShortcuts as well. This exposes common patterns with the `App` prefix. Examples:
* `AppFont.callout`
* `AppColor.primary`

To avoid conflicts, these shortcuts are not included by default.

To add, include the package:

```swift
dependencies: [
    .package(url: "https://github.com/michaeldmueller/SwiftCraftShortcuts.git", from: "0.0.1")
]
```

## License

MIT
