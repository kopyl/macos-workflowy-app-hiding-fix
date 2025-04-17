import Cocoa

NSWorkspace.shared.notificationCenter.addObserver(
    forName: NSWorkspace.didDeactivateApplicationNotification,
    object: nil,
    queue: .main
) { notification in
    guard let app = notification.userInfo?[NSWorkspace.applicationUserInfoKey] as? NSRunningApplication else {
        return
    }
    
    guard app.bundleIdentifier == "com.workflowy.desktop" else {
        return
    }
    
    app.hide()
}

NSApplication.shared.run()
