//
//  CurrencyDetailPresenter.swift
//  Midas
//
//  Created by Enes Talha Yılmaz on 13.01.2024.
//

import Foundation

class CurrencyDetailPresenter: CurrencyDetailPresenterProtocol{
    var router: CurrencyDetailRouterProtocol?
    var view: CurrencyDetailViewProtocol?
    var currency: CurrencyModel?
    
    func viewDidLoad() {
        if let entries = currency?.entries{
            view?.configure(entries: entries)
        }
        
    }
}
