//
//  KKPercentTransition.m
//  Gia
//
//  Created by 干啥啥不行 吃饭第一名🥇 on 2019/11/5.
//  Copyright © 2019 kakkoi. All rights reserved.
//

#import "KKPercentTransition.h"
#import "KKVCMacros.h"

@interface KKPercentTransition()

@property(nonatomic, strong)UIViewController *presentedVC;
@property(nonatomic, assign)CGFloat progress;

@end

@implementation KKPercentTransition

-(void)panToDismiss:(KKBaseViewController *)viewController withAnimationType:(KKAnimationType)type{
    self.presentedVC = viewController;
    if (viewController.canEdgePan) {
        UIScreenEdgePanGestureRecognizer *leftEdgePanGesture = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(edgePanGestureAction:)];
        if (type == KKAnimationTypePushRight) {
            leftEdgePanGesture.edges = UIRectEdgeLeft;
            [self.presentedVC.view addGestureRecognizer:leftEdgePanGesture];
        }
    }
}

- (void)edgePanGestureAction:(UIScreenEdgePanGestureRecognizer *)gesture{
    UIView *view = [self.presentedVC.view hitTest:[gesture locationInView:gesture.view] withEvent:nil];
    CGPoint translation = [gesture translationInView:view];
    
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:{
            self.interacting = YES;
            [self.presentedVC dismissViewControllerAnimated:YES completion:nil];
            break;
        }
        case UIGestureRecognizerStateChanged:{
            self.progress = (translation.x/KK_SCREEN_WIDTH) <= 1 ? (translation.x/KK_SCREEN_WIDTH):1;
            [self updateInteractiveTransition:self.progress];
            break;
        }
        case UIGestureRecognizerStateEnded:{
            self.interacting = NO;
            if (self.progress >= KK_VC_THRESHOLD) {
                [self finishInteractiveTransition];
            }else{
                [self cancelInteractiveTransition];
            }
            break;
        }
        default:
            break;
    }
}

@end
