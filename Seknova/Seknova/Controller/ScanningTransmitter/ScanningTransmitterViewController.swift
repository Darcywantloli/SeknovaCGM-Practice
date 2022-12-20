//
//  ScanningTransmitterViewController.swift
//  Seknova
//
//  Created by imac on 2022/12/16.
//

import UIKit
import AVFoundation

class ScanningTransmitterViewController: BaseViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var transmitterAImageView: UIImageView!
    @IBOutlet weak var transmitterBImageView: UIImageView!
    
    @IBOutlet weak var QRCodeScanButton: UIButton!
    @IBOutlet weak var enterWithTextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var showQRCodeView: UIView!
    
    // MARK: - Variables
    
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Scanning Transmitter"

        setupUI()
        setNavigationBar()
    }
    
    // MARK: - UI Settings
    
    func setupUI() {
        setupView()
        setupButton()
        setupImageView()
    }

    private func setupView() {
        showQRCodeView.isHidden = true
    }
    
    private func setupButton() {
        
    }
    
    private func setupImageView() {
        transmitterAImageView.isHidden = false
        transmitterBImageView.isHidden = false
    }
    
    func configurationScanner() {
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInDualCamera],
                                                                      mediaType: AVMediaType.video,
                                                                      position: .back)
        guard let captureDevice = deviceDiscoverySession.devices.first else {
            Alert.showAlertWith(title: "錯誤", message: "無法獲取相機", vc: self, confirmTitle: "確認")
            return
        }
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            
            captureSession = AVCaptureSession()
            captureSession?.addInput(input)
            
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession?.addOutput(captureMetadataOutput)
            
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
            
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
            
            videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
            videoPreviewLayer?.frame = showQRCodeView.layer.bounds
            showQRCodeView.layer.addSublayer(videoPreviewLayer!)
            
            settingScannerFrame()
            
            captureSession!.startRunning()
        } catch {
            Alert.showAlertWith(title: "錯誤", message: "QRCode掃描錯誤", vc: self, confirmTitle: "確認")
            
            return
        }
    }
    
    func settingScannerFrame() {
        if let showQRCodeView = showQRCodeView {
            showQRCodeView.layer.borderColor = UIColor.green.cgColor
            showQRCodeView.layer.borderWidth = 2
            
            view.addSubview(showQRCodeView)
            view.bringSubviewToFront(showQRCodeView)
        }
    }

    
    // MARK: - IBAction
    
    @IBAction func scanQRCode(_ sender: Any) {
        showQRCodeView.isHidden = false
        transmitterAImageView.isHidden = true
        transmitterBImageView.isHidden = true
        
        if AVCaptureDevice.authorizationStatus(for: .video) == .authorized {
            DispatchQueue.main.async {
                self.configurationScanner()
            }
        } else {
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted: Bool) in
                if granted {
                    DispatchQueue.main.async {
                        self.configurationScanner()
                    }
                } else {
                    Alert.showAlertWith(title: "錯誤", message: "請開啟相機權限", vc: self, confirmTitle: "設定", confirm: {
                        let url = URL(string: UIApplication.openSettingsURLString)
                        
                        if let url = url, UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url, options: [:], completionHandler: { (success) in })
                        }
                    })
                }
            })
        }
    }
    
    @IBAction func enterWithText(_ sender: Any) {
        Alert.showAlertWithTextField(title: "內容",
                                     message: "請輸入裝置碼",
                                     vc: self,
                                     confirmTitle: "確認",
                                     cancelTitle: "取消",
                                     setTextField: { textField in
            textField.placeholder = "輸入裝置碼"
        },
                                     comfirm: { textField in
            if textField.text?.regularExpression(type: .deviceID) == false {
                Alert.showAlertWith(title: "錯誤", message: "請輸入正確的裝置碼", vc: self, confirmTitle: "確認")
            } else {
                Alert.showAlertWith(title: "內容", message: "裝置碼正確", vc: self, confirmTitle: "確認", confirm: {
                    let nextVC = PairBluetoothViewController()
                    self.navigationController?.pushViewController(nextVC, animated: true)
                })
            }
        })
    }
    
    @IBAction func backToLogin(_ sender: Any) {
        let nextVC = LoginViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

// MARK: - AVCaptureMetadataOutputObjectsDelegate

extension ScanningTransmitterViewController: AVCaptureMetadataOutputObjectsDelegate {
    
    func metadataOutput(_ output: AVCaptureMetadataOutput,
                        didOutput metadataObjects: [AVMetadataObject],
                        from connection: AVCaptureConnection) {
        if metadataObjects.isEmpty {
            showQRCodeView.frame = CGRect.zero
            return
        }
        
        if let metadataObject = metadataObjects[0] as? AVMetadataMachineReadableCodeObject {
            if metadataObject.type == AVMetadataObject.ObjectType.qr {
                let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObject)
                
                showQRCodeView?.frame = barCodeObject!.bounds
                
                if let value = metadataObject.stringValue {
                    UserPreference.shared.deviceID = value
                    captureSession!.stopRunning()
                    
                    let nextVC = PairBluetoothViewController()
                    self.navigationController?.pushViewController(nextVC, animated: true)
                }
            }
        }
    }
}

// MARK: - Protocol
