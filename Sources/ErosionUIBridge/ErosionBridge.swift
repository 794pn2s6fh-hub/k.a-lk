import SwiftUI
import UIKit

@objc(ErosionBridge)
public final class ErosionBridge: NSObject {
    @MainActor
    @objc public static func makeViewController() -> UIViewController {
        let root = FMRootView()
            .environmentObject(ErosionManager.shared)
        return UIHostingController(rootView: root)
    }
}
