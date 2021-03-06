//
//  AlbumsCollectionViewCell.swift
//  RxSwift+MVVM
//
//  Created by Mustafa GUNES on 12.02.2019.
//  Copyright © 2019 Mustafa GUNES. All rights reserved.
//

import UIKit

class AlbumsCollectionViewCell: UICollectionViewCell {

    // MARK : - Outlets
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var albumTitle: UILabel!
    @IBOutlet weak var albumArtist: UILabel!
    
    var withBackView: Bool! {
        didSet {
            self.backViewGenerator()
        }
    }
    
    private func backViewGenerator() {
        backView.loadImage(fromURL: album.albumArtWork)
    }
    
    public var album: Album! {
        didSet {
            self.albumImage.loadImage(fromURL: album.albumArtWork)
            self.albumArtist.text = ""
            self.albumTitle.text = album.name
        }
    }
    
    private lazy var backView: UIImageView = {
        let backView = UIImageView(frame: albumImage.frame)
        backView.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(backView)
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: albumImage.topAnchor, constant: -10),
            backView.leadingAnchor.constraint(equalTo: albumImage.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: albumImage.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: albumImage.bottomAnchor)
            ])
        backView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        backView.alpha = 0.5
        contentView.bringSubview(toFront: albumImage)
        return backView
    }()
    
    override func prepareForReuse() {
        albumImage.image = UIImage()
        backView.image = UIImage()
    }
}
