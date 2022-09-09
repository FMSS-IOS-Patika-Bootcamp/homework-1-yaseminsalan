//
//  ContactDetailsViewController.swift
//  patikadevHomeworkOne
//

//

import UIKit

//delegate için protokolümüzü oluşturduk
protocol PersonInformationProtocol:class
{
    func contactUpdate(_ controller:ContactDetailsViewController,with item:PersonContactsModel)
}

class ContactDetailsViewController: UIViewController {
    
    var components = DateComponents()

    @IBOutlet weak var back_btn: UIButton!
    @IBOutlet weak var updateBtn: UIButton!
    @IBOutlet weak var firstNameTfd: UITextField!
    @IBOutlet weak var lastNameTfd: UITextField!
    @IBOutlet weak var weightSliderLbl: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func weightSlider(_ sender: UISlider)
    {
        weightSliderLbl.text = String(Int(sender.value))
    }
    @IBAction func datePicker(_ sender: UIDatePicker)
    {
        contact_update.dateOfBirth = sender.date
        
    }
  
    @IBAction func genderSegmentedControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            contact_update.gender = "Kadın"
        }
        if sender.selectedSegmentIndex == 1{
            contact_update.gender = "Erkek"
        }
        if sender.selectedSegmentIndex == 2{
            contact_update.gender = "Diğer"
        }
    }
    weak var delegate:PersonInformationProtocol? // protokolü kullanabilmek için delegate adında bir nesne oluşturduk
    var contact_update = PersonContactsModel()
    // PersonContactsModel clasından yeni bir nesne oluşturduk
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //yaş sınırlaması koymak için datePicker a maximumDate değeri verilip en küçük yaşın 15 olması kısıtı eklendi.
        components.year = -15
        let maxDate = Calendar.current.date(byAdding: components, to: Date())
        datePicker.maximumDate = maxDate
        
        
        //butonların kenarlarına ovol olaması için cornerRadius eklendi.
        weightSliderLbl.layer.cornerRadius = 20
        weightSliderLbl.layer.masksToBounds = true;
        updateBtn.layer.cornerRadius = 10
        updateBtn.layer.masksToBounds = true;
        back_btn.layer.cornerRadius = 10
        back_btn.layer.masksToBounds = true;
        
        contact_update.gender = "Kadın"
        
        //segmentControlların yazı rengi değiştirildi
        genderSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.blue], for: .selected)
        genderSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.blue], for: .normal)
       
    }


    @IBAction func back_btn(_ sender: Any) {
        //sayfa kapatılır ve önceki sayfaya geri dönüş yapılır.
        dismiss(animated: true, completion: nil)
      
    }
    
    @IBAction func updateBtn(_ sender: Any) {
        contact_update.weight = Int(weightSliderLbl.text!) ?? 40
        contact_update.lastName = lastNameTfd.text!
        contact_update.firsName = firstNameTfd.text!
        delegate?.contactUpdate(self, with: contact_update) //delegate içerisnde bulunan fonksiyonu tetiklettik ve oluşturduğumuz yeni kişileri PersonContactsModel clasının içerisine ekledik.
        
        //sayfa kapatılır ve önceki sayfaya geri dönüş yapılır.
        dismiss(animated: true, completion: nil)
       
    }
}

