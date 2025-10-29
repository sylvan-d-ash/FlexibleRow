# FlexibleRow - Evolutionary SwiftUI Component Design

A lightweight, flexible SwiftUI component system that demonstrates how to build UI components that evolve gracefully with changing requirements.

## Overview

`FlexibleRow` is a composable row component with three slots (leading, center, trailing) that can accommodate any SwiftUI view. It follows the principle of **"start simple, evolve as needed"** rather than over-engineering upfront.

## Screenshots

**ScrollView**

|  |  |
|--|--|
| <img width="250" alt="Simulator Screenshot - iPhone 16 Pro - 2025-10-29 at 13 50 38" src="https://github.com/user-attachments/assets/b6e97c4b-d925-439b-9a15-a163c76e31c0" /> | <img width="250" alt="Simulator Screenshot - iPhone 16 Pro - 2025-10-29 at 13 50 44" src="https://github.com/user-attachments/assets/5624ba91-04da-4484-8df1-0e519775816e" /> |

**List**

|  |  |  |
|--|--|--|
| <img width="250" alt="Simulator Screenshot - iPhone 16 Pro - 2025-10-29 at 13 58 26" src="https://github.com/user-attachments/assets/b37f86c9-9bc6-40e0-a8d0-532fb3e6f723" /> | <img width="250" alt="Simulator Screenshot - iPhone 16 Pro - 2025-10-29 at 13 58 49" src="https://github.com/user-attachments/assets/4662c170-9549-4a76-9f21-2ba9d2ca850b" /> | <img width="250" alt="Simulator Screenshot - iPhone 16 Pro - 2025-10-29 at 14 14 47" src="https://github.com/user-attachments/assets/348d5419-d8f5-4a5c-afc5-9e1fda54ce7b" /> |

## Design Philosophy

This project demonstrates:

