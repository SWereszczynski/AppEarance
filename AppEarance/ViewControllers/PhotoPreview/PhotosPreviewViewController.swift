//
//  PhotosPreviewViewController.swift
//  AppEarance
//
//  Created by Szymon Wereszczynski on 27.01.2017.

import UIKit
import IQKeyboardManager

class PhotosPreviewViewController: BaseViewController {

    @IBOutlet weak var tagTextField: UITextField!
    @IBOutlet weak var pexelsImageView: UIImageView!
    @IBOutlet weak var photosCollectionView: UICollectionView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    var urlsArray: [UrlsModel] = []
    weak var delegate: PhotoPreviewCoordinatorDelegate?
    var photoService: PhotoService?
    
    init(withDelegate delegate: PhotoPreviewCoordinatorDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.photoService = PhotoService()
        self.photoService?.delegate = self
        self.photosCollectionView.register(UINib(nibName: "SinglePhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "singlePhotoCell")
        self.photosCollectionView.dataSource = self
        self.photosCollectionView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setupView() {
        self.indicatorView.hidesWhenStopped = true
        self.tagTextField.attributedPlaceholder = NSAttributedString(string: "Search by tags", attributes: [NSForegroundColorAttributeName: UIColor.purple])
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action: #selector(self.pexelsDidTouch))
        self.pexelsImageView.isUserInteractionEnabled = true
        self.pexelsImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func pexelsDidTouch() {
        
        self.delegate?.showPexelsWebView()
    }
    
    @IBAction func searchButtonDidTouch(_ sender: BaseButton) {
    
        IQKeyboardManager.shared().resignFirstResponder()
        
        if self.tagTextField.text != "" {
            self.indicatorView.startAnimating()
            self.urlsArray.removeAll()
            self.photoService?.searchPhotos(withTag: self.tagTextField.text!)
        }
    }
}

extension PhotosPreviewViewController: PhotoServiceDelegate {
    
    func photosSearched(searchPhotosModel: SearchPhotosModel) {
        print(searchPhotosModel)
        for photo in searchPhotosModel.photos {
            if let src = photo.src {
                let urls = UrlsModel(mediumQuality: src.medium!, originalQuality: src.original!)
                self.urlsArray.append(urls)
            }
        }
        self.photosCollectionView.reloadData()
        self.indicatorView.stopAnimating()
    }
    
    func errorCatched(error: Error) {
        print(error)
        self.indicatorView.stopAnimating()
    }
    
}

extension PhotosPreviewViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.urlsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "singlePhotoCell", for: indexPath) as! SinglePhotoCollectionViewCell
        guard !self.urlsArray.isEmpty else { return cell }
       
        if let urlString = UrlHelper.findUrlInArray(array: self.urlsArray, indexPathRow: indexPath.row)?.mediumQuality {
            let url = URL(string: urlString)
            cell.singlePhotoImageView.downloadFromUrl(url: url!)
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let urlString = UrlHelper.findUrlInArray(array: self.urlsArray, indexPathRow: indexPath.row)?.originalQuality {
            let url = URL(string: urlString)
            self.delegate?.showSinglePhotoPreview(withUrl: url!)
        }
    }

}
