//
//  ViewFinder.swift
//  SampleBlinkIDScanner
//
//  Created by Cahyanto Setya Budi on 31/05/20.
//  Copyright © 2020 Cahyanto Setya Budi. All rights reserved.
//

import UIKit

class ViewFinder: UIView {

    @IBOutlet var bottomScanLineConstraint: NSLayoutConstraint!
    @IBOutlet var topScanLineConstraint: NSLayoutConstraint!
    
    @IBOutlet var flipView: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.commonInit()
    }
    
    private func commonInit() {
        let contentView = Bundle.main.loadNibNamed("ViewFinder", owner: self, options: nil)?.first as! UIView
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func startScanLineAnimation() {
        topScanLineConstraint.isActive = false
        _animateScanLineFromBottomToTop()
    }
    
    func startFlipAnimation() {
        _animateFlipViewShow()
    }
    
    private func _animateScanLineFromTopToBottom() {
        UIView.animate(withDuration: TimeInterval(bounds.size.height / 175), delay: 0.0, options: .curveEaseInOut, animations: { [weak self] in
            guard let self = self else { return }
            self.topScanLineConstraint.isActive = false
            self.bottomScanLineConstraint.isActive = true
            self.layoutIfNeeded()
        }) { [weak self] _ in
            guard let self = self else { return }
            self._animateScanLineFromBottomToTop()
        }
    }

    private func _animateScanLineFromBottomToTop() {
        UIView.animate(withDuration: TimeInterval(bounds.size.height / 175), delay: 0.0, options: .curveEaseInOut, animations: { [weak self] in
            guard let self = self else { return }
            self.bottomScanLineConstraint.isActive = false
            self.topScanLineConstraint.isActive = true
            self.layoutIfNeeded()
        }) { [weak self] _ in
            guard let self = self else { return }
            self._animateScanLineFromTopToBottom()
        }
    }
    
    private func _animateFlipViewShow() {
//        _scanLine.isHidden = true
//        _flipView.isHidden = false
        flipView.alpha = 0.0
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
            self.flipView.alpha = 0.8
        }, completion: { _ in
          self._animateFlip()
        })

    }

    private func _animateFlip() {
        UIView.transition(with: flipView, duration: 1.0, options: .transitionFlipFromLeft, animations: nil) { _ in
            self._animateFlipViewHide()
        }
    }

    private func _animateFlipViewHide() {
        flipView.alpha = 0.8
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
            self.flipView.alpha = 0.0
        }, completion: { _ in
//            self.flipView.isHidden = true
//            self._scanLine.isHidden = false
        })

    }
}
