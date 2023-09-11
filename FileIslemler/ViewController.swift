//
//  ViewController.swift
//  FileIslemler
//
//  Created by Kaan Deniz Erikmen on 11.09.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtFGirdi: UITextField!
    @IBOutlet weak var resimTutucu: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnYaz(_ sender: Any) {
        let mesaj:String = txtFGirdi.text!
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            let dosyaYolu = dir.appendingPathComponent("dosyam.txt")
            do{
                try mesaj.write(to: dosyaYolu, atomically: false, encoding: String.Encoding.utf8)
                txtFGirdi.text = ""
                
            }catch{
                print("Dosya yazılırken hata gerçekleşmiştir")
            }
        }
            
            
            
    }
    
    @IBAction func btnOku(_ sender: Any) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            let dosyaYolu = dir.appendingPathComponent("dosyam.txt")
            do{
                txtFGirdi.text = try String(contentsOf: dosyaYolu, encoding: String.Encoding.utf8)
                
            }catch{
                print("Dosya yazılırken hata gerçekleşmiştir")
            }
        }
    }
    @IBAction func btnSil(_ sender: Any) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            let dosyaYolu = dir.appendingPathComponent("dosyam.txt")
            do{
                try FileManager.default.removeItem(at: dosyaYolu)
                txtFGirdi.text = ""
                
            }catch{
                print("Dosya yazılırken hata gerçekleşmiştir")
            }
        }
    }
    @IBAction func btnResimKaydet(_ sender: Any) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            let dosyaYolu = dir.appendingPathComponent("resmim.txt")
            let resim = UIImage(named: "resim")
            do{
                try resim?.pngData()?.write(to: dosyaYolu)
            }catch{
                print("Resim yazılırken hata gerçekleşmiştir")
            }
        }

    }
    @IBAction func btnResimGoster(_ sender: Any) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            let dosyaYolu = dir.appendingPathComponent("resmim.txt")
            
            self.resimTutucu.image = UIImage(contentsOfFile: dosyaYolu.path)
            
            
        }
    }
    @IBAction func btnResimSil(_ sender: Any) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            let dosyaYolu = dir.appendingPathComponent("resmim.txt")
            do{
                try FileManager.default.removeItem(at: dosyaYolu)
               
                
            }catch{
                print("Resim silinitken hata gerçekleşmiştir")
            }
        }
    }
}

