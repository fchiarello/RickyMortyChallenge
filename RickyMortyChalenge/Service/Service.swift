//
//  Service.swift
//  RickyMortyChalenge
//
//  Created by Fellipe Ricciardi Chiarello on 8/22/21.
//

import Foundation

enum ErrorType {
    case urlError
    case responseError
    case jsonError
    case statusCodeError(code: Int)
    case taskError(error: Error)
}

class Service {
    static let session = URLSession.shared
    
    class func loadCharacters(url: String, onComplete: @escaping (CharacterModel) -> Void, onError: @escaping (ErrorType) -> Void) {
         guard let urlString = URL(string: url) else {
             onError(.urlError)
            return }
        let task = Service.session.dataTask(with: urlString) { (data, response, error) in
            if error == nil {
                guard let response = response as? HTTPURLResponse else {
                    onError(.responseError)
                    return }
                
                if response.statusCode == 200 {
                    guard let data = data else { return }
                    do {
                        let decoder = JSONDecoder()
                        let list = try decoder.decode(CharacterModel.self, from: data)
                        onComplete(list)
                    } catch let jsonErr as NSError {
                        onError(.jsonError)
                        print(jsonErr.localizedDescription)
                        print(jsonErr.debugDescription)
                    }
                } else {
                    onError(.statusCodeError(code: response.statusCode))
                    print(error ?? String())
                }
            } else {
                onError(.taskError(error: error!))
                print(error ?? String())
            }
        }
        task.resume()

    }
}
