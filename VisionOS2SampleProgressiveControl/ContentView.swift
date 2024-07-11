//
//  ContentView.swift
//  VisionOS2SampleProgressiveControl
//
//  Created by Sadao Tokuyama on 7/11/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @State var earth: Entity?
    var body: some View {
        VStack {
            ToggleImmersiveSpaceButton()
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
