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
        label.text = "TESTE"
        label.font = UIFont.systemFont(ofSize: 22)
        label.tintColor = .black
        label.backgroundColor = .green
        return label
    }()
    
    lazy var characterCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .none
        collectionView.translatesAutoresizingMaskIntoConstraints = true
        return collectionView
    }()
    
    var viewModel: MainViewModel?
    
    override func viewDidLoad() {
        self.viewModel = MainViewModel()
        viewCodeSetup()
        setupCollectionView()
        viewModel?.delegate = self
        viewModel?.fetchCollection()
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func setupCollectionView() {
        self.characterCollectionView.register(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: CharacterCollectionViewCell.cellid)
        
        self.characterCollectionView.delegate = self
        self.characterCollectionView.dataSource = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.charactersList.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = characterCollectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.cellid, for: indexPath) as! CharacterCollectionViewCell
        if let data = viewModel?.charactersList[indexPath.item]{
            cell.setupCell(model: data)
            characterCollectionView.showsHorizontalScrollIndicator = true
        }
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let data = viewModel?.charactersList[indexPath.item]{
            print("item at \(indexPath.section)/\(indexPath.item) tapped / \(String(describing: data.name))")
            let vc = DetailViewController()
            vc.viewModel = data
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension MainViewController: ViewCodeProtocol {
    func viewCodeHierarchySetup() {
        view.addSubview(charactersLabel)
        view.addSubview(characterCollectionView)
    }
    
    func viewCodeConstraintSetup() {
        charactersLabel.snp.makeConstraints { (mkr) in
            mkr.height.equalTo(50)
            mkr.width.equalToSuperview().inset(32)
            mkr.centerX.equalToSuperview()
            mkr.top.equalToSuperview().offset(120)
        }
        
        characterCollectionView.snp.makeConstraints { (mkr) in
            mkr.height.equalTo(150)
            mkr.width.equalToSuperview()
            mkr.top.equalTo(charactersLabel.snp.bottom).offset(32)
        }
    }
    
    func viewCodeAditionalSetup() {
        view.backgroundColor = .white
    }
}

extension MainViewController: MainViewModelDelegate {
    func successList() {
        DispatchQueue.main.async {
            self.characterCollectionView.reloadData()
        }
    }
    
    func errorList(error: String) {
        DispatchQueue.main.async {
            self.characterCollectionView.reloadData()
        }
    }
}


