//
//  AudiovisualTeachingViewController.swift
//  Seknova
//
//  Created by imac on 2022/12/3.
//

import UIKit
import WebKit

class AudiovisualTeachingViewController: BaseViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var titleENLabel: UILabel!
    @IBOutlet weak var titleCNLabel: UILabel!
    
    @IBOutlet weak var youtubeWebView: WKWebView!
    
    @IBOutlet weak var nextStepButton: UIButton!
    
    // MARK: - Variables
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setNavigationBar()
    }
    
    // MARK: - UI Settings
    
    func  setupUI() {
        setupLabel()
        setupWebView()
    }
    
    private func setupLabel() {
        titleENLabel.text = "AUDIOVISUAL TEACHING"
        titleENLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleENLabel.adjustsFontForContentSizeCategory = true
        
        titleCNLabel.text = "教 學 影 片"
    }
    
    private func setupButton() {
        nextStepButton.setTitle("下一步", for: .normal)
    }
    
    private func setupWebView() {
        let url = URL(string: "https://www.youtube.com/embed/videoID?loop=0&playlist=Tzmisk385aw")!
        
        let request = URLRequest(url: url)
        youtubeWebView.load(request)
    }
    
    // MARK: - IBAction
    
    @IBAction func nextStep(_ sender: Any) {
        let nextVC = SetUpBloodSugerIndexViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}

// MARK: - Extension

// MARK: - Protocol
