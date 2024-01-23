//
//  CurrencyDetailViewProtocol.swift
//  Midas
//
//  Created by Enes Talha Yılmaz on 7.01.2024.
//

import Foundation
import Charts

protocol CurrencyDetailViewProtocol: class {
    func configure(entries : [ChartDataEntry])
}

protocol CurrencyDetailRouterProtocol: class {
    
}

protocol CurrencyDetailPresenterProtocol: class {
    var view: CurrencyDetailViewProtocol?{ get set }
    var router: CurrencyDetailRouterProtocol?{ get set }
    var currency: CurrencyModel?{ get set }
    func viewDidLoad()

}
