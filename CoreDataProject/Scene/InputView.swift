//
//  InputView.swift
//  CoreDataProject
//
//  Created by jiwon Yoon on 2022/12/07.
//

import UIKit
import SnapKit

final class InputView: UIView {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = .systemFont(ofSize: 14.0, weight: .bold)
        label.textColor = .label
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var contentTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Please write your name"
        textField.textColor = .label
        
        return textField
    }()
    
    init(titleName: String, placeHolderText: String) {
        super.init(frame: .zero)
        titleLabel.text = titleName
        contentTextField.placeholder = placeHolderText
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getTextFromLabel() -> String? {
        guard let name = contentTextField.text else { return nil }
        return name
    }
}

private extension InputView {
    func setupViews() {
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 8.0
        [
            titleLabel,
            contentTextField
        ]
            .forEach {
                addSubview($0)
            }
        
        let offset:CGFloat = 16.0
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(offset)
            $0.bottom.equalToSuperview()
            $0.width.equalTo(100.0)
        }
        
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        contentTextField.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(titleLabel.snp.trailing).offset(8.0)
            $0.bottom.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-offset)
        }
    }
}
