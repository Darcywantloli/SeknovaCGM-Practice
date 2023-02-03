//
//  BloodSugarIndexViewController.swift
//  Seknova
//
//  Created by imac on 2022/12/30.
//

import UIKit
import Charts

class BloodSugarIndexViewController: BaseViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var lineChartView: LineChartView!
    
    var lineChartViewDataEntries: [ChartDataEntry] = []
    var lineChartEntrieCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "即時血糖"
        view.insertSubview(Background(imageName: "Background5", alpha: 0.25), at: 0)
        setupLineChartView()
    }
    
    func setupLineChartView() {
        let today = Date()
        let zone = NSTimeZone.system
        let interval = zone.secondsFromGMT()
        let now = today.addingTimeInterval(TimeInterval(interval))

        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "HH:mm:ss"
        let time = dateformatter.string(from: Date())
        print(time)
        lineChartViewDataInput()
        lineChartViewConfiguration()
    }
    
    // MARK: Line Chart View Data Input
    
    func lineChartViewDataInput() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.lineChartEntrieCount += 1
            self.lineChartViewDataEntries.append(ChartDataEntry.init(x: Double(self.lineChartEntrieCount),
                                                                     y: Double(Int.random(in: 75...300))))
            self.lineChartView.reloadInputViews()
        }
    }
    
    // MARK: Line Chart View Configuration
    
    func lineChartViewConfiguration() {
        let chartDataSet1 = LineChartDataSet.init(entries: lineChartViewDataEntries, label: "")
        chartDataSet1.colors = [.red, .green, .blue, .orange, .systemPink]
        chartDataSet1.lineWidth = 3 // 設定第一組資料的折線寬度
        chartDataSet1.drawCirclesEnabled = false // 第一組資料點的內、外圓都不顯示
        chartDataSet1.drawValuesEnabled = false // 第一組資料點的值在折線上都不顯示
        chartDataSet1.mode = .horizontalBezier // 將第一組資料點的折線模式設為水平貝茲曲線
        chartDataSet1.highlightEnabled = false // 關閉點擊後的十字線
        
        let chartData = LineChartData.init(dataSet: chartDataSet1)
        lineChartView.data = chartData
        lineChartView.drawBordersEnabled = true // 繪製 lineChartView 邊框
        lineChartView.legend.form = .none // 不顯示圖例
        lineChartView.scaleXEnabled = true // 關閉 x 軸縮放
        lineChartView.scaleYEnabled = false // 關閉 y 軸縮放
        lineChartView.doubleTapToZoomEnabled = false // 關閉雙擊縮放
        lineChartView.xAxis.drawGridLinesEnabled = true // 取消垂直網格線
        lineChartView.xAxis.labelPosition = .bottom // 將 x 軸座標數值設在底部
        lineChartView.xAxis.labelCount = lineChartViewDataEntries.count // 設定全部的 x 軸值的數量
        lineChartView.xAxis.granularity = 1 // 設定 x 軸值的間隔
        lineChartView.leftAxis.drawAxisLineEnabled = true // 不顯示左側 y 軸的線
        lineChartView.rightAxis.enabled = false // 取消右側座標
        lineChartView.rightAxis.drawAxisLineEnabled = true // 不顯示右側 y 軸的線
    }
}
