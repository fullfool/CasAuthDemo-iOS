//
//  AppDelegate.h
//  CasAuthSample-iOS
//
//  Created by FURUKIEiji on 2017/01/22.
//  Copyright © 2017年 Moi Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OIDAuthorizationFlowSession;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property(nonatomic, strong, nullable) id<OIDAuthorizationFlowSession> currentAuthorizationFlow;

@end

