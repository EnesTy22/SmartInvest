//
//  ViewController.swift
//  Midas
//
//  Created by Enes Talha Yılmaz on 5.01.2024.
//

import UIKit
import Charts


class CurrencyDetailView: UIViewController {

    @IBOutlet var chartContainerView: UIView!
    @IBOutlet var valueLabel: UILabel!
    
    var presenter : CurrencyDetailPresenterProtocol?
    var currencyChartView: LineChartView!
    var currencyDataList: [ChartDataEntry] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

    func navigationBarSettings(){
        let titleLabel = UILabel()
        titleLabel.text = "Gold"
        titleLabel.textColor = CustomColorUtils.getWhiteColor()
        titleLabel.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
        let letterSpacing: CGFloat = 2.0
        let attributedString = NSMutableAttributedString(string: titleLabel.text ?? "")
        attributedString.addAttribute(NSAttributedString.Key.kern, value: letterSpacing, range: NSMakeRange(0, attributedString.length))
        titleLabel.attributedText = attributedString
        titleLabel.sizeToFit()
        navigationItem.titleView = titleLabel
        navigationItem.titleView?.tintColor = CustomColorUtils.getWhiteColor()
        navigationController?.navigationBar.isTranslucent = true
    }
    
    func chartLayout(){
        currencyChartView.translatesAutoresizingMaskIntoConstraints = false
                chartContainerView.addSubview(currencyChartView)

        NSLayoutConstraint.activate([
            currencyChartView.topAnchor.constraint(equalTo: chartContainerView.topAnchor,constant: 100),
            currencyChartView.leadingAnchor.constraint(equalTo: chartContainerView.leadingAnchor),
            currencyChartView.trailingAnchor.constraint(equalTo: chartContainerView.trailingAnchor),
            currencyChartView.bottomAnchor.constraint(equalTo: chartContainerView.bottomAnchor)
        ])
    }
    
}
