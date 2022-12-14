//
//  NetworkManager.swift
//  RXSwiftDemo
//
//  Created by mac on 07/12/2022.
//

import Foundation
import Alamofire
import ProgressHUD


class NetworkManager  {
    
    private init(){}
    static let shared = NetworkManager()
    
    
    func createRequest<T:Codable>(url : String , method : HTTPMethod ,completion : @escaping(T?, Error?)->Void  , parameters : Parameters? = nil){
        print("url is " , url)
        AF.request(url , method : method , parameters: parameters , encoding : JSONEncoding.default).responseString { response in
            guard let data = response.data else{return}
            switch response.result{
            case .success:
                do{
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    print("Decoded data is \(decodedData)")
                    completion(decodedData,nil)
                }catch let error{
                    print(error)
                    completion(nil,error)
                }
            case .failure(let error):
                print(error)
                completion(nil,error)
            }
        }
        
        
    }
    
    
}
