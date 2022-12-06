//
//  AddViewController.swift
//  CoreDataProject
//
//  Created by jiwon Yoon on 2022/12/07.
//

import UIKit
import SnapKit

final class AddViewController: UIViewController {
    private lazy var nameInputView = InputView(titleName: "Name", placeHolderText: "Please write your name")
    
    private lazy var phoneNumberInputView = InputView(titleName: "PhoneNumber", placeHolderText: "Please write your PhoneNumber")
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Confirm", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.setTitleColor(.gray.withAlphaComponent(0.3), for: .highlighted)
        
        var config = UIButton.Configuration.plain()
        config.titlePadding = 8.0
        
        button.configuration = config
        
        button.addTarget(
            self,
            action: #selector(didTapAddButton),
            for: .touchUpInside
        )
        
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 8.0
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func touchesBegan(
        _ touches: Set<UITouch>,
        with event: UIEvent?
    ) {
        view.endEditing(true)
    }
}

private extension AddViewController {
    func setupViews() {
        view.backgroundColor = .systemBackground
        [
            nameInputView,
            phoneNumberInputView,
            addButton
        ]
            .forEach {
                view.addSubview($0)
            }
        
        let offset: CGFloat = 16.0
        
        nameInputView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(64.0)
            $0.leading.equalToSuperview().offset(offset)
            $0.trailing.equalToSuperview().offset(-offset)
            $0.height.equalTo(50.0)
        }
        
        phoneNumberInputView.snp.makeConstraints {
            $0.top.equalTo(nameInputView.snp.bottom).offset(offset)
            $0.leading.equalToSuperview().offset(offset)
            $0.trailing.equalToSuperview().offset(-offset)
            $0.height.equalTo(50.0)
        }
        
        addButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-offset * 2)
            $0.leading.equalToSuperview().offset(offset * 2)
            $0.trailing.equalToSuperview().offset(-offset * 2)
            $0.height.equalTo(50.0)
        }
    }
    
    @objc
    func didTapAddButton() {
        print("didTapAddButton")
    }
}
