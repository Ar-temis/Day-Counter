import SwiftUI
import AppKit

@main
struct DaysSinceApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        Settings {
            EmptyView() // No settings window needed
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem?
    let targetDate = Date(timeIntervalSince1970: 1723363200)
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        updateMenuBarTitle()
        
        Timer.scheduledTimer(withTimeInterval: 3600, repeats: true) { _ in
            self.updateMenuBarTitle()
        }
    }
    
    func updateMenuBarTitle() {
        let currentDate = Date()
        let daysSince = Int(targetDate.distance(to: currentDate) / 86400)
        statusItem?.button?.title = "♥\(daysSince)♥"
    }
}
