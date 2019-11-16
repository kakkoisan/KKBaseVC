//
//  KKBaseViewController.m
//  Gia
//
//  Created by kakkoi on 2019/8/30.
//  Copyright © 2019 kakkoi. All rights reserved.
//

#import "KKBaseViewController.h"
//#import "ThemeManager.h"
#import "KKPresentAnimation.h"
#import "KKPercentTransition.h"
#import "KKDismissAnimation.h"
#import "KKVCMacros.h"

@interface KKBaseViewController ()<UIViewControllerTransitioningDelegate>

@property(nonatomic, strong)KKPresentAnimation *presentAnimation;
@property(nonatomic, strong)KKDismissAnimation *dismissAnimation;
@property(nonatomic, strong)KKPercentTransition *percentTransition;

@property(nonatomic, weak)KKBaseViewController *nextVC;

@end

@implementation KKBaseViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        self.canEdgePan = YES;
        self.kkAnimationType = KKAnimationTypePushRight;
        
        //        阴影
        CALayer *layer = [self.view layer];
        layer.shadowOffset = CGSizeMake(-5, 0);
        layer.shadowColor = [[UIColor blackColor] CGColor];
        layer.shadowRadius = 5.0f;
        layer.shadowOpacity = 0.2;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
//    self.navigationController.navigationBar.barTintColor = [[ThemeManager sharedManager]themeColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.titleTextAttributes = @{
        NSForegroundColorAttributeName:[UIColor whiteColor]};
}

- (void)showInParentVC:(KKBaseViewController *)parentVC{
    //设置parentVC的转场代理
    parentVC.presentAnimation = [[KKPresentAnimation alloc]initWithKKAnimationType:self.kkAnimationType];
    parentVC.dismissAnimation = [[KKDismissAnimation alloc]initWithShowedVC:self];
    parentVC.percentTransition = [[KKPercentTransition alloc]init];
    
    self.modalPresentationStyle = UIModalPresentationFullScreen;
    self.transitioningDelegate = parentVC;
    
    parentVC.nextVC = self;
    [parentVC.childViewControllers arrayByAddingObject:self];
    [parentVC.percentTransition panToDismiss:self withAnimationType:self.kkAnimationType];
    [parentVC presentViewController:self animated:YES completion:nil];
}

- (void)toBack{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - //////////UIViewControllerTransitioningDelegate//////////

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return self.presentAnimation;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(KKBaseViewController *)dismissed{
    return self.dismissAnimation;
}


- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator{
    if (self.nextVC.canEdgePan) {
        return self.percentTransition.interacting?self.percentTransition:nil;
    }else{
        return nil;
    }
}

@end