- ✅ **YAGNI (You Aren't Gonna Need It)** - Build only what you need now
- ✅ **Composition over Configuration** - Use ViewBuilders instead of complex configuration objects
- ✅ **Progressive Enhancement** - Add convenience layers only when patterns emerge
- ✅ **Slot-based Architecture** - Think in terms of flexible slots, not specific components

## Core Component
```swift
struct FlexibleRow: View {
    @ViewBuilder let leading: () -> Leading
    @ViewBuilder let center: () -> Center
    @ViewBuilder let trailing: () -> Trailing
    
    var body: some View {
        HStack {
            leading()
            center()
            Spacer()
            trailing()
        }
        .padding()
    }
}
```

That's it. Everything else is optional.

## Usage

### Basic Usage
```swift
// Full flexibility - specify all three slots
FlexibleRow {
    Image(systemName: "star")
} center: {
    Text("Featured Item")
} trailing: {
    Button("View") { }
}
```

### With Convenience Initializers
```swift
// When you don't need a leading slot
FlexibleRow(text: "Notifications") {
    Toggle("", isOn: $enabled)
}

// Just center content
FlexibleRow {
    Text("Simple message")
}
```

## Custom Controls

The project includes three styled control components:

### ControlButton
```swift
// Title only
ControlButton(title: "Save") { 
    print("Saved") 
}

// Icon only
ControlButton(image: "heart.fill") { 
    print("Favorited") 
}

// Both
ControlButton(title: "Share", image: "square.and.arrow.up") { 
    print("Shared") 
}
```

### ControlToggle
```swift
ControlToggle(isOn: $isEnabled)
```

### ControlRadio
```swift
ControlRadio(isSelected: selectedIndex == 0) {
    selectedIndex = 0
}
```

## Real-World Examples

### Settings Screen
```swift
List {
    FlexibleRow(text: "Notifications") {
        ControlToggle(isOn: $notifications)
    }
    
    FlexibleRow(text: "Dark Mode") {
        ControlToggle(isOn: $darkMode)
    }
}
```

### Selection List
```swift
List {
    FlexibleRow(text: "Option 1") {
        ControlRadio(isSelected: selection == 0) {
            selection = 0
        }
    }
    
    FlexibleRow(text: "Option 2") {
        ControlRadio(isSelected: selection == 1) {
            selection = 1
        }
    }
}
```

### Navigation Controls
```swift
FlexibleRow {
    ControlButton(image: "chevron.left") {
        navigateBack()
    }
} center: {
    Text("Chapter 5")
} trailing: {
    ControlButton(image: "chevron.right") {
        navigateForward()
    }
}
```

### Complex Content
```swift
FlexibleRow {
    Image(systemName: "person.circle.fill")
        .font(.system(size: 40))
} center: {
    VStack(alignment: .leading) {
        Text("John Doe")
            .font(.headline)
        Text("john@example.com")
            .font(.subheadline)
            .foregroundColor(.secondary)
    }
} trailing: {
    ControlButton(title: "Edit") {
        editProfile()
    }
}
```

## Evolution Story

This component was designed to handle progressively complex requirements:

1. **"Design a component with text and a button"**
   - Built `FlexibleRow` with three generic slots
   
2. **"What if I want buttons on both sides?"**
   - Already supported - just use leading and trailing slots
   
3. **"What if I want to change the button images?"**
   - Created `ControlButton` with configurable title/image
   
4. **"What if I want a switch instead?"**
   - Added `ControlToggle` - works in any slot
   
5. **"What if I want radio buttons?"**
   - Added `ControlRadio` - same pattern

**Key insight:** The requirements were about controls and positions, not about a specific component. By thinking in terms of **slots** rather than hardcoded layouts, the design naturally accommodates all variations.

## Extensibility

### Adding New Controls
```swift
struct ControlSlider: View {
    @Binding var value: Double
    let range: ClosedRange
    
    var body: some View {
        Slider(value: $value, in: range)
    }
}

// Use it immediately
FlexibleRow(text: "Volume") {
    ControlSlider(value: $volume, range: 0...100)
}
```

### Custom Styling
```swift
// Add environment values for theming
FlexibleRow(text: "Themed") {
    ControlButton(title: "Action") { }
}
.environment(\.controlButtonStyle, .destructive)
```

### Layout Variations
```swift
// Vertical layout
struct FlexibleColumn: View {
    @ViewBuilder let top: () -> Top
    @ViewBuilder let middle: () -> Middle
    @ViewBuilder let bottom: () -> Bottom
    
    var body: some View {
        VStack {
            top()
            middle()
            Spacer()
            bottom()
        }
        .padding()
    }
}
```

## Works With

- ✅ `List`
- ✅ `ScrollView`
- ✅ `LazyVStack` / `LazyHStack`
- ✅ `Form`
- ✅ `ForEach`

## Installation

Copy these files to your project:
- `FlexibleRow.swift` - Core component + convenience initializers
- `ControlButton.swift` - Styled button component
- `ControlToggle.swift` - Styled toggle component  
- `ControlRadio.swift` - Styled radio button component

## Requirements

- iOS 14.0+
- Swift 5.5+
- SwiftUI

## Design Principles Applied

1. **Start with maximum flexibility** - Generic slots accommodate any view
2. **Add convenience when patterns emerge** - Extensions reduce boilerplate
3. **Composition over inheritance** - ViewBuilders allow infinite combinations
4. **Open for extension, closed for modification** - New controls work without changing core
5. **YAGNI** - Build what you need now, not what you might need later

## When to Use This Pattern

✅ **Good for:**
- Settings screens
- Form layouts
- List items with actions
- Repeating row patterns
- Components that need to evolve

❌ **Not ideal for:**
- One-off custom layouts (just use HStack/VStack directly)
- Highly specialized components
- When flexibility isn't needed

## License

MIT

## Contributing

This is a demonstration project showing evolutionary design principles. Feel free to adapt the pattern to your needs.

## Further Reading

- [YAGNI Principle](https://martinfowler.com/bliki/Yagni.html)
- [Composition over Configuration](https://en.wikipedia.org/wiki/Composition_over_inheritance)
- [SwiftUI ViewBuilder Documentation](https://developer.apple.com/documentation/swiftui/viewbuilder)

---

**Remember:** The best component is the simplest one that solves your current problem. Build for today, refactor for tomorrow.
