# SwiftCraft

A toolkit for accelerating programmatic UIKit development with declarative view factories, loading indicators, alerts, and a centralized appearance system.

## Installation

Add SwiftCraft to your project via Swift Package Manager:

```swift
dependencies: [
    .package(url: "https://github.com/michaeldmueller/SwiftCraft.git", from: "1.0.0")
]
```

**Requirements:** iOS 16+, Swift 5.9+

## Setup

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

## Accessing Theme Values

Once configured, access your theme fonts, colors, margins, and more from anywhere in your app via the `SC.appearance` namespace:

```swift
// Colors
let primaryColor = SC.appearance.color.primary
let textColor = SC.appearance.color.textPrimary

// Fonts
let headlineFont = SC.appearance.font.headline
let bodyFont = SC.appearance.font.body

// Margins
let standardSpacing = SC.appearance.margin.standard
let largeSpacing = SC.appearance.margin.large
```

This ensures consistent styling across your entire application and makes theme changes trivial—update one value and it propagates everywhere.

## Fonts: Scaled vs Fixed

SwiftCraft supports **Dynamic Type** out of the box. By default, all fonts are scaled automatically based on the user's accessibility settings—this is Apple's recommended practice.

```swift
// Scaled font (default) - respects Dynamic Type settings
let scaledFont = SC.appearance.font.headline
```

If you need a fixed font size that doesn't scale (e.g., for constrained UI elements), use the `.fixed` accessor:

```swift
// Fixed font - ignores Dynamic Type settings
let fixedFont = SC.appearance.font.fixed.headline
```

## Usage

All functionality is accessed through the `SC` namespace.

### View Factory

Create common UIKit views with sensible defaults. All views are returned with `translatesAutoresizingMaskIntoConstraints = false`.

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

### Buttons

Pre-styled buttons that automatically use your theme colors:

```swift
let primary = SC.primaryButton(title: "Submit")
let secondary = SC.secondaryButton(title: "Delete")
let tertiary = SC.tertiaryButton(title: "Cancel")
let outlined = SC.borderedButton(title: "Learn More")
```

Button appearances are derived from `SC.appearance.color` by default. Override individual button styles:

```swift
SC.appearance.buttons.primary = ButtonAppearance(
    baseBackgroundColor: .systemGreen,
    baseForegroundColor: .white,
    font: SC.appearance.font.callout,
    cornerRadius: 8.0,
    height: 52.0
)
```

### Loading Overlay

Display a loading indicator over a view controller:

```swift
SC.startLoading(parent: self)

// Later...
SC.stopLoading()

// Or auto-dismiss after duration:
SC.startLoading(parent: self, durationMillis: 2000)
```

### Alerts and Confirmations

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

Customize alert button text:

```swift
SC.appearance.text.alertDismissText = "OK"
SC.appearance.text.confirmCancelText = "No"
SC.appearance.text.confirmConfirmationText = "Yes"
```

## Appearance Reference

| Category | Properties |
|----------|------------|
| **Margin** | `extraExtraSmall`, `extraSmall`, `small`, `standard`, `large`, `extraLarge`, `extraExtraLarge` |
| **Color** | `primary`, `secondary`, `textPrimary`, `textSecondary`, `container`, `containerLight`, `outline`, `onPrimary`, `onSecondary`, `surface`, `error` |
| **Font** | `largeTitle`, `title1`, `title2`, `title3`, `headline`, `body`, `callout`, `subheadline`, `footnote`, `caption1`, `caption2` |
| **Font (Fixed)** | Access via `SC.appearance.font.fixed.*` |
| **Text** | `alertDismissText`, `confirmCancelText`, `confirmConfirmationText` |
| **Buttons** | `primary`, `secondary`, `tertiary`, `outline` |

## License

MIT
