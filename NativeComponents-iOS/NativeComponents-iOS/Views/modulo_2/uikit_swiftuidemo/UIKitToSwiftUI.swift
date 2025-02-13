//
//  UIKitToSwiftUI.swift
//  NativeComponents-iOS
//

import SwiftUI
import UIKit

struct UIKitLabel: UIViewRepresentable {
    var text: String
    var textColor: UIColor
    var fontSize: CGFloat
    
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.textAlignment = .center
        return label
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = text
        uiView.textColor = textColor
        uiView.font = UIFont.systemFont(ofSize: fontSize)
    }
}

struct UIKitImage: UIViewRepresentable {
    var imageName: String
    
    func makeUIView(context: Context) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        return imageView
    }
    
    func updateUIView(_ uiView: UIImageView, context: Context) {
        uiView.image = UIImage(named: imageName)
    }
}
