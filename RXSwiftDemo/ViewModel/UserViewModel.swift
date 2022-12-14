//
//  UserViewModel.swift
//  RXSwiftDemo
//
//  Created by mac on 05/12/2022.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa
import ProgressHUD

class UserViewModel{
    var userData : PublishSubject<[UserDetails]> = PublishSubject<[UserDetails]>()
    var loader = BehaviorRelay<Bool>(value :true)
    var disposeBag = DisposeBag()
    private let userRepo = UserRepository()
    func fetchDetails(){
        loader.accept(true)
        userRepo.getUserName{ [weak self] user, error in
            guard let self = self else {return}
            self.loader.accept (false)
            self.userData.onNext(user?.data ?? [])
        }
    }
    
    
    
    
    
    
    
    
    
}
