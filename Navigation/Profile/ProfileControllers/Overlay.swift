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
    
    private var avatarImageView: UIImageView = {
        var imageView = UIImageView(image: UIImage(named: "avatarImageView"))
        imageView.layer.borderWidth = 3.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 55
        imageView.clipsToBounds = true
        return imageView
    }()
    
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
//        blurView.addSubview(avatarImageView)
    }
    
    private func makeConstraints() {
        blurView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
//        avatarImageView.snp.makeConstraints {
//            $0.top.equalToSuperview().inset(16)
//            $0.leading.equalToSuperview().inset(16)
//            $0.height.equalTo(110)
//            $0.width.equalTo(110)
//        }
    }
}
