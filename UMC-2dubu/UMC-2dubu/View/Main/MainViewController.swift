//
//  MainViewController.swift
//  UMC-2dubu
//
//  Created by 이건우 on 4/9/24.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var safeAreaView: UIView! {
        didSet {
            safeAreaView.backgroundColor = .mainColor
        }
    }
    @IBOutlet weak var topView: UIView! {
        didSet {
            topView.backgroundColor = .mainColor
            topView.roundCorners(cornerRadius: 20, maskedCorners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
        }
    }
    
    @IBOutlet weak var currentLocationLabel: UILabel! {
        didSet {
            currentLocationLabel.textColor = .white
            currentLocationLabel.font = .systemFont(ofSize: 20, weight: .bold)
        }
    }
    @IBOutlet weak var navigationItem1: UIImageView! {
        didSet {
            navigationItem1.image = UIImage(named: "top_menu")
        }
    }
    @IBOutlet weak var navigationItem2: UIImageView! {
        didSet {
            navigationItem2.image = UIImage(named: "top_bell")
        }
    }
    @IBOutlet weak var navigationItem3: UIImageView! {
        didSet {
            navigationItem3.image = UIImage(named: "top_shoppingBasket")
        }
    }
    
    @IBOutlet weak var searchIcon: UIImageView! {
        didSet {
            searchIcon.tintColor = .mainColor
            searchIcon.image = UIImage(systemName: "magnifyingglass")
        }
    }
    @IBOutlet weak var searchPlaceholder: UILabel! {
        didSet {
            searchPlaceholder.text = "까르보나라 나와라 뚝딱!!"
            searchPlaceholder.textColor = .placeholderText
        }
    }
    @IBOutlet weak var searchButton: UIButton! {
        didSet {
            searchButton.backgroundColor = .white
            searchButton.layer.cornerRadius = 2
            searchButton.layer.shadowColor = UIColor.gray.cgColor
            searchButton.layer.shadowOpacity = 1.0
            searchButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        }
    }
    
    @IBOutlet weak var tabBarContainerView: UIView! {
        didSet {
            tabBarContainerView.layer.shadowColor = UIColor.gray.cgColor
            tabBarContainerView.layer.cornerRadius = 20
            tabBarContainerView.layer.shadowOpacity = 0.5
            tabBarContainerView.layer.shadowOffset = CGSize(width: 0, height: -1)
        }
    }
    @IBOutlet weak var tabBarView: UIView! {
        didSet {
            tabBarView.backgroundColor = .white
            tabBarView.roundCorners(cornerRadius: 20, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        }
    }
    
    // MARK: - Variables
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
    }

    // MARK: - IBActions
    
    // MARK: - Functinos
    func initViews() {
        
    }
}

