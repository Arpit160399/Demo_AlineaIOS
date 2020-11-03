//
//  Themeing.swift
//  AlineaIOS
//
//  Created by Arpit Singh on 02/11/20.
//

import UIKit

class Themeing {
    
   static let shared  = Themeing()
    
    let accent : UIColor = {
       return UIColor(displayP3Red: 64/255, green: 65/255, blue: 205/255, alpha: 1)
    }()
    
    let primary : UIColor = {
        return UIColor(displayP3Red: 0/255, green: 55/255, blue: 201/255, alpha: 1)
    }()
    
    let secondary: UIColor = {
       return UIColor(displayP3Red: 250/255, green: 250/255, blue: 251/255, alpha: 1)
    }()
    
    let secondaryDark: UIColor = {
       return UIColor(displayP3Red: 243/255, green: 245/255, blue: 251/255, alpha: 1)
    }()
    
    let fontPrimary: UIColor = {
        return .black
    }()
    
    let fontSecondary: UIColor = {
        return UIColor(displayP3Red: 159/255, green: 159/255, blue: 168/255, alpha: 1)
    }()

    let success: UIColor = {
        return UIColor(displayP3Red: 99/255, green: 221/255, blue: 183/255, alpha: 1)
    }()

    let failer: UIColor = {
        return UIColor(displayP3Red: 239/255, green: 104/255, blue: 106/255, alpha: 1)
    }()

}
