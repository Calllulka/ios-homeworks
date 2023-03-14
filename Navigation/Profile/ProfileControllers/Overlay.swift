//
//  Overlay.swift
//  TestOne
//
//  Created by Alexander on 10.03.2023.
//

import UIKit
import SnapKit

class OverlayView: UIView {
//    UIVisualEffectView(effect: UIBlurEffect(style: .extraLight))
    private let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .extraLight))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareView()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func prepareView(){
        addSubview(blurView)
    }
    
    private func makeConstraints() {
        blurView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
