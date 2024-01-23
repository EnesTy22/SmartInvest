//
//  ChartMarkerView.swift
//  Midas
//
//  Created by Enes Talha Yılmaz on 14.01.2024.
//

import Foundation
import Charts

class CurrencyDetailMarkerView: MarkerView {

    private var datePopUpView: UIView = {
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 60, height: 20))
        view.backgroundColor = .clear
        view.layer.opacity = 1
        view.layer.cornerRadius = 5.0
        view.center.x = 0
        return view
    }()
    
    private var dotView: UIView = {
        let radius = 5.0
        let opacity: Float = 0.8
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: radius * 2, height: radius * 2))
        view.backgroundColor = CustomColorUtils.getGreenColor()
        view.layer.opacity = opacity
        view.layer.cornerRadius = radius
        view.center.y -= radius
        view.center.x -= radius
        return view
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: datePopUpView.bounds.size.width, height: datePopUpView.bounds.size.height))
        label.textColor = CustomColorUtils.getWhiteColor()
        label.textAlignment = .center
        return label
    }()

    private var dynamicY: CGFloat = 0.0

    override func refreshContent(entry: ChartDataEntry, highlight: Highlight) {
        //PopUp'ın Altta görünmesi için daha sonra özelleştirilecek

        guard let totalYAxisLength = chartView?.bounds.maxY else{ return }
        let dynamicY = CGFloat(highlight.drawY)
        datePopUpView.center.y = totalYAxisLength - dynamicY
        datePopUpView.center.y -= 12.5

        //PopUp'ın üstte görünmesi için daha sonra özelleştirilecek
        /*
        let dynamicY = center.y - CGFloat(highlight.drawY)
        dotView.center.y = dynamicY
        dotView.center.y += 15*/
    
        dateLabel.text = String(highlight.x)

    }

    override func draw(context: CGContext, point: CGPoint) {
        super.draw(context: context, point: point)
        if datePopUpView.superview == nil {
        addSubview(dotView)
        addSubview(datePopUpView)
        datePopUpView.addSubview(dateLabel)
        }
    }
}
