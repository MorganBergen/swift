#  swiftui tutorial

#### [creating and combining views introduction](https://developer.apple.com/tutorials/swiftui/creating-and-combining-views#Create-a-new-project-and-explore-the-canvas)

this tutorial guides you through building landmarks - an app for discovering and sharing the places you love.  you'll start by building the view that shows a landmark's detail.

to lay out the views, landmarks uses stacks to combine and layer the image and text view components.  to add a map to the view, you'll include a standard `MapKit` component.  as you refine the view's design, Xcode provides real-time feedback so you can see how those changes translate to code.

##  section 1 create a new project and explore the canvas

`LandmarksApp.swift`

```swift
import SwiftUI

@main
struct LandmarksApp: App {

    var body: some Scene {
        
        WindowGroup {
            
            ContentView()

        }
    }
}
```

