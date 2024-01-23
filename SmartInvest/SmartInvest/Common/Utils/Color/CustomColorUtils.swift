//
//  CustomColorUtils.swift
//  Midas
//
//  Created by Enes Talha Yılmaz on 6.01.2024.
//

import Foundation
import UIKit
class CustomColorUtils{
    public static func getBackgroundColor()-> UIColor {
        return UIColor(named: "BlackRockBackground") ?? UIColor.clear
    }
    public static func getChartBackgroundColor()-> UIColor {
        return UIColor(named: "DeepCoveChartBackground") ?? UIColor.clear
    }
    public static func getWhiteColor()-> UIColor {
        return UIColor(named: "White") ?? UIColor.clear
    }
    public static func getGreenColor()-> UIColor {
        return UIColor(named: "Green") ?? UIColor.clear
    }
    public static func getRedColor()-> UIColor {
        return UIColor(named: "Red") ?? UIColor.clear
    }
    public static func getTealColor()-> UIColor {
        return UIColor(named: "Teal") ?? UIColor.clear
    }
    public static func getDarkGrayColor()-> UIColor {
        return UIColor(named: "DarkGray") ?? UIColor.clear
    }
    public static func getGrayColor()-> UIColor {
        return UIColor(named: "Gray") ?? UIColor.clear
    }
}
