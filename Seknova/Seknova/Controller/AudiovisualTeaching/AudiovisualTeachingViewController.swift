//
//  AudiovisualTeachingViewController.swift
//  Seknova
//
//  Created by imac on 2022/12/3.
//

import UIKit
import WebKit

class AudiovisualTeachingViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var audiovisualTeachingENLabel: UILabel!
    @IBOutlet weak var audoivisualTeachingCNLabel: UILabel!
    
    @IBOutlet weak var youtubeWebView: WKWebView!
    
    @IBOutlet weak var nextStepButton: UIButton!
    
    // MARK: - Variables
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - UI Settings
    
    func  setupUI() {
        setupLabel()
        setupWebView()
    }
    
    private func setupLabel() {
        audiovisualTeachingENLabel.text = "AUDIOVISUAL TEACHING"
        audiovisualTeachingENLabel.font = UIFont.boldSystemFont(ofSize: 30)
        audiovisualTeachingENLabel.adjustsFontForContentSizeCategory = true
        
        audoivisualTeachingCNLabel.text = "教 學 影 片"
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
        self.navigationController?.pushViewController(SetUpBloodSugerIndexViewController(),
                                                      animated: true)
    }
    
}

    // MARK: - Extension

    // MARK: - Protocol
