//
//  CharacterCollectionViewCell.swift
//  RickyMortyChalenge
//
//  Created by Fellipe Ricciardi Chiarello on 8/22/21.
//

import UIKit
import SnapKit

class CharacterCollectionViewCell: UICollectionViewCell {
    lazy var imageView: UIImageView = {
        let iv = UIImageView(frame: contentView.frame)
        iv.layer.cornerRadius = self.frame.size.height / 2
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    } ()
    
    lazy var labelView: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.tintColor = .black
        label.contentMode = .center
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var mainView: UIView = {
        return UIView()
    }()
    
    static let cellid = "CharacterCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewCodeSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(model: ResultCharacterModel) {
        if let imageString = model.image {
            do {
                let path = try Data(contentsOf: URL(string: imageString)!)
                self.imageView.image = UIImage(data: path)
                self.labelView.text = model.name
            } catch  {
                print(error)
                self.imageView.image = UIImage(named: Constants.error)
                self.imageView.alpha = 0.5            }
        }
        self.labelView.text = model.name
    }
}

extension CharacterCollectionViewCell: ViewCodeProtocol {
    func viewCodeHierarchySetup() {
        self.contentView.addSubview(mainView)
        self.mainView.addSubview(imageView)
        self.mainView.addSubview(labelView)
    }
    
    func viewCodeConstraintSetup() {
        contentView.snp.makeConstraints { (mkr) in
            mkr.height.width.equalToSuperview()
        }
        
        mainView.snp.makeConstraints { (mkr) in
            mkr.width.height.equalToSuperview()
            mkr.center.equalToSuperview()
            mkr.top.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { (mkr) in
            mkr.top.equalToSuperview()
            mkr.width.equalToSuperview()
            mkr.height.width.equalTo(75)
        }
        
        labelView.snp.makeConstraints { (mkr) in
            mkr.height.equalTo(48)
            mkr.width.equalToSuperview().inset(8)
            mkr.centerX.equalToSuperview()
            mkr.top.equalTo(imageView.snp.bottom).offset(8)
        }
    }
    
    func viewCodeAditionalSetup() {
        self.contentView.layer.cornerRadius = 8
        self.mainView.layer.cornerRadius = 8
        self.imageView.layer.cornerRadius = 8
        self.labelView.backgroundColor = .green
    }
}
