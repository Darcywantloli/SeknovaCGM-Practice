//
//  ConnectionViewController.swift
//  Seknova
//
//  Created by imac on 2022/12/19.
//

import UIKit

class ConnectionViewController: BaseViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var connectionImageView: UIImageView!
    
    @IBOutlet weak var connectionLabel: UILabel!
    // MARK: - Variables
    
    let connectionImages = ["connecting_1",
                            "connecting_2",
                            "connecting_3",
                            "connecting_4",
                            "connecting_5",
                            "connecting_6",
                            "connecting_7",
                            "connecting_8",
                            "connecting_9",
                            "connecting_10",
                            "connecting_11",]
    var images = [UIImage]()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        setupUI()
    }

    // MARK: - UI Settings
    
    func setupUI() {
        setupLabel()
        setupImageView()
    }

    private func setupLabel() {
        connectionLabel.text = "CONNECTION\n連線中"
    }
    
    private func setupImageView() {
        for imageNumber in connectionImages {
            let image = UIImage(named: imageNumber)!
            images.append(image)
        }
        connectionImageView.animationImages = images
        connectionImageView.animationDuration = 1
        connectionImageView.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
            self.connectionImageView.stopAnimating()
            
            let nextVC = PairBluetoothViewController()
            nextVC.root = .ConnectionViewController
            
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    
    // MARK: - IBAction
    
}

// MARK: - Extension

// MARK: - Protocol
