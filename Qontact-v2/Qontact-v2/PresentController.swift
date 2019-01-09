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
    override func viewDidLoad() {
        super.viewDidLoad()
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
