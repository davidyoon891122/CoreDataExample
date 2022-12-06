//
//  InputView.swift
//  CoreDataProject
//
//  Created by jiwon Yoon on 2022/12/07.
//

import UIKit
import SnapKit

final class InputView: UIView {
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = .systemFont(ofSize: 14.0, weight: .bold)
        label.textColor = .label
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Please write your name"
        textField.textColor = .label
        
        return textField
    }()
    
    init(titleName: String, placeHolderText: String) {
        super.init(frame: .zero)
        nameLabel.text = titleName
        nameTextField.placeholder = placeHolderText
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension InputView {
    func setupViews() {
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 8.0
        [
            nameLabel,
            nameTextField
        ]
            .forEach {
                addSubview($0)
            }
        
        let offset:CGFloat = 16.0
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(offset)
            $0.bottom.equalToSuperview()
            $0.width.equalTo(100.0)
        }
        
        nameLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        nameTextField.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(nameLabel.snp.trailing).offset(8.0)
            $0.bottom.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-offset)
        }
    }
}
