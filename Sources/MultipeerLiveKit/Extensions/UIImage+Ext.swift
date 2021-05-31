//
//  Image+Ext.swift
//  MultiPeerLiveKitDemo
//
//  Created by Jason Jobe on 5/30/21.
//  Copyright © 2021 Jason Jobe. All rights reserved.
//

import Foundation
#if os(iOS)
import UIKit
public typealias Image = UIImage
#elseif os(macOS)
import Cocoa
public typealias Image = NSImage
#endif

/*
 UIGraphicsBeginImageContext(CGSize(width: bitmap.width, height: bitmap.height))
 UIImage(cgImage: oldImage.cgImage, scale: 1, orientation: .leftMirrored).draw(at: .zero)
 let image = UIGraphicsGetImageFromCurrentImageContext()!
 */

extension Image {
    func rotate(radians: CGFloat) -> Image {
        let rotatedSize = CGRect(origin: .zero, size: size)
            .applying(CGAffineTransform(rotationAngle: CGFloat(radians)))
            .integral.size
        UIGraphicsBeginImageContext(rotatedSize)
        if let context = UIGraphicsGetCurrentContext() {
            let origin = CGPoint(x: rotatedSize.width / 2.0,
                                 y: rotatedSize.height / 2.0)
            context.translateBy(x: origin.x, y: origin.y)
            context.rotate(by: radians)
            draw(in: CGRect(x: -origin.y, y: -origin.x,
                            width: size.width, height: size.height))
            let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return rotatedImage ?? self
        }
        
        return self
    }
}
