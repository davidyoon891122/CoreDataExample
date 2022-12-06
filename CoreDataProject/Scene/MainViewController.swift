//
//  MainViewController.swift
//  CoreDataProject
//
//  Created by jiwon Yoon on 2022/12/05.
//

import UIKit
import SnapKit
import CoreData

class MainViewController: UIViewController {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "CoreData"
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(
            ProfileCollectionViewCell.self,
            forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier
        )
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    private lazy var createButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 4.0
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1.0
        
        var config = UIButton.Configuration.plain()
        config.titlePadding = 8.0
        
        button.configuration = config
        
        button.setTitle(
            "Create",
            for: .normal
        )
        
        button.setTitleColor(.label, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        
        button.addTarget(
            self,
            action: #selector(addPersonContact),
            for: .touchUpInside
        )
        
        return button
    }()
    
    private var contacts: [Contact] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchContact()
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return contacts.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ProfileCollectionViewCell.identifier,
            for: indexPath
        ) as? ProfileCollectionViewCell else { return UICollectionViewCell() }
        
        let contact = contacts[indexPath.row]
    
        cell.setupCell(contact: contact)
        
        return cell
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 82.0)
    }
}

private extension MainViewController {
    func setupViews() {
        [
            titleLabel,
            createButton,
            collectionView
        ]
            .forEach {
                view.addSubview($0)
            }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(createButton.snp.leading).offset(-16.0)
            $0.height.equalTo(35.0)
        }
        
        createButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalToSuperview().offset(-16.0)
            $0.height.equalTo(35.0)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16.0)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    @objc
    func addPersonContact() {
        let addViewController = AddViewController()
        present(addViewController, animated: true)
    }
    
    func fetchContact() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let content = appDelegate.persistentContainer.viewContext
        
        do {
            contacts = try content.fetch(Contact.fetchRequest()) as! [Contact]
            contacts.forEach {
                print($0.name ?? "")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
