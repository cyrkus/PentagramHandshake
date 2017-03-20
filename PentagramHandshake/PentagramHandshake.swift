//
//  PentagramHandshake.swift
//  PentagramHandshake
//
//  Created by Aaron Dean Bikis on 3/17/17.
//  Copyright © 2017 7apps. All rights reserved.
//

import UIKit

public protocol PentagramHandshakeDelegate: class {
    func didCompleteHandshake()
}

public final class PentagramHandshake: NSObject {
    
    public weak var delegate: PentagramHandshakeDelegate!
    
    private var pentaSquares: [CGRect]!
    
    private var completedPans = 0
    
    public var sixsixsix: CGRect!
    
    public var intialTaps = 6
    
    private var completedTaps = 0
    
    private var didCompleteHandshake = false {
        didSet {
            if didCompleteHandshake {
                delegate.didCompleteHandshake()
                reset()
            }
        }
    }
    
    private var panGesture: UIPanGestureRecognizer!
    
    private var tapGesture: UITapGestureRecognizer!
    
    public init(with delegate: PentagramHandshakeDelegate, satanicView: UIView, initializerTapLocation location: CGRect?, numberOfInitialTaps taps: Int?){
        super.init()
        self.sixsixsix =  location != nil ? location : CGRect(x: satanicView.frame.width/2 - 100/2, y: 0, width: 100, height: 100)
        self.intialTaps = taps != nil ? taps! : intialTaps
        self.delegate = delegate
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        satanicView.addGestureRecognizer(tapGesture)
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        satanicView.addGestureRecognizer(panGesture)
        setupPentagram(in: satanicView)
    }
    
    private func setupPentagram(in view: UIView){
        let width: CGFloat = 65.00
        let bottomLeft =  CGRect(x: 0, y: view.frame.height - width, width: width, height: width)
        let topMid = CGRect(x: (view.frame.width / 2) - (width / 2), y: 0, width: width, height: width)
        let bottomRight = CGRect(x: view.frame.width - width, y: view.frame.height - width, width: width, height: width)
        let midLeft = CGRect(x: 0, y: view.frame.height / 2 - width / 2, width: width, height: width)
        let midRight = CGRect(x: view.frame.width - width, y: view.frame.height/2 - width/2 , width: width, height: width)
        pentaSquares = [bottomLeft, topMid, bottomRight, midLeft, midRight, bottomLeft]
    }
    
    
    public func reset(){
        completedTaps = 0
        completedPans = 0
        didCompleteHandshake = false
    }
    
    public func fetchGestureRecongizersForRemoval() -> [UIGestureRecognizer] {
        return [tapGesture, panGesture]
    }
    
    
    //MARK: Gesture Recognizers
    internal func handleTap(_ tap: UITapGestureRecognizer){
        let location = tap.location(in: tap.view)
        if sixsixsix.contains(location) {
            completedTaps += 1
            print("hit tap")
        }
    }
    
    
    internal func handlePan(_ pan: UIPanGestureRecognizer){
        if completedTaps != intialTaps  {
            return
        }
        let translation = pan.location(in: pan.view)
        let currentSquare = pentaSquares[completedPans]
        if currentSquare.contains(translation) {
            if completedPans + 1 == pentaSquares.count {
                didCompleteHandshake = true
                completedPans = 0
                return
            }
            completedPans += 1
            print("hit pan at index \(completedPans)")
        }
    }
}
