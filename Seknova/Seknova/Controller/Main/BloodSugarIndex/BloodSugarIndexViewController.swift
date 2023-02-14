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
    
    @IBOutlet weak var seknovaImageView: UIImageView!
    @IBOutlet weak var bluetoothImageView: UIImageView!
    @IBOutlet weak var networkImageView: UIImageView!
    
    @IBOutlet weak var trendLabel: UILabel!
    @IBOutlet weak var bloodSugarLabel: UILabel!
    @IBOutlet weak var componentLabel: UILabel!
    
    @IBOutlet weak var trendSignImageView: UIImageView!
    
    @IBOutlet weak var bloodSugarChartView: LineChartView!
    
    // MARK: - Variables
    
    var bloodSugarIndex: [Int] = []
    var bloodSugarChartDataEntries = [ChartDataEntry]()
    
    let date = Date()
    var dateFormatter = DateFormatter()
    
    let highBloodSugar = UserPreference.shared.highSuger
    let lowBloodSuagr = UserPreference.shared.lowSuger
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(setupChart), userInfo: nil, repeats: true)
    }
    
    // MARK: - UI Settings
    
    func setupUI() {
        setupView()
        setupChart()
        setupLineChartView()
    }
    
    private func setupView() {
        self.title = "即時血糖"
        
        view.insertSubview(Background(imageName: "Background5", alpha: 0.25), at: 0)
    }
    
    private func setupLineChartView() {
        for i in lowBloodSuagr...highBloodSugar {
            let limitLine = ChartLimitLine(limit: Double(i))
            
            limitLine.lineColor = .orange.withAlphaComponent(0.2)
            
            bloodSugarChartView.leftAxis.addLimitLine(limitLine)
        }
        
        dateFormatter.dateFormat = "HH:mm"
    }
    
    @objc func setupChart() {
        let xAxisNumberFormatter = ChartsXAxisFormatter()
        
        bloodSugarChartView.xAxis.valueFormatter = xAxisNumberFormatter
        bloodSugarChartView.xAxis.labelPosition = .bottom
        bloodSugarChartView.xAxis.labelCount = 6
        bloodSugarChartView.leftAxis.axisMinimum = 0
        bloodSugarChartView.leftAxis.axisMaximum = 400
        bloodSugarChartView.legendRenderer.legend = .none
        
        bloodSugarChartView.xAxis.avoidFirstLastClippingEnabled = true
        bloodSugarChartView.xAxis.forceLabelsEnabled = true
        bloodSugarChartView.leftAxis.drawLimitLinesBehindDataEnabled = true
        bloodSugarChartView.scaleYEnabled = false
        bloodSugarChartView.rightAxis.drawLabelsEnabled = false
        bloodSugarChartView.autoScaleMinMaxEnabled = true
        
        let time: TimeInterval = Date().timeIntervalSince1970
        
        bloodSugarChartView.xAxis.axisMaximum = time + 3540
        bloodSugarChartView.xAxis.axisMinimum = time - 60
        
        bloodSugarIndex.append(Int.random(in: 50...400))
        bloodSugarLabel.text = "\(bloodSugarIndex[bloodSugarIndex.count - 1])"
        
        let entry = ChartDataEntry(x: Date().timeIntervalSince1970,
                                   y: Double(bloodSugarIndex[bloodSugarIndex.count - 1]))
        
        bloodSugarChartDataEntries.append(entry)
        
        let chartDataSet = LineChartDataSet(entries: bloodSugarChartDataEntries, label: "")
        
        chartDataSet.mode = .horizontalBezier
        chartDataSet.colors = [.red]
        chartDataSet.circleColors = [.red]
        chartDataSet.circleRadius = 2
        
        chartDataSet.drawValuesEnabled = false
        chartDataSet.drawCircleHoleEnabled = false
        chartDataSet.highlightEnabled = false
        
        let chartData = LineChartData(dataSets: [chartDataSet])
        
        bloodSugarChartView.data = chartData
    }
    
    // MARK: - IBAction
    
}

// MARK: - Extension

// MARK: - Protocol
