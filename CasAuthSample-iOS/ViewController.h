//
//  ViewController.h
//  CasAuthSample-iOS
//
//  Created by FURUKIEiji on 2017/01/22.
//  Copyright © 2017年 Moi Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OIDAuthState;

@interface ViewController : UIViewController

@property(nonatomic, strong, nullable) OIDAuthState *authState;

@end

