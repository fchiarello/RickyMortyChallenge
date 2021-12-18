//
//  MainViewModel.swift
//  RickyMortyChalenge
//
//  Created by Fellipe Ricciardi Chiarello on 8/22/21.
//

import Foundation
import UIKit

protocol MainViewModelProtocol: AnyObject {
    func fetchCollection()
}

protocol MainViewModelDelegate {
    func successList()
    func errorList(error: String)
}

class MainViewModel: MainViewModelProtocol {
    var delegate: MainViewModelDelegate?
    var charactersList: [ResultCharacterModel] = []
    
    func fetchCollection() {
        Service.loadCharacters(url: Constants.characterListUrl) { (list) in
            self.charactersList += list.results ?? []
            self.delegate?.successList()
        } onError: { (error) in
            self.delegate?.errorList(error: String(describing: error))
        }
    }
    
    func setupCharacterImage(url: ResultCharacterModel, characterView: UIImageView, characterLabel: UILabel) {
        if let image = url.image {
            do {
                let path = try Data(contentsOf: URL(string: image)!)
                characterView.image = UIImage(data: path)
                characterView.layer.cornerRadius = 10
                characterView.layer.masksToBounds = false
                characterView.clipsToBounds = true
                characterView.contentMode = .scaleAspectFill
            } catch {
                print(error)
            }
        }
        setupLabel(text: url.name ?? String(), label: characterLabel)
    }
    
    func setupLabel(text: String, label: UILabel) {
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .darkGray
        label.text = text
    }
    
}
