
import PlaygroundSupport
import Foundation
import UIKit

Bundle(path: "/System/Library/PrivateFrameworks/DrawingKit.framework")?.load()
let DKInkView = NSClassFromString("DKInkView") as! UIView.Type

extension UIView {
    func newGPUAvailable() -> Bool {
    return true
    }
}

func swizzleExtensionCheck()
{
    let origMethod = class_getClassMethod(DKInkView, NSSelectorFromString("gpuAvailable"))
    let newMethod = class_getInstanceMethod(DKInkView,NSSelectorFromString("newGPUAvailable"))
    
    method_exchangeImplementations(origMethod, newMethod)
}

swizzleExtensionCheck()
let view = DKInkView.init()
PlaygroundPage.current.liveView = view

