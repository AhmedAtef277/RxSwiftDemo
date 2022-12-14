//
//  UserViewController.swift
//  RXSwiftDemo
//
//  Created by mac on 05/12/2022.
//

import UIKit
import RxCocoa
import RxSwift
import ProgressHUD

class UserViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet private weak var userTableView : UITableView!
    
    //MARK: - Vars
    private let viewModel : UserViewModel
    
    init(viewModel : UserViewModel = UserViewModel()){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getUsers()
        setupCellConfiguration()
        setupLoaderState()
       // print("Done ... ")
        
        
    }
    
    private func setupTableView(){
        userTableView.register(UINib(nibName: UserTableViewCell.idintefier, bundle: nil), forCellReuseIdentifier: UserTableViewCell.idintefier)
    }
    
    private func getUsers(){
        viewModel.fetchDetails()
    }
}
//MARK: - Rx Setup
extension UserViewController {
    func setupCellConfiguration(){
        self.viewModel.userData.bind(to : userTableView
                                            .rx.items(cellIdentifier: UserTableViewCell.idintefier, cellType:UserTableViewCell.self)){row,userData,cell in
            // guard let userData = userData else{return}
            cell.textLabel?.text = "\(userData.firstName ?? "" )  \(userData.lastName ?? "")"
        }
                                            .disposed(by:viewModel.disposeBag)
    }
    
    func setupLoaderState(){
        self.viewModel.loader.subscribe(onNext: {state in
            if state {
                ProgressHUD.show()
            }else{
                ProgressHUD.dismiss()
            }
            
        })
            .disposed(by: viewModel.disposeBag)
    }
    
    
}
