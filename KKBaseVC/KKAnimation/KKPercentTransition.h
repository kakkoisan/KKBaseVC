//
//  KKPercentTransition.h
//  Gia
//
//  Created by 干啥啥不行 吃饭第一名🥇 on 2019/11/5.
//  Copyright © 2019 kakkoi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KKBaseViewController.h"
#import "KKPresentAnimation.h"

NS_ASSUME_NONNULL_BEGIN

@interface KKPercentTransition : UIPercentDrivenInteractiveTransition

@property(nonatomic, assign)BOOL interacting;

-(void)panToDismiss:(KKBaseViewController *)viewController withAnimationType:(KKAnimationType)type;

@end

NS_ASSUME_NONNULL_END
