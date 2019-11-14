//
//  KKDismissAnimation.m
//  Gia
//
//  Created by 干啥啥不行 吃饭第一名🥇 on 2019/11/5.
//  Copyright © 2019 kakkoi. All rights reserved.
//

#import "KKDismissAnimation.h"
#import "KKVCMacros.h"
#import "KKBaseViewController.h"

@interface KKDismissAnimation()
//被展示的VC
@property (nonatomic, weak)KKBaseViewController *showedVC;

@end

@implementation KKDismissAnimation

- (instancetype)initWithShowedVC:(KKBaseViewController*)showedVC{
    self = [super init];
    if (self) {
        self.showedVC = showedVC;
    }
    return self;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect fromRect  = [transitionContext initialFrameForViewController:fromVC];
    CGRect toRect = [transitionContext finalFrameForViewController:toVC];
    switch (self.showedVC.kkAnimationType) {
        case KKAnimationTypePushRight:{
            fromRect = CGRectOffset(fromRect, KK_SCREEN_WIDTH, 0);
            break;
        }
        case KKAnimationTypePushBottom:{
            fromRect = CGRectOffset(fromRect, 0, KK_SCREEN_HEIGHT);
        }
        default:
            break;
    }
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    [containerView addSubview:fromVC.view];
    [containerView sendSubviewToBack:toVC.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0f options:UIViewAnimationOptionCurveLinear animations:^{
        fromVC.view.frame = fromRect;
        toVC.view.frame = toRect;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return KK_POP_DURATION;
}

@end
