import SwiftUI

@inline(__always)
func isSolariumUI() -> Bool {
    if #available(iOS 19.0, *) { return true }
    return false
}

extension FileManager {
    func createDirIfNeeded(at url: URL) throws {
        if !fileExists(atPath: url.path) {
            try? createDirectory(at: url, withIntermediateDirectories: true)
        }
    }
}

extension String: @retroactive Error {}

extension ButtonRole {
    static var adaptiveConfirm: ButtonRole? {
        if #available(iOS 19.0, *) { return .confirm }
        return nil
    }
}
