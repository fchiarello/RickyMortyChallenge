//
//  ViewCodeProtocol.swift
//  RickyMortyChalenge
//
//  Created by Fellipe Ricciardi Chiarello on 8/22/21.
//

import Foundation

protocol ViewCodeProtocol: class {
    func viewCodeSetup()
    func viewCodeHierarchySetup()
    func viewCodeConstraintSetup()
    func viewCodeAditionalSetup()
}

extension ViewCodeProtocol {
    func viewCodeSetup() {
        viewCodeHierarchySetup()
        viewCodeConstraintSetup()
        viewCodeAditionalSetup()
    }
    
    func viewCodeHierarchySetup() {}
    
    func viewCodeConstraintSetup() {}
    
    func viewCodeAditionalSetup() {}
}
