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
    
    // Main Scroll Area
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var scrollContainerView: UIView! {
        didSet {
            scrollContainerView.backgroundColor = .white
        }
    }
    @IBOutlet weak var eventBanner: UIImageView! {
        didSet {
            eventBanner.image = UIImage(named: "event")?.withAlignmentRectInsets(UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0))
            eventBanner.layer.cornerRadius = 10
            eventBanner.layer.borderWidth = 1
            eventBanner.layer.borderColor = UIColor.mainColor.cgColor
        }
    }
    @IBOutlet weak var middleContainerView1: UIView!
    @IBOutlet weak var middleContainerView2: UIView!
    @IBOutlet weak var middleContainerView3: UIView!
    @IBOutlet weak var middleImageView1: UIImageView! {
        didSet {
            middleImageView1.image = UIImage(named: "middle_1")
            middleImageView1.applyshadowWithCorner(
                containerView: middleContainerView1,
                cornerRadius: 10,
                shadowOpacity: 0.5,
                shadowRadius: 5
            )
        }
    }
    @IBOutlet weak var middleImageView2: UIImageView! {
        didSet {
            middleImageView2.image = UIImage(named: "middle_2")
            middleImageView2.layer.cornerRadius = 10
            middleImageView2.applyshadowWithCorner(
                containerView: middleContainerView2,
                cornerRadius: 10,
                shadowOpacity: 0.5,
                shadowRadius: 5
            )
        }
    }
    @IBOutlet weak var middleImageView3: UIImageView! {
        didSet {
            middleImageView3.image = UIImage(named: "middle_3")
            middleImageView3.layer.cornerRadius = 10
            middleImageView3.applyshadowWithCorner(
                containerView: middleContainerView3,
                cornerRadius: 10,
                shadowOpacity: 0.5,
                shadowRadius: 5
            )
        }
    }
    
    @IBOutlet weak var categoryContentView: UIView! {
        didSet {
            categoryContentView.layer.cornerRadius = 20
            categoryContentView.layer.shadowOpacity = 0.5
            categoryContentView.layer.shadowColor = UIColor.lightGray.cgColor
            categoryContentView.layer.shadowOffset = .zero
            categoryContentView.layer.shadowRadius = 5
            categoryContentView.layer.masksToBounds = false
        }
    }
    @IBOutlet weak var categoryTitleImage: UIImageView! {
        didSet {
            categoryTitleImage.image = UIImage(named: "category_title")
            categoryTitleImage.contentMode = .scaleAspectFill
        }
    }
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    // Tab bar
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
    private let categoryCellImageData = [
        "menuCategory_01",
        "menuCategory_02",
        "menuCategory_03",
        "menuCategory_04",
        "menuCategory_05",
        "menuCategory_06",
        "menuCategory_07",
        "menuCategory_08",
        "menuCategory_09",
        "menuCategory_10"
    ]
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerXib()
        
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
    }

    // MARK: - IBActions
    
    // MARK: - Functinos
    private func registerXib() {
        categoryCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.reuseIdentifier)
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryCellImageData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.reuseIdentifier, for: indexPath) as! CategoryCollectionViewCell
        cell.categoryimageView?.image = UIImage(named: categoryCellImageData[indexPath.row])
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 1
        
        return cell
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = CGSize(width: collectionView.frame.width / 5, height: 145 / 2)
        return size
        
        /*
        // banner
        else {
            // return CGSize(width: bannerCollectionView.frame.size.width, height:  bannerCollectionView.frame.height)
        }
         */
    }
}
