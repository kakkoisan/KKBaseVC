//
//  KKVCMacros.h
//  Gia
//
//  Created by 干啥啥不行 吃饭第一名🥇 on 2019/11/8.
//  Copyright © 2019 kakkoi. All rights reserved.
//

#ifndef KKVCMacros_h
#define KKVCMacros_h

#pragma mark - //////////过场动画//////////
//推入推出动画时间
#define KK_PUSH_DURATION        0.22f
#define KK_POP_DURATION         0.22f
//推入动画阈值,超过此值会自动完成
#define KK_VC_THRESHOLD         0.3f
//fromVC偏移量阈值，长度会乘此值
#define KK_PUSH_FROM_THRESHOLD  0.2f

#pragma mark - //////////界面相关//////////

#define KK_SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define KK_SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height


#endif /* KKVCMacros_h */
