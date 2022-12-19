//
//  AgreementViewController.swift
//  Seknova
//
//  Created by imac on 2022/11/17.
//

import UIKit

class AgreementViewController: BaseViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var agreementScrollView: UIScrollView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLael: UILabel!
    
    @IBOutlet weak var agreeButton: UIButton!
    
    // MARK: - Variables
    
    var root: lastViewController = .LoginViewController
    
    enum lastViewController {
        case LoginViewController
        case RegisterViewController
    }
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setNavigationBar()
    }
    // MARK: - UI Settings
    func setupUI() {
        setLabel()
        setButton()
    }
    
    private func setLabel() {
        contentLael.text = "歡迎您使用Seknova（以下簡稱本服務）應用程式（以下簡稱APP）為保障您的權益，請詳細閱讀下列條款內容。若您點擊「同意」，即表示您已閱讀、了解並同意遵守下列條款。日後智準生醫科技如有修改或變更本服務使用條款之內容，修改後的使用條款內容將公布網站上。若您於前開修改或變更後繼續使用本服務，視為您已閱讀、瞭解並同意接受該等修改或變更。如果您無法遵守本服務使用條款內容，或不同意本服務使用條款內容時，請您立即停止使用本服務。為確保您的權益，建議您經常確認本服務使用條款之最新內容。\n若您未滿二十歲，應於點選同意前，將本使用條款請您的法定代理人（家長）或監護人閱讀，並得到其同意，才可以使用本服務。當您使用本服務時，則視為您的家長（或監護人）已經閱讀、瞭解並同意本服務條款之所有內容及其後之修改變更：\n一、服務內容\n(一)使用者:本服務APP須先申請成為使用者，並由使用者支付本服務APP之費用。前述之申請可至本公司客服中心或本服務APP網站辦理，當申請完成後即開始計費。使用者欲終止使用本服務APP，須辦理終止使用手續。若使用者違反本公司規定，本服務APP亦將自動終止或暫停使用。\n(二)本服務APP可安裝於智慧型行動設備(包含智慧型手機、平板)，服務內容包含服務內容等。\n1.服務內容：提供持續性血糖監控。\n2.APP使用時間：可依平日（星期一~五）、假日（六、日）設定APP使用時段。\n(三)本服務僅提供Android作業系統且版本2.2以上使用。\n二、服務認知\n(一)本服務APP使用前，管理者與使用者應充份溝通並取得同意使用本服務APP後，才下載、安裝及登錄註冊使用。\n(二)本服務APP之客戶服務，應由管理者向本公司客服中心、各營運窗口或本服務APP網站辦理，並遵守本公司相關規定（如：管理者進線客服中心，須經一定程序驗證身分後辦理）。\n(三)本服務APP僅提供第一條服務內容所述之服務，其他所需之設備（如：個人電腦、行動裝置及其他相關裝置）及所需之費用（如行動上網費用、通訊費用等）均由使用者自行負擔。\n(四)本服務APP使用條款若有變更，本公司得依需求向用戶公告或通知以變更本條款。用戶於變更後繼續使用本服務APP者，視為同意本條款之變更，使用者須遵守該變更後條款之規範；未規定事項，同意遵守本公司相關服務營業規章規定。\n三、免責聲明\n(一)本服務APP之使用者，若與他人間因使用本服務APP而產生之爭議及訴訟，由使用者與爭議人自行溝通、協調，概與本公司無涉，本公司不負任何責任。\n(二)本服務APP依本公司既有之規劃提供，不保證符合管理者或使用者的全部需求、不受干擾、安全可靠或免於出錯。\n(三) 本服務依一般合理之技術及方式，維持系統及服務之正常運作。但於下列各項情況時，本平台有權可以停止、中斷提供本服務，且不會為下列原因所引發的損失或傷害而負賠償責任。\n1.    本服務相關設備進行必要之保養及施工時。\n2.    本服務相關設備發生突發性之故障時。\n3.    本服務申請之電子通信服務被停止，無法提供服務時。\n4.    第三人透過本服務傳輸任何錯誤軟體、病毒、木馬或類似性質的程式。\n5.    由於天災等不可抗力之因素或其他不可歸責致使無法提供服務時。\n(四)如因下載、安裝、使用本服務APP，致使用者之設備直接或間接之損害或損失時，本公司不負任何責任。\n(五)本公司如因情事變更，得暫停或終止本服務全部或一部，管理者或使用者不得異議或要求任何補償。\n四、個人資料蒐集告知條款\n(一)本公司於本服務期間基於「消費者、客戶管理與服務」合理關聯之特定目的範圍內，蒐集、處理及利用包括但不限於使用者本人所填寫之所有個人資料，俾利本公司得以提供本服務，並得以發送本服務相關訊息。若提供之資料不足或有誤時，本公司將無法提供完整服務。\n(二)管理者就其個人資料得依個人資料保護法及相關法律向本公司請求查詢、閱覽、製給複製本、補充更正、請求停止蒐集、處理、利用及刪除等權利。申請手續依本公司之規定辦理。\n(三)使用者了解並同意，本服務依上述提供服務之必要範圍外，據法律的要求或基於以下目的之合理必要範圍內，認定必須將使用者的帳戶資訊或內容，加以保存或揭露予政府機關、司法警察等時，得加以保存及揭露：\n1.    遵守法令或政府機關之要求。\n2.    為防止他人權益之重大危害而有必要者。\n3.    為免除使用者及公眾之生命、身體、自由、權利、財產上之急迫危險者。\n(四)使用者及管理者開始使用本服務APP時，則視為已了解及同意本公司及本服務對其個人資料之合法使用。\n五、智慧財產保護\n本服務APP及相關網站上所使用或提供之軟體、程式及內容（包括但不限於文字、說明、圖畫、圖片、圖形、檔案、頁面設計、網站規劃與安排等）之專利權、著作權、商標權、營業秘密、專門技術及其他智慧財產權均屬本公司或其他權利人所有，非經權利人事先書面授權同意，不得重製、公開傳播、公開播送、公開演出、公開上映、改作、編輯、出租、散布、進行還原工程、解編、反向組譯、或其他方式之使用，如有違反，除應自行負法律責任外，如因而對本公司造成損害或損失，本公司得請求損害賠償。\n六、用戶責任\n如因使用本服務APP而使本公司遭受第三人申訴、請求或提起訴訟等時，使用者應自己負責並自費處理之，不對本公司造成困擾。如因使用本服務APP而使本公司受有任何損害（包含律師費用之負擔）時，本公司得請求損害賠償。\n七、準據法及管轄法院\n(一)本服務條款以中華民國法律為準據法。\n(二)因使用本服務而與本公司所生之爭議，同意本誠信原則解決之，如有訴訟之必要時，同意以台灣台北地方法院為第一審管轄法院。"
    }
    
    private func setButton() {
        agreeButton.setTitle("同意", for: .normal)
    }
    
    // MARK: - IBAction
    
    // 根據來源執行不同動作
    @IBAction func agreeContent(_ sender: Any) {
        switch root {
        case .LoginViewController:
            let nextVC = AudiovisualTeachingViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
        case .RegisterViewController:
            dismiss(animated: true)
        }
        dismiss(animated: true)
    }
}

// MARK: - Extension

// MARK: - Protocol
