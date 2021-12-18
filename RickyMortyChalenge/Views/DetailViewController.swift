//
//  DetailViewController.swift
//  RickyMortyChalenge
//
//  Created by Fellipe Ricciardi Chiarello on 8/22/21.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.tintColor = .black
        return label
    }()
    
    lazy var textField: UITextField = {
        let text = UITextField()
        return text
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitle("Voltar", for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(backToMainVC), for: .touchUpInside)
        return button
    }()
    
    var viewModel: ResultCharacterModel?
    
    override func viewDidLoad() {
        viewCodeSetup()
        setupView()
    }
    
    func setupView() {
        if let model = self.viewModel {
            if let imageString = model.image {
                do {
                    let path = try Data(contentsOf: URL(string: imageString)!)
                    self.imageView.image = UIImage(data: path)
                    self.nameLabel.text = viewModel?.name ?? "ERRO"
                    self.textField.text = viewModel?.gender ?? "ERRO"
                } catch  {
                    print(error)
                    self.imageView.image = UIImage(named: Constants.error)
                    self.imageView.alpha = 0.5            }
            }
        }
    }
}

extension DetailViewController: ViewCodeProtocol {
    func viewCodeHierarchySetup() {
        view.addSubview(imageView)
        view.addSubview(nameLabel)
        view.addSubview(textField)
        view.addSubview(backButton)
    }
    
    func viewCodeConstraintSetup() {
        imageView.snp.makeConstraints { (mkr) in
            mkr.height.equalTo(200)
            mkr.width.equalTo(200)
            mkr.centerX.equalToSuperview()
            mkr.top.equalToSuperview().offset(120)
        }
        
        nameLabel.snp.makeConstraints { (mkr) in
            mkr.height.equalTo(48)
            mkr.width.equalToSuperview()
            mkr.top.equalTo(imageView.snp.bottom).offset(16)
        }
        
        textField.snp.makeConstraints { (mkr) in
            mkr.top.equalTo(nameLabel.snp.bottom).offset(16)
            mkr.bottom.equalTo(backButton.snp.top).inset(8)
        }
        
        backButton.snp.makeConstraints { (mkr) in
            mkr.bottom.equalToSuperview().inset(32)
            mkr.height.equalTo(48)
            mkr.width.equalToSuperview().inset(32)
            mkr.centerX.equalToSuperview()
        }
    }
    
    func viewCodeAditionalSetup() {
        view.backgroundColor = .white
        imageView.layer.cornerRadius = imageView.frame.size.height / 2
    }
    
    @objc func backToMainVC () {
        self.navigationController?.popViewController(animated: true)
    }
}

