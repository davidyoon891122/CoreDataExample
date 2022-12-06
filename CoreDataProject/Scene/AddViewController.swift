//
//  AddViewController.swift
//  CoreDataProject
//
//  Created by jiwon Yoon on 2022/12/07.
//

import UIKit
import SnapKit

final class AddViewController: UIViewController {
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = .systemFont(ofSize: 16.0, weight: .bold)
        label.textColor = .label
        
        return label
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Please write your name"
        textField.textColor = .label
        
        return textField
    }()
    
    private lazy var nameView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 8.0
        [
            nameLabel,
            nameTextField
        ]
            .forEach {
                view.addSubview($0)
            }
        
        let offset:CGFloat = 16.0
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(offset)
            $0.bottom.equalToSuperview()
        }
        
        nameLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        nameTextField.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(nameLabel.snp.trailing).offset(8.0)
            $0.bottom.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-offset)
        }
        
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

private extension AddViewController {
    func setupViews() {
        view.backgroundColor = .systemBackground
        [
            nameView
        ]
            .forEach {
                view.addSubview($0)
            }
        
        let offset: CGFloat = 16.0
        nameView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(64.0)
            $0.leading.equalToSuperview().offset(offset)
            $0.trailing.equalToSuperview().offset(-offset)
            $0.height.equalTo(50.0)
        }
    }
}
