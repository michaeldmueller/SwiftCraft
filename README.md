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

Pre-styled buttons with customizable appearances:

```swift
let primary = SC.primaryButton(title: "Submit")
let secondary = SC.secondaryButton(title: "Delete")
let tertiary = SC.tertiaryButton(title: "Cancel")
let outlined = SC.borderedButton(title: "Learn More")
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

## Customizing Appearance

Customize colors, fonts, spacing, and button styles globally via `SC.appearance`:

```swift
// Colors
SC.appearance.color.primary = .systemIndigo
SC.appearance.color.textPrimary = .label

// Typography
SC.appearance.font.headline = .systemFont(ofSize: 18, weight: .bold)

// Spacing
SC.appearance.margin.standard = 16.0

// Alert button text
SC.appearance.text.alertDismissText = "OK"
SC.appearance.text.confirmCancelText = "No"
SC.appearance.text.confirmConfirmationText = "Yes"
```

### Available Appearance Properties

| Category | Properties |
|----------|------------|
| **Margin** | `extraExtraSmall`, `extraSmall`, `small`, `standard`, `large`, `extraLarge`, `extraExtraLarge` |
| **Color** | `primary`, `secondary`, `textPrimary`, `textSecondary`, `container`, `containerLight`, `outline`, `onPrimary`, `onSecondary`, `surface`, `error` |
| **Font** | `largeTitle`, `title1`, `title2`, `title3`, `headline`, `body`, `callout`, `subheadline`, `footnote`, `caption1`, `caption2` |
| **Text** | `alertDismissText`, `confirmCancelText`, `confirmConfirmationText` |
| **Buttons** | `primary`, `secondary`, `tertiary`, `outline` |

## License

MIT
