An opiniated toolkit for accelerating iOS development with declarative views, loading indicators, and much more.

# Features

### View Factory Optimized for Programmatic UIKit
Instantiate views by calling `ScaffoldKit.imageView()` or `ScaffoldKit.label()`. Each function has common-sense defaults to minimize the amount of code required. 

#### Example Usage
```swift
let label = ScaffoldKit.label(
    text: "Some sample text",
    textColor: AppColor.primary
)

let view = ScaffoldKit.view(
    height: 100.0,
    width: 100.0,
    backgroundColor: AppColor.container
)
```

Supported views include:
- `stackView`
- `separator`
- `label`
- `imageView`
- `view`

### APIService with DefaultAPIService
Drop-in, async/await–based networking implementation that handles the full request → response → decoding lifecycle with strong defaults and useful failure diagnostics.

### AppColor
Centralized, global color palette for an application or library that defines semantic colors (primary, text, container, surface, error, etc.) with sensible UIKit defaults.

### AppFont
Typography system that provides consistent, rounded system fonts with Dynamic Type support across an app or UI library.

### AlertService
UI convenience utility that centralizes the creation and presentation of common UIAlertController patterns in UIKit.

### LoadingService
Simple, global loading-overlay utility for UIKit view controllers.
