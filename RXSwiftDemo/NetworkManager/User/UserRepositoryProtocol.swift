//
//  UserRepositoryProtocol.swift
//  RXSwiftDemo
//
//  Created by mac on 14/12/2022.
//

import Foundation
protocol UserRepositoryProtocol{
    func getUserName(completion : @escaping ((User? , Error?)->Void))
    
}
