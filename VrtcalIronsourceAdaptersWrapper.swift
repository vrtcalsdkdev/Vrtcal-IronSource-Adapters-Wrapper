import Vrtcal_Adapters_Wrapper_Parent
import IronSource

// Must be NSObject for ISInitializationDelegate
class VrtcalIronsourceAdaptersWrapper: NSObject, AdapterWrapperProtocol {
    
    var appLogger: Logger
    var sdkEventsLogger: Logger
    var sdk = SDK.ironSource
    var delegate: AdapterWrapperDelegate
    
    required init(
        appLogger: Logger,
        sdkEventsLogger: Logger,
        delegate: AdapterWrapperDelegate
    ) {
        self.appLogger = appLogger
        self.sdkEventsLogger = sdkEventsLogger
        self.delegate = delegate
    }
    
    func initializeSdk() {
        //Only handle interstitial because IronSource doesn't support mediation of their banners
        IronSource.setInterstitialDelegate(self)
        IronSource.setRewardedVideoDelegate(self)
        IronSource.setRewardedVideoManualDelegate(self)
        IronSource.add(self)
        
        IronSource.initWithAppKey("133bdf7c9", adUnits:[IS_INTERSTITIAL, IS_REWARDED_VIDEO], delegate: self)
    }
    
    func handle(vrtcalAsSecondaryConfig: VrtcalAsSecondaryConfig) {
        
        switch vrtcalAsSecondaryConfig.placementType {
            case .interstitial:
                IronSource.loadInterstitial()
                
            case .rewardedVideo:
                IronSource.loadRewardedVideo()
                
            case .banner:
                sdkEventsLogger.log("Banner not supported for Ironsource Adapter")

            case .showDebugView:
                appLogger.log("IronSource doesn't have a debug view")
        }
    }
    
    func showInterstitial() -> Bool {
        if IronSource.hasInterstitial() {
            IronSource.showInterstitial(with: delegate.viewController)
            return true
        }
        
        if IronSource.hasRewardedVideo() {
            IronSource.showRewardedVideo(with: delegate.viewController)
            return true
        }

        return false
    }
    
    func destroyInterstitial() {
        
    }
}


extension VrtcalIronsourceAdaptersWrapper: ISInitializationDelegate {
    func initializationDidComplete() {
        sdkEventsLogger.log("IronSource Initialized")
    }
}

extension VrtcalIronsourceAdaptersWrapper: ISBannerDelegate {
    
    func bannerDidLoad(_ bannerView: ISBannerView!) {
        sdkEventsLogger.log("IronSource bannerDidLoad")
    }
    
    func bannerDidFailToLoadWithError(_ error: Error!) {
        appLogger.log("error: \(String(describing: error))")
        sdkEventsLogger.log("IronSource bannerDidFailToLoadWithError")
    }
    
    func didClickBanner() {
        sdkEventsLogger.log("IronSource didClickBanner")
    }
    
    func bannerWillPresentScreen() {
        sdkEventsLogger.log("IronSource bannerWillPresentScreen")
    }
    
    func bannerDidDismissScreen() {
        sdkEventsLogger.log("IronSource bannerDidDismissScreen")
    }
    
    func bannerWillLeaveApplication() {
        sdkEventsLogger.log("IronSource bannerWillLeaveApplication")
    }
    
    func bannerDidShow() {
        sdkEventsLogger.log("IronSource bannerDidShow")
    }
}
    
extension VrtcalIronsourceAdaptersWrapper: ISInterstitialDelegate {
    
    func interstitialDidLoad() {
        sdkEventsLogger.log("IronSource interstitialDidLoad")
    }
    
    func interstitialDidFailToLoadWithError(_ error: Error!) {
        sdkEventsLogger.log("IronSource interstitialDidFailToLoadWithError: \(String(describing:error))")
    }
    
    func interstitialDidOpen() {
        sdkEventsLogger.log("IronSource interstitialDidOpen")
    }
    
    func interstitialDidClose() {
        sdkEventsLogger.log("IronSource interstitialDidClose")
    }
    
    func interstitialDidShow() {
        sdkEventsLogger.log("IronSource interstitialDidShow")
    }
    
    func interstitialDidFailToShowWithError(_ error: Error!) {
        sdkEventsLogger.log("IronSource interstitialDidFailToShowWithError")
    }
    
    func didClickInterstitial() {
        sdkEventsLogger.log("IronSource didClickInterstitial")
    }
}

    
extension VrtcalIronsourceAdaptersWrapper: ISRewardedVideoDelegate {
    
    func rewardedVideoHasChangedAvailability(_ available: Bool) {
        sdkEventsLogger.log("IronSource rewardedVideoHasChangedAvailability: \(available)")
    }

    func didReceiveReward(forPlacement placementInfo: ISPlacementInfo!) {
        sdkEventsLogger.log("IronSource didReceiveReward forPlacement: \(String(describing: placementInfo))")
    }

    func rewardedVideoDidFailToShowWithError(_ error: Error!) {
        sdkEventsLogger.log("IronSource rewardedVideoDidFailToShowWithError: \(String(describing: error))")
    }

    func rewardedVideoDidOpen() {
        sdkEventsLogger.log("IronSource rewardedVideoDidOpen")
    }

    func rewardedVideoDidClose() {
        sdkEventsLogger.log("IronSource rewardedVideoDidClose")
    }

    func rewardedVideoDidStart() {
        sdkEventsLogger.log("IronSource rewardedVideoDidStart")
    }

    func rewardedVideoDidEnd() {
        sdkEventsLogger.log("IronSource rewardedVideoDidEnd")
    }

    func didClickRewardedVideo(_ placementInfo: ISPlacementInfo!) {
        sdkEventsLogger.log("IronSource didClickRewardedVideo placementInfo: \(String(describing: placementInfo))")
    }
}


extension VrtcalIronsourceAdaptersWrapper: ISRewardedVideoManualDelegate {
    func rewardedVideoDidLoad() {
        sdkEventsLogger.log("IronSource rewardedVideoDidLoad")
    }
    
    func rewardedVideoDidFailToLoadWithError(_ error: Error!) {
        sdkEventsLogger.log("IronSource rewardedVideoDidFailToLoadWithError: \(String(describing: error))")
    }
}


extension VrtcalIronsourceAdaptersWrapper: ISImpressionDataDelegate {
    func impressionDataDidSucceed(_ impressionData: ISImpressionData!) {
        sdkEventsLogger.log("IronSource impressionDataDidSucceed")
    }
}
