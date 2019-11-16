//
//  KKAnimationManager.m
//  Gia
//
//  Created by 干啥啥不行 吃饭第一名🥇 on 2019/11/5.
//  Copyright © 2019 kakkoi. All rights reserved.
//

#import "KKPresentAnimation.h"
#import "KKVCMacros.h"

@interface KKPresentAnimation()

@property(nonatomic, assign) KKAnimationType animationType;

@end

@implementation KKPresentAnimation

- (instancetype)initWithKKAnimationType:(KKAnimationType)type{
    self = [super init];
    if (self) {
        self.animationType = type;
    }
    return self;
}

#pragma mark - UIViewControllerAnimatedTransitioning
- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    //1、获取目标VC
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    //2、位置计算
    //toVC最终位置
    CGRect toRect = [transitionContext finalFrameForViewController:toVC];
    //fromVC初始位置
    CGRect fromRect = [transitionContext initialFrameForViewController:fromVC];
    switch (self.animationType) {
        case KKAnimationTypePushRight:{
            toVC.view.frame = CGRectOffset(toRect, KK_SCREEN_WIDTH, 0);
            fromRect = CGRectOffset(fromRect, -KK_SCREEN_WIDTH*KK_PUSH_FROM_THRESHOLD, 0);
            break;
        }
        case KKAnimationTypePushBottom:{
            toVC.view.frame = CGRectOffset(toRect, 0, KK_SCREEN_HEIGHT);
        }
        default:
            break;
    }
    
    //3、将view添加到containerView中
    [[transitionContext containerView] addSubview:fromVC.view];
    [[transitionContext containerView] addSubview:toVC.view];
    //4、开始动画
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0  options:UIViewAnimationOptionCurveLinear animations:^{
        toVC.view.frame = toRect;
        fromVC.view.frame = fromRect;
        fromVC.view.alpha = 0.8;
    } completion:^(BOOL finished) {
        //5、报告完成
        [transitionContext completeTransition:YES];
    }];
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return KK_PUSH_DURATION;
}

@end
