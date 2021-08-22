//
//  MainViewController.swift
//  RickyMortyChalenge
//
//  Created by Fellipe Ricciardi Chiarello on 8/22/21.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    lazy var charactersLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var characterCollectionView: UICollectionView = {
        let collectionView = UICollectionView()
        return collectionView
    }()
    
    override func viewDidLoad() {
        
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func setupCollectionView() {
        self.characterCollectionView.register(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: CharacterCollectionViewCell.cellid)
        
        self.characterCollectionView.delegate = self
        self.characterCollectionView.dataSource = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = characterCollectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.cellid, for: indexPath) as! CharacterCollectionViewCell
            return cell
    }
}

extension MainViewController: ViewCodeProtocol {
    
}


