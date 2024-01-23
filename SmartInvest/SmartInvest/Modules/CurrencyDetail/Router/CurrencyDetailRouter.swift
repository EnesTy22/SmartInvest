//
//  CurrencyDetailRouter.swift
//  Midas
//
//  Created by Enes Talha Yılmaz on 13.01.2024.
//

import UIKit

class CurrencyDetailRouter: CurrencyDetailRouterProtocol {

    class func createCurrencyDetailModule(forCurrency currency: CurrencyModel) -> UIViewController{
        let viewController = CurrencyDetailView.getStoryboard().instantiateViewController(withIdentifier: String(describing: CurrencyDetailView.self))
        if let view = viewController as? CurrencyDetailView{
            let presenter: CurrencyDetailPresenterProtocol = CurrencyDetailPresenter()
            let router: CurrencyDetailRouterProtocol = CurrencyDetailRouter()
            view.presenter = presenter
            presenter.router = router
            presenter.currency = currency
            presenter.view = view
        }
        return viewController
    }
    
}
extension UIViewController{
    // other storyboard get
    class func getStoryboard() -> UIStoryboard {
            return UIStoryboard(name: String(describing: self), bundle: nil)
        }
}
