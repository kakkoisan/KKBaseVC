//
//  KKBaseViewController.h
//  Gia
//
//  Created by kakkoi on 2019/8/30.
//  Copyright © 2019 kakkoi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, KKAnimationType) {
    KKAnimationTypePushRight = 0,       //从右侧屏幕push
    KKAnimationTypePushBottom = 1       //从底部push
};

@interface KKBaseViewController : UIViewController

/// 只针对右滑返回
@property (nonatomic ,assign)BOOL canEdgePan;

/// @default KKAnimationTypePushRight
@property (nonatomic, assign)KKAnimationType kkAnimationType;

- (void)showInParentVC:(KKBaseViewController *)parentVC;

@end

NS_ASSUME_NONNULL_END
