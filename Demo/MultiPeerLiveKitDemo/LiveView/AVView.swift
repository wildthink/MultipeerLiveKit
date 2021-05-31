//
//  AVView.swift
//  MultiPeerLiveKitDemo
//
//  Created by Jason Jobe on 5/30/21.
//  Copyright © 2021 Takashi Miyazaki. All rights reserved.
//

import UIKit
import AVFoundation

class AVView: UIView {

    var image: UIImage? {
        didSet {
            updateView()
        }
    }
    
    var player: AVPlayer? {
        get {
            return playerLayer.player
        }
        set {
            playerLayer.player = newValue
        }
    }
    
    func updateView() {
        playerLayer.contents = image?.cgImage
    }
    var playerLayer: AVPlayerLayer {
        return layer as! AVPlayerLayer
    }
    
    // Override UIView property
    override static var layerClass: AnyClass {
        return AVPlayerLayer.self
    }

}
