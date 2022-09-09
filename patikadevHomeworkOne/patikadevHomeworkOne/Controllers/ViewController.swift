//
//  ViewController.swift
//  patikadevHomeworkOne
//
//

import UIKit


class ViewController: UIViewController {
    // Create Date
    let date = Date()
    // Create Date Formatter
    let dateFormatter = DateFormatter()
    
    @IBOutlet weak var homeView: UIView!
    
    
    @IBOutlet weak var first_name_lbl: UILabel!
    @IBOutlet weak var last_name_lbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var DateLbl: UILabel!
    @IBOutlet weak var gender_lbl: UILabel!
    @IBOutlet weak var information_lbl: UILabel!
    @IBOutlet weak var update_btn: UIButton!
    
    
    @IBAction func update_btn(_ sender: Any)
    {
        let storyboard :UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "contactDetailsStoryboard") as! ContactDetailsViewController
        vc.delegate = self //güncelleme ekranı açıldığında delegate i tetikliyoruz
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeView.layer.cornerRadius = 10
        self.homeView.layer.masksToBounds = true;
        update_btn.layer.cornerRadius = 10
        update_btn.layer.masksToBounds = true;
    }


}

extension ViewController:PersonInformationProtocol{
    func contactUpdate(_ controller: ContactDetailsViewController, with item: PersonContactsModel) {
        
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        first_name_lbl.text = item.firsName
        last_name_lbl.text = item.lastName
        gender_lbl.text = item.gender
        weightLbl.text = String(item.weight)+" kg"
        DateLbl.text = dateFormatter.string(from: item.dateOfBirth)
        information_lbl.isHidden = true
        
        //eğer değerlerden birisi boş gelirse textde gösterilmesi gereken string için ve bilgilendirme labelının görünürlüğünü ayarlamak için kontroller yazıldı.
        if item.firsName.isEmpty{
            first_name_lbl.text = "Ad Bilgisi Bulunmamaktadır."
            information_lbl.isHidden = false
        }
        if item.lastName.isEmpty{
            last_name_lbl.text = "Soyad Bilgisi Bulunmamaktadır."
            information_lbl.isHidden = false
        }
        if item.gender.isEmpty{
            gender_lbl.text = "Yaş Bilgisi Bulunmamaktadır."
            information_lbl.isHidden = false
        }
        if String(item.weight).isEmpty{
            weightLbl.text = "Kilo Bilgisi Bulunmamaktadır."
            information_lbl.isHidden = false
        }
        if dateFormatter.string(from: item.dateOfBirth).isEmpty{
            DateLbl.text = "Doğum Tarihi Bilgisi Bulunmamaktadır."
            information_lbl.isHidden = false
        }
    }
}
