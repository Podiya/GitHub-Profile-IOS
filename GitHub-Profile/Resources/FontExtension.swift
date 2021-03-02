//
//  FontExtension.swift
//  GitHub-Profile
//
//  Created by Ravindu Senevirathna on 1/3/21.
//

import Foundation
import UIKit

extension UIFont {
    static public func sourceSansProRegular(size: Int) -> UIFont {
        return UIFont(name: "SourceSansPro-Regular", size: CGFloat(size)) ?? UIFont.systemFont(ofSize: CGFloat(size))
    }
    
    static public func sourceSansProBold(size: Int) -> UIFont {
        return UIFont(name: "SourceSansPro-Regular", size: CGFloat(size)) ?? UIFont.systemFont(ofSize: CGFloat(size))
    }
    
    static public func sourceSansProBlack(size: Int) -> UIFont {
        return UIFont(name: "SourceSansPro-Black", size: CGFloat(size)) ?? UIFont.systemFont(ofSize: CGFloat(size))
    }
    
    static public func sourceSansProLight(size: Int) -> UIFont {
        return UIFont(name: "SourceSansPro-Light", size: CGFloat(size)) ?? UIFont.systemFont(ofSize: CGFloat(size))
    }
}
