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
        iv.layer.cornerRadius = 10
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    } ()
    
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
}

extension CharacterCollectionViewCell: ViewCodeProtocol {
    
}
