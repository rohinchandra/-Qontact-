//
//  PresentController.swift
//  Qontact-v2
//
//  Created by Rob chandra on 1/8/19.
//  Copyright © 2019 Rohin chandra. All rights reserved.
//

import UIKit

class PresentController: UIViewController {

    @IBOutlet weak var imgQRCode: UIImageView!
    @IBOutlet weak var imgProfile: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imgProfile.layer.borderWidth = 1
        imgProfile.layer.masksToBounds = false
        imgProfile.layer.borderColor = UIColor.lightGray.cgColor
        imgProfile.layer.cornerRadius = imgProfile.frame.height/2
        imgProfile.clipsToBounds = true
        
        
        let savedProfile = "Rohin is great"
        var qrcodeImage: CIImage!
        if qrcodeImage == nil {
            let data = savedProfile.data(using: String.Encoding.isoLatin1, allowLossyConversion: false)
            let filter = CIFilter(name: "CIQRCodeGenerator")
            filter!.setValue(data, forKey: "inputMessage")
            filter!.setValue("Q", forKey: "inputCorrectionLevel")
            
            qrcodeImage = filter!.outputImage
            
            let scaleX = imgQRCode.frame.size.width / qrcodeImage.extent.size.width
            let scaleY = imgQRCode.frame.size.height / qrcodeImage.extent.size.height
            let transformedImage = qrcodeImage.transformed(by: CGAffineTransform(scaleX: scaleX, y: scaleY))
            
            imgQRCode.image = UIImage(ciImage: transformedImage)
            imgQRCode.layer.shadowColor = UIColor.darkGray.cgColor
            imgQRCode.layer.shadowOpacity = 1
            imgQRCode.layer.shadowOffset = CGSize.zero
            imgQRCode.layer.shadowRadius = 10
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
