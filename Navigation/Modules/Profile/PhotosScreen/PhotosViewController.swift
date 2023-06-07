//
//  PhotosViewController.swift
//  TestOne
//
//  Created by Alexander on 07.03.2023.
//

import UIKit
import SnapKit
import iOSIntPackage

class PhotosViewController: UIViewController {

    //    MARK: - Property
    
    private var pokemonArray: [UIImage] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    private lazy var procaess = ImageProcessor()
    
    
    private lazy var collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        var collection = UICollectionView(frame: .zero,
                                          collectionViewLayout: viewLayout)
        collection.backgroundColor = .white
        collection.register(PhotosCollectionViewCell.self,
                            forCellWithReuseIdentifier: PhotosCollectionViewCell.reuseId)
        return collection
    }()
    
//    MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateImages()
        setupView()
        setupSubviews()
        setupLayouts()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func updateImages() {
        let startTime = Date().timeIntervalSince1970
        procaess.processImagesOnThread(sourceImages: Pokemon.makeArray(), filter: .chrome, qos: .background) { [weak self] cgImages in
            let endTime = Date().timeIntervalSince1970
            
                let uiImages = cgImages.compactMap({ cgImage -> UIImage? in
                    guard let cgImage = cgImage else { return nil }
                    return UIImage(cgImage: cgImage)
                })
                
            DispatchQueue.main.async {
                self?.pokemonArray = uiImages
            // stop activity
            }
            let elapsedTime = endTime - startTime
            print(elapsedTime)
        }
    }
    
    //    MARK: - Function
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        title = "Photo Gallery"
    }
    
    private func setupSubviews() {
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setupLayouts() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private enum LayoutConstant {
            static let spacing: CGFloat = 8
    }
}

//    MARK: - Extension DataSourse

extension PhotosViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pokemonArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.reuseId, for: indexPath) as? PhotosCollectionViewCell else {return UICollectionViewCell()}
        
        let pokemonArr = pokemonArray[indexPath.row]
        cell.setup(with: pokemonArr)
        return cell
    }
}

//    MARK: - Extension FlowLayout

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    private func itemWidth(
        for width: CGFloat,
        spacing: CGFloat
    ) -> CGFloat {
        let itemsInRow: CGFloat = 3

        let finalWidth = (width - 4 * spacing) / itemsInRow
        
        return finalWidth
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = itemWidth(
            for: view.frame.width,
            spacing: LayoutConstant.spacing
        )
        let height = width
        
        return CGSize(width: width, height: height)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        UIEdgeInsets(
            top: LayoutConstant.spacing,
            left: LayoutConstant.spacing,
            bottom: LayoutConstant.spacing,
            right: LayoutConstant.spacing
        )
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        LayoutConstant.spacing
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        LayoutConstant.spacing
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        willDisplay cell: UICollectionViewCell,
        forItemAt indexPath: IndexPath
    ) {
        cell.contentView.backgroundColor = .systemGray6
    }
}

//extension PhotosViewController: ImageLibrarySubscriber {
//
//    func receive(images: [UIImage]) {
//        pokemonArray = images
//        let indexPath = IndexPath(row: pokemonArray.count - 1, section: 0)
//        collectionView.insertItems(at: [indexPath])
//    }
//}