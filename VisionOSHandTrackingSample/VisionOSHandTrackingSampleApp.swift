//
//  VisionOSHandTrackingSampleApp.swift
//  VisionOSHandTrackingSample
//
//  Created by Sadao Tokuyama on 2/19/24.
//

import SwiftUI

@main
struct VisionOSHandTrackingSampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
