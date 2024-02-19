//
//  HandTrackingView.swift
//  VisionOSHandTrackingSample
//
//  Created by Sadao Tokuyama on 2/19/24.
//

import SwiftUI
import RealityKit
import ARKit

struct HandTrackingView: View {
    
    let session = ARKitSession()
    var handTrackingProvider = HandTrackingProvider()
    @State var latestHandTracking: HandsUpdates = .init(left: nil, right: nil)
    
    @State var leftWristModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var leftThumbKnuckleModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var leftThumbIntermediateBaseModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var leftThumbIntermediateTipModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var leftThumbTipModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var leftIndexFingerMetacarpalModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var leftIndexFingerKnuckleModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var leftIndexFingerIntermediateBaseModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var leftIndexFingerIntermediateTipModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var leftIndexFingerTipModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var leftMiddleFingerMetacarpalModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var leftMiddleFingerKnuckleModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var leftMiddleFingerIntermediateBaseModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var leftMiddleFingerIntermediateTipModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var leftMiddleFingerTipModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var leftRingFingerMetacarpalModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var leftRingFingerKnuckleModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var leftRingFingerIntermediateBaseModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var leftRingFingerIntermediateTipModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var leftRingFingerTipModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var leftLittleFingerMetacarpalModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var leftLittleFingerKnuckleModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var leftLittleFingerIntermediateBaseModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var leftLittleFingerIntermediateTipModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var leftLittleFingerTipModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var leftForearmWristModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var leftForearmArmModelEntity = ModelEntity(
        mesh: .generateBox(width: 0.5, height: 0.1, depth: 0.15),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    
    @State var rightWristModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var rightThumbKnuckleModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var rightThumbIntermediateBaseModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var rightThumbIntermediateTipModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var rightThumbTipModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var rightIndexFingerMetacarpalModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var rightIndexFingerKnuckleModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var rightIndexFingerIntermediateBaseModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var rightIndexFingerIntermediateTipModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var rightIndexFingerTipModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var rightMiddleFingerMetacarpalModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var rightMiddleFingerKnuckleModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var rightMiddleFingerIntermediateBaseModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var rightMiddleFingerIntermediateTipModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var rightMiddleFingerTipModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var rightRingFingerMetacarpalModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var rightRingFingerKnuckleModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var rightRingFingerIntermediateBaseModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var rightRingFingerIntermediateTipModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var rightRingFingerTipModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var rightLittleFingerMetacarpalModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var rightLittleFingerKnuckleModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var rightLittleFingerIntermediateBaseModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var rightLittleFingerIntermediateTipModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var rightLittleFingerTipModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var rightForearmWristModelEntity = ModelEntity(
        mesh: .generateSphere(radius: 0.015),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    @State var rightForearmArmModelEntity = ModelEntity(
        mesh: .generateBox(width: 0.5, height: 0.1, depth: 0.15),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    
    struct HandsUpdates {
        var left: HandAnchor?
        var right: HandAnchor?
    }
    
    var body: some View {
        VStack {
            Text("Hand Tracking.")
            RealityView { content in
                content.add(leftWristModelEntity)
                content.add(leftThumbKnuckleModelEntity)
                content.add(leftThumbIntermediateBaseModelEntity)
                content.add(leftThumbIntermediateTipModelEntity)
                content.add(leftThumbTipModelEntity)
                content.add(leftIndexFingerMetacarpalModelEntity)
                content.add(leftIndexFingerKnuckleModelEntity)
                content.add(leftIndexFingerIntermediateBaseModelEntity)
                content.add(leftIndexFingerIntermediateTipModelEntity)
                content.add(leftIndexFingerTipModelEntity)
                content.add(leftMiddleFingerMetacarpalModelEntity)
                content.add(leftMiddleFingerKnuckleModelEntity)
                content.add(leftMiddleFingerIntermediateBaseModelEntity)
                content.add(leftMiddleFingerIntermediateTipModelEntity)
                content.add(leftMiddleFingerTipModelEntity)
                content.add(leftRingFingerMetacarpalModelEntity)
                content.add(leftRingFingerKnuckleModelEntity)
                content.add(leftRingFingerIntermediateBaseModelEntity)
                content.add(leftRingFingerIntermediateTipModelEntity)
                content.add(leftRingFingerTipModelEntity)
                content.add(leftLittleFingerMetacarpalModelEntity)
                content.add(leftLittleFingerKnuckleModelEntity)
                content.add(leftLittleFingerIntermediateBaseModelEntity)
                content.add(leftLittleFingerIntermediateTipModelEntity)
                content.add(leftLittleFingerTipModelEntity)
                content.add(leftForearmWristModelEntity)
                content.add(leftForearmArmModelEntity)
                
                content.add(rightWristModelEntity)
                content.add(rightThumbKnuckleModelEntity)
                content.add(rightThumbIntermediateBaseModelEntity)
                content.add(rightThumbIntermediateTipModelEntity)
                content.add(rightThumbTipModelEntity)
                content.add(rightIndexFingerMetacarpalModelEntity)
                content.add(rightIndexFingerKnuckleModelEntity)
                content.add(rightIndexFingerIntermediateBaseModelEntity)
                content.add(rightIndexFingerIntermediateTipModelEntity)
                content.add(rightIndexFingerTipModelEntity)
                content.add(rightMiddleFingerMetacarpalModelEntity)
                content.add(rightMiddleFingerKnuckleModelEntity)
                content.add(rightMiddleFingerIntermediateBaseModelEntity)
                content.add(rightMiddleFingerIntermediateTipModelEntity)
                content.add(rightMiddleFingerTipModelEntity)
                content.add(rightRingFingerMetacarpalModelEntity)
                content.add(rightRingFingerKnuckleModelEntity)
                content.add(rightRingFingerIntermediateBaseModelEntity)
                content.add(rightRingFingerIntermediateTipModelEntity)
                content.add(rightRingFingerTipModelEntity)
                content.add(rightLittleFingerMetacarpalModelEntity)
                content.add(rightLittleFingerKnuckleModelEntity)
                content.add(rightLittleFingerIntermediateBaseModelEntity)
                content.add(rightLittleFingerIntermediateTipModelEntity)
                content.add(rightLittleFingerTipModelEntity)
                content.add(rightForearmWristModelEntity)
                content.add(rightForearmArmModelEntity)
            } update: { content in
                computeTransformHeartTracking()
            }
        }.onAppear {
            handTracking()
        }
    }
    
    func handTracking() {
        if HandTrackingProvider.isSupported {
            Task {
                try await session.run([handTrackingProvider])
                for await update in handTrackingProvider.anchorUpdates {
                    switch update.event {
                    case .updated:
                        let anchor = update.anchor
                        guard anchor.isTracked else { continue }
                        if anchor.chirality == .left {
                            latestHandTracking.left = anchor
                        } else if anchor.chirality == .right {
                            latestHandTracking.right = anchor
                        }
                        default:
                            break
                    }
                }
            }
        }
    }
    
    func computeTransformHeartTracking() {
        guard let leftHandAnchor = latestHandTracking.left,
              let rightHandAnchor = latestHandTracking.right,
              leftHandAnchor.isTracked, rightHandAnchor.isTracked else {
            return
        }
        
        leftWristModelEntity.transform = getTransform(leftHandAnchor, .wrist, leftWristModelEntity.transform)
        leftThumbKnuckleModelEntity.transform = getTransform(leftHandAnchor, .thumbKnuckle, leftThumbKnuckleModelEntity.transform)
        leftThumbIntermediateBaseModelEntity.transform = getTransform(leftHandAnchor, .thumbIntermediateBase, leftThumbIntermediateBaseModelEntity.transform)
        leftThumbIntermediateTipModelEntity.transform = getTransform(leftHandAnchor, .thumbIntermediateTip, leftThumbIntermediateTipModelEntity.transform)
        leftThumbTipModelEntity.transform = getTransform(leftHandAnchor, .thumbTip, leftThumbTipModelEntity.transform)
        leftIndexFingerMetacarpalModelEntity.transform = getTransform(leftHandAnchor, .indexFingerMetacarpal, leftIndexFingerMetacarpalModelEntity.transform)
        leftIndexFingerKnuckleModelEntity.transform = getTransform(leftHandAnchor, .indexFingerKnuckle, leftMiddleFingerKnuckleModelEntity.transform)
        leftIndexFingerIntermediateBaseModelEntity.transform = getTransform(leftHandAnchor, .indexFingerIntermediateBase, leftIndexFingerIntermediateBaseModelEntity.transform)
        leftIndexFingerIntermediateTipModelEntity.transform = getTransform(leftHandAnchor, .indexFingerIntermediateTip, leftIndexFingerIntermediateTipModelEntity.transform)
        leftIndexFingerTipModelEntity.transform = getTransform(leftHandAnchor, .indexFingerTip, leftIndexFingerTipModelEntity.transform)
        leftMiddleFingerMetacarpalModelEntity.transform = getTransform(leftHandAnchor, .middleFingerMetacarpal, leftMiddleFingerMetacarpalModelEntity.transform)
        leftMiddleFingerKnuckleModelEntity.transform = getTransform(leftHandAnchor, .middleFingerKnuckle,leftMiddleFingerKnuckleModelEntity.transform)
        leftMiddleFingerIntermediateBaseModelEntity.transform = getTransform(leftHandAnchor, .middleFingerIntermediateBase,leftMiddleFingerIntermediateBaseModelEntity.transform)
        leftMiddleFingerIntermediateTipModelEntity.transform = getTransform(leftHandAnchor, .middleFingerIntermediateTip,leftMiddleFingerIntermediateTipModelEntity.transform)
        leftMiddleFingerTipModelEntity.transform = getTransform(leftHandAnchor, .middleFingerTip,leftMiddleFingerTipModelEntity.transform)
        leftRingFingerMetacarpalModelEntity.transform = getTransform(leftHandAnchor, .ringFingerMetacarpal,leftRingFingerMetacarpalModelEntity.transform)
        leftRingFingerKnuckleModelEntity.transform = getTransform(leftHandAnchor, .ringFingerKnuckle,leftRingFingerKnuckleModelEntity.transform)
        leftRingFingerIntermediateBaseModelEntity.transform = getTransform(leftHandAnchor, .ringFingerIntermediateBase,leftRingFingerIntermediateBaseModelEntity.transform)
        leftRingFingerIntermediateTipModelEntity.transform = getTransform(leftHandAnchor, .ringFingerIntermediateTip,leftRingFingerIntermediateTipModelEntity.transform)
        leftRingFingerTipModelEntity.transform = getTransform(leftHandAnchor, .ringFingerTip,leftRingFingerTipModelEntity.transform)
        leftLittleFingerMetacarpalModelEntity.transform = getTransform(leftHandAnchor, .littleFingerMetacarpal,leftLittleFingerMetacarpalModelEntity.transform)
        leftLittleFingerKnuckleModelEntity.transform = getTransform(leftHandAnchor, .littleFingerKnuckle,leftLittleFingerKnuckleModelEntity.transform)
        leftLittleFingerIntermediateBaseModelEntity.transform = getTransform(leftHandAnchor, .littleFingerIntermediateBase, leftLittleFingerIntermediateBaseModelEntity.transform)
        leftLittleFingerIntermediateTipModelEntity.transform = getTransform(leftHandAnchor, .littleFingerIntermediateTip,leftLittleFingerIntermediateTipModelEntity.transform)
        leftLittleFingerTipModelEntity.transform = getTransform(leftHandAnchor, .littleFingerTip,leftLittleFingerTipModelEntity.transform)
        leftForearmWristModelEntity.transform = getTransform(leftHandAnchor, .forearmWrist,leftForearmWristModelEntity.transform)
        leftForearmArmModelEntity.transform = getTransform(leftHandAnchor, .forearmArm,leftForearmArmModelEntity.transform)
        
        rightWristModelEntity.transform = getTransform(rightHandAnchor, .wrist,rightWristModelEntity.transform)
        rightThumbKnuckleModelEntity.transform = getTransform(rightHandAnchor, .thumbKnuckle,rightThumbKnuckleModelEntity.transform)
        rightThumbIntermediateBaseModelEntity.transform = getTransform(rightHandAnchor, .thumbIntermediateBase,rightThumbIntermediateBaseModelEntity.transform)
        rightThumbIntermediateTipModelEntity.transform = getTransform(rightHandAnchor, .thumbIntermediateTip,rightThumbIntermediateTipModelEntity.transform)
        rightThumbTipModelEntity.transform = getTransform(rightHandAnchor, .thumbTip,rightThumbTipModelEntity.transform)
        rightIndexFingerMetacarpalModelEntity.transform = getTransform(rightHandAnchor, .indexFingerMetacarpal,rightIndexFingerMetacarpalModelEntity.transform)
        rightIndexFingerKnuckleModelEntity.transform = getTransform(rightHandAnchor, .indexFingerKnuckle,rightIndexFingerKnuckleModelEntity.transform)
        rightIndexFingerIntermediateBaseModelEntity.transform = getTransform(rightHandAnchor, .indexFingerIntermediateBase,rightIndexFingerIntermediateBaseModelEntity.transform)
        rightIndexFingerIntermediateTipModelEntity.transform = getTransform(rightHandAnchor, .indexFingerIntermediateTip,rightIndexFingerIntermediateTipModelEntity.transform)
        rightIndexFingerTipModelEntity.transform = getTransform(rightHandAnchor, .indexFingerTip,rightIndexFingerTipModelEntity.transform)
        rightMiddleFingerMetacarpalModelEntity.transform = getTransform(rightHandAnchor, .middleFingerMetacarpal,rightMiddleFingerMetacarpalModelEntity.transform)
        rightMiddleFingerKnuckleModelEntity.transform = getTransform(rightHandAnchor, .middleFingerKnuckle,rightMiddleFingerKnuckleModelEntity.transform)
        rightMiddleFingerIntermediateBaseModelEntity.transform = getTransform(rightHandAnchor, .middleFingerIntermediateBase,rightMiddleFingerIntermediateBaseModelEntity.transform)
        rightMiddleFingerIntermediateTipModelEntity.transform = getTransform(rightHandAnchor, .middleFingerIntermediateTip, rightMiddleFingerIntermediateTipModelEntity.transform)
        rightMiddleFingerTipModelEntity.transform = getTransform(rightHandAnchor, .middleFingerTip,rightMiddleFingerTipModelEntity.transform)
        rightRingFingerMetacarpalModelEntity.transform = getTransform(rightHandAnchor, .ringFingerMetacarpal,rightRingFingerMetacarpalModelEntity.transform)
        rightRingFingerKnuckleModelEntity.transform = getTransform(rightHandAnchor, .ringFingerKnuckle,rightRingFingerKnuckleModelEntity.transform)
        rightRingFingerIntermediateBaseModelEntity.transform = getTransform(rightHandAnchor, .ringFingerIntermediateBase,rightRingFingerIntermediateBaseModelEntity.transform)
        rightRingFingerIntermediateTipModelEntity.transform = getTransform(rightHandAnchor, .ringFingerIntermediateTip, rightRingFingerIntermediateTipModelEntity.transform)
        rightRingFingerTipModelEntity.transform = getTransform(rightHandAnchor, .ringFingerTip,rightRingFingerTipModelEntity.transform)
        rightLittleFingerMetacarpalModelEntity.transform = getTransform(rightHandAnchor, .littleFingerMetacarpal,rightLittleFingerMetacarpalModelEntity.transform)
        rightLittleFingerKnuckleModelEntity.transform = getTransform(rightHandAnchor, .littleFingerKnuckle, rightLittleFingerKnuckleModelEntity.transform)
        rightLittleFingerIntermediateBaseModelEntity.transform = getTransform(rightHandAnchor, .littleFingerIntermediateBase, rightLittleFingerIntermediateBaseModelEntity.transform)
        rightLittleFingerIntermediateTipModelEntity.transform = getTransform(rightHandAnchor, .littleFingerIntermediateTip, rightLittleFingerIntermediateTipModelEntity.transform)
        rightLittleFingerTipModelEntity.transform = getTransform(rightHandAnchor, .littleFingerTip, rightLittleFingerTipModelEntity.transform)
        rightForearmWristModelEntity.transform = getTransform(rightHandAnchor, .forearmWrist, rightForearmWristModelEntity.transform)
        rightForearmArmModelEntity.transform = getTransform(rightHandAnchor, .forearmArm, rightForearmArmModelEntity.transform)
    }
    
    func getTransform(_ anchor: HandAnchor, _ jointName: HandSkeleton.JointName, _ beforeTransform: Transform) -> Transform {
        let joint = anchor.handSkeleton?.joint(jointName)
        if ((joint?.isTracked) != nil) {
            let t = matrix_multiply(anchor.originFromAnchorTransform, (anchor.handSkeleton?.joint(jointName).anchorFromJointTransform)!)
            return Transform(matrix: t)
        }
        return beforeTransform
    }
}
