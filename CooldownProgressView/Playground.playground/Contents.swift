//: Playground - noun: a place where people can play

import UIKit
import CooldownProgressView
import PlaygroundSupport

let view = CooldownProgressView(frame: CGRect(x: 0, y: 0, width: 320, height: 320))
PlaygroundPage.current.liveView = view

view.image = #imageLiteral(resourceName: "lena_std.png")
view.progress = 0.3
