//
//  AppDelegate.swift
//  Sample
//
//  Created by Yuriy Scherbanovskiy on 07.07.2023.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        NSDocumentController.shared.autosavingDelay = 1.0
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}
