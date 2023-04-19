//
//  LandingInteractor.swift
//  testprojectNeversitup
//
//  Created by Thanakorn Phungluang on 18/4/2566 BE.
//

import Foundation

protocol LandingBusinessLogic {
    func startFetchCurrentPriceInterval()
    func segmentedIndexChange(index: Int)
    func textRateChange(text: String)
}

class LandingInteractor: LandingBusinessLogic {
    
    var presenter: LandingPresentationLogic?
    lazy var worker: LandingWorker = LandingWorker()
    lazy var countingTimer = CountingTimer()
    let maximumSize: Int = 10
    var inputRate: String = ""
    var segmenteIndex: Int = 0
    
    private func fetchCurrentPrice(loading: Bool = true) {
        presenter?.presentLoading(response: LandingModels.Loading.Response(isShow: loading))
        worker.fetchCurrentprice(completion: { [weak self] data in
            guard let self = self, let presenter = self.presenter else { return }
            presenter.presentLoading(response: LandingModels.Loading.Response(isShow: false))
            if let data = data {
                self.recondData(data: data)
                let response = LandingModels.DataCurrentPrice.Response(data: data)
                presenter.presentCurrentPrice(response: response)
            } else {
                // presenter error state
            }
        })
    }
    
    func startFetchCurrentPriceInterval() {
        fetchCurrentPrice()
        countingTimer = CountingTimer()
        countingTimer.limit = 99
        countingTimer.timeInterval = 60
        countingTimer.onTimerCount = { [weak self] _ in
            guard let self = self else { return }
            self.fetchCurrentPrice(loading: false)
        }
        countingTimer.start()
    }
    
    private func recondData(data: CurrentPrice) {
        var recondCurrentPrice = UserDefaults.standard.recondCurrentPrice
        if recondCurrentPrice.count >= maximumSize {
            recondCurrentPrice.removeFirst()
            recondCurrentPrice.append(data)
        } else {
            recondCurrentPrice.append(data)
        }
        UserDefaults.standard.recondCurrentPrice = recondCurrentPrice
    }
    
    func segmentedIndexChange(index: Int) {
        segmenteIndex = index
        calRateBTC()
    }
    
    func textRateChange(text: String) {
        inputRate = text
        calRateBTC()
    }
    
    func calRateBTC() {
        guard !inputRate.isEmpty else { return }
        guard let float_value: Float = Float(inputRate) else { return }
        let recondCurrentPrice = UserDefaults.standard.recondCurrentPrice.first
        var btcRate: Float = 0.0
        switch segmenteIndex {
        case 0:
            guard let rateUSD = recondCurrentPrice?.BPIData?.USD?.rate_float else { return }
            btcRate = float_value / rateUSD
        case 1:
            guard let rateUSD = recondCurrentPrice?.BPIData?.GBP?.rate_float else { return }
            btcRate = float_value / rateUSD
        case 2:
            guard let rateUSD = recondCurrentPrice?.BPIData?.EUR?.rate_float else { return }
            btcRate = float_value / rateUSD
        default: break
        }
        let response = LandingModels.BitCoinPrice.Response(rate: "BTC: \(String(format: "%.2f", btcRate))")
        presenter?.presentBTCRate(viewModel: response)
    }
}
