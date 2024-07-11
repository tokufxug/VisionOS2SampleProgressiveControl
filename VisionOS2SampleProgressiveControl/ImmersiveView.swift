//
//  ImmersiveView.swift
//  VisionOS2SampleProgressiveControl
//
//  Created by Sadao Tokuyama on 7/11/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    
    @State private var earth: Entity?
    var body: some View {
        RealityView { content in
            if let immersiveContentEntity = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
                content.add(immersiveContentEntity)
                 
                if let entity = immersiveContentEntity.findEntity(named: "Earth") {
                    let count = entity.availableAnimations.count
                    if count > 0 {
                        entity.playAnimation(entity.availableAnimations[count - 1].repeat())
                    }
                    entity.scale = SIMD3(0.005, 0.005, 0.005)
                    earth = entity
                }
            }
        }.onImmersionChange{ oldValue, newValue in
            var scale: Float = 0.001
            if newValue.amount == nil {
                earth?.scale = SIMD3(scale, scale, scale)
            } else if newValue.amount! > 0 {
                scale+=Float(newValue.amount!) / 30
                earth?.scale = SIMD3(scale, scale, scale)
            }
        }
    }
}

#Preview(immersionStyle: .progressive) {
    ImmersiveView()
        .environment(AppModel())
}
