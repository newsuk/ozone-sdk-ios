/*   Copyright 2019-2022 Prebid.org, Inc.
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import "InAppVideoBannerViewController.h"
#import "PrebidDemoMacros.h"

NSString * const storedResponseRenderingVideoBannerInApp = @"response-prebid-video-outstream";
NSString * const storedImpVideoBannerInApp = @"imp-prebid-video-outstream";

@interface InAppVideoBannerViewController ()

// Prebid
@property (nonatomic) BannerView * prebidBannerView;

@end

@implementation InAppVideoBannerViewController

- (void)loadView {
    [super loadView];
    
    Prebid.shared.storedAuctionResponse = storedResponseRenderingVideoBannerInApp;
    [self createAd];
}

- (void)createAd {
    // Setup Prebid ad unit
    self.prebidBannerView = [[BannerView alloc] initWithFrame:CGRectMake(0, 0, self.adSize.width, self.adSize.height) configID:storedImpVideoBannerInApp adSize:self.adSize];
    self.prebidBannerView.delegate = self;
    self.prebidBannerView.adFormat = AdFormat.video;
    self.prebidBannerView.videoParameters.placement = PBPlacement.InBanner;
    
    self.bannerView.backgroundColor = [UIColor clearColor];
    [self.bannerView addSubview:self.prebidBannerView];
    
    // Load ad
    [self.prebidBannerView loadAd];
}

// MARK: - BannerViewDelegate

- (UIViewController *)bannerViewPresentationController {
    return self;
}

- (void)bannerView:(BannerView *)bannerView didFailToReceiveAdWith:(NSError *)error {
    PBMLogError(@"%@", error.localizedDescription);
}

@end