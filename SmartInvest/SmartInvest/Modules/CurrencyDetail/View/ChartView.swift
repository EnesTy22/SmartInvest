//
//  ChartView.swift
//  Midas
//
//  Created by Enes Talha Yılmaz on 21.01.2024.
//

import UIKit
import Charts

extension CurrencyDetailView: ChartViewDelegate,CurrencyDetailViewProtocol {
    
    func configure(entries : [ChartDataEntry]){
        currencyDataList = entries
        currencyChartView = LineChartView()
        currencyChartView.delegate = self
        let marker = CurrencyDetailMarkerView()
        marker.chartView = currencyChartView
        currencyChartView.marker = marker
        navigationBarSettings()
        view.backgroundColor = CustomColorUtils.getBackgroundColor()
        chartContainerView.backgroundColor = CustomColorUtils.getChartBackgroundColor()
        chartLayout()
        if !currencyDataList.isEmpty{
            loadGoldPriceData()
        }
        addHorizontalLine()
        setupChart()

    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        valueLabel.text = String(entry.x) + "$"
        calculateChangeAmount(entry: entry)
    }
    
    func calculateChangeAmount( entry: ChartDataEntry){
        var selectedColor :UIColor
        if let chartView = currencyChartView,
           let dataSet = chartView.data?.dataSets.first, let firstEntry = dataSet.entryForIndex(0) {
            
            let yValue = firstEntry.y
            if entry.y > yValue {
                selectedColor = CustomColorUtils.getGreenColor()
            } else if entry.y == yValue {
                selectedColor = CustomColorUtils.getWhiteColor()
            } else {
                selectedColor = CustomColorUtils.getRedColor()
            }
            valueLabel.textColor = selectedColor
        }
    }

    func setupChart() {
        currencyChartView.chartDescription.textColor = CustomColorUtils.getWhiteColor()
        currencyChartView.xAxis.labelPosition = .bottom
        currencyChartView.xAxis.labelTextColor = CustomColorUtils.getWhiteColor()
        currencyChartView.leftAxis.labelTextColor = CustomColorUtils.getWhiteColor()
        currencyChartView.rightAxis.enabled = false
        currencyChartView.leftAxis.drawGridLinesEnabled = false
        currencyChartView.xAxis.enabled = false
        currencyChartView.legend.textColor = CustomColorUtils.getWhiteColor()
        currencyChartView.gridBackgroundColor = CustomColorUtils.getDarkGrayColor()
        currencyChartView.noDataTextColor = CustomColorUtils.getWhiteColor()
        currencyChartView.noDataFont = UIFont.systemFont(ofSize: 20)
        currencyChartView.backgroundColor = CustomColorUtils.getChartBackgroundColor()
        currencyChartView.xAxis.labelTextColor = CustomColorUtils.getWhiteColor()
        currencyChartView.leftAxis.labelTextColor = CustomColorUtils.getWhiteColor()
        currencyChartView.rightAxis.labelTextColor = CustomColorUtils.getWhiteColor()
        currencyChartView.legend.textColor = CustomColorUtils.getWhiteColor()
        currencyChartView.doubleTapToZoomEnabled = false
    }
    
    func loadGoldPriceData() {
        let dataSet = LineChartDataSet(entries: currencyDataList, label: "Altın Fiyatları")
        dataSet.setColor(CustomColorUtils.getGreenColor())
        dataSet.lineWidth = 2
        dataSet.drawCircleHoleEnabled = false
        dataSet.circleRadius = 4
        dataSet.setCircleColor(CustomColorUtils.getTealColor())
        dataSet.drawCirclesEnabled = false
        dataSet.mode = .cubicBezier
        dataSet.drawValuesEnabled = false
        dataSet.highlightLineDashLengths = [5,5]
        let data = LineChartData(dataSet: dataSet)
        currencyChartView.data = data
    }
    
    func addHorizontalLine() {
        if let firstElement = currencyDataList.first{
            let middleValue = (firstElement.y)
            let middleCircle = ChartLimitLine(limit: middleValue)
            middleCircle.lineColor = CustomColorUtils.getGrayColor()
            middleCircle.lineWidth = 1.0
            middleCircle.lineDashLengths = [5,5]
            currencyChartView.leftAxis.addLimitLine(middleCircle)
        }
    }
}
