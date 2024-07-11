//
//  VisionOS2SampleProgressiveControlApp.swift
//  VisionOS2SampleProgressiveControl
//
//  Created by Sadao Tokuyama on 7/11/24.
//

import SwiftUI

@main
struct VisionOS2SampleProgressiveControlApp: App {

    @State private var appModel = AppModel()
    @State private var immersionStyle: ImmersionStyle = .progressive(0.0...1.0, initialAmount: 0.1)

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
        }

        ImmersiveSpace(id: appModel.immersiveSpaceID) {
            ImmersiveView()
                .environment(appModel)
                .onAppear {
                    appModel.immersiveSpaceState = .open
                }
                .onDisappear {
                    appModel.immersiveSpaceState = .closed
                }
        }
        .immersionStyle(selection: $immersionStyle, in: .mixed, .progressive, .full)
    }
}
