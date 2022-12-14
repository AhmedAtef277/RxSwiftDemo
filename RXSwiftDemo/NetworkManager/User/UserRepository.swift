//
//  UserRepository.swift
//  RXSwiftDemo
//
//  Created by mac on 14/12/2022.
//

import Foundation
class UserRepository : UserRepositoryProtocol{
    func getUserName(completion : @escaping ((User? , Error?)->Void)){
        NetworkManager.shared.createRequest(url: Constants.baseUrl + Constants.users, method: .get, completion: completion)
    }
    
    
    
}
