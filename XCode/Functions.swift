//
//  Functions.swift
//  WindowHelper
//
//  Created by Tim Stephansen on 10/4/23.
//  Makes MacCatalyst Windows Transparent

import Foundation
import SwiftUI
import Dynamic

private func makeAllWindowsTransparent() {
    let windows = Dynamic.NSApplication.sharedApplication.windows.asArray ?? []
    for window in windows {
        (window as! NSWindow).backgroundColor = NSColor(red: 1.0, green:0.5, blue:0.5, alpha: 0.0001)
    }
}

private func makeSingleWindowTransparent(_ index: Int) {
    let windows = Dynamic.NSApplication.sharedApplication.windows.asArray ?? [NSWindow]() as NSArray
    (windows[index] as! NSWindow).backgroundColor = NSColor(red: 1.0, green:0.5, blue:0.5, alpha: 0.0001)
}

@_cdecl("makeWindowsTransparent")
public func makeWindowsTransparent() {
    makeAllWindowsTransparent();
}

@_cdecl("makeWindowTransparent")
public func makeWindowTransparent(index: Int) {
    makeSingleWindowTransparent(index)
}
