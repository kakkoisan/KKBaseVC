//
//  KKAnimationManager.h
//  Gia
//
//  Created by 干啥啥不行 吃饭第一名🥇 on 2019/11/5.
//  Copyright © 2019 kakkoi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KKBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN




@interface KKPresentAnimation : NSObject<UIViewControllerAnimatedTransitioning>

- (instancetype)initWithKKAnimationType:(KKAnimationType)type;

@end

NS_ASSUME_NONNULL_END
