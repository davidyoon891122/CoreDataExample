//
//  Extension+UIView.swift
//  CoreDataProject
//
//  Created by jiwon Yoon on 2022/12/15.
//

import UIKit

extension UIView {
    func showToastMessage(message: String, font: UIFont) {
        let toastLabel = UILabel(frame: CGRect(
            x: self.frame.size.width / 2 - 115,
            y: self.frame.size.height - 200,
            width: 200.0,
            height: 40.0
        ))
        
        toastLabel.backgroundColor = .black.withAlphaComponent(0.6)
        toastLabel.textColor = .label
        toastLabel.font = font
        toastLabel.textAlignment = .center
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        toastLabel.text = message
        
        self.addSubview(toastLabel)
        
        UIView.animate(
            withDuration: 4.0,
            delay: 0.1,
            options: .curveEaseInOut,
            animations: {
                toastLabel.alpha = 0.0
            },
            completion: { _ in
                toastLabel.removeFromSuperview()
            }
        )
    }
}

