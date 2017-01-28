//
//  ViewController.m
//  CasAuthSample-iOS
//
//  Created by FURUKIEiji on 2017/01/22.
//  Copyright © 2017年 Moi Corporation. All rights reserved.
//

//#import <AppAuth/OIDServiceConfiguration.h>
//#import <AppAuth/OIDAuthState.h>
//#import <AppAuth/OIDAuthorizationRequest.h>
//#import <AppAuth/OIDTokenResponse.h>
#import <AppAuth/AppAuth.h>
#import "ViewController.h"
#import "AppDelegate.h"

static NSString *const kClientID = @"[YOUR-CLIENT-ID]";
static NSString *const kRedirectURI = @"[YOUR-CALLBACK-URL]";

static NSString *const kAuthEndPoint = @"https://apiv2.twitcasting.tv/oauth2/authorize";
static NSString *const kTokenEndPoint = @"https://apiv2.twitcasting.tv/oauth2/access_token";

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTapAuth:(id)sender {
    NSURL *authorizationEndpoint = [NSURL URLWithString:kAuthEndPoint];
    NSURL *tokenEndpoint = [NSURL URLWithString:kTokenEndPoint];
    NSURL *redirectURI = [NSURL URLWithString:kRedirectURI];

    OIDServiceConfiguration *configuration =
            [[OIDServiceConfiguration alloc]
                    initWithAuthorizationEndpoint:authorizationEndpoint
                                    tokenEndpoint:tokenEndpoint];

    // builds authentication request
    OIDAuthorizationRequest *request =
            [[OIDAuthorizationRequest alloc] initWithConfiguration:configuration
                                                          clientId:kClientID
                                                            scopes:nil
                                                       redirectURL:redirectURI
                                                      responseType:OIDResponseTypeCode
                                              additionalParameters:nil];

    // performs authentication request
    AppDelegate *appDelegate =
            (AppDelegate *) [UIApplication sharedApplication].delegate;
    appDelegate.currentAuthorizationFlow =
            [OIDAuthState authStateByPresentingAuthorizationRequest:request
                                           presentingViewController:self
                                                           callback:^(OIDAuthState *_Nullable authState,
                                                                   NSError *_Nullable error) {
                                                               if (authState) {
                                                                   NSLog(@"Got authorization tokens. Access token: %@",
                                                                           authState.lastTokenResponse.accessToken);
                                                                   [self setAuthState:authState];
                                                               } else {
                                                                   NSLog(@"Authorization error: %@", [error localizedDescription]);
                                                                   [self setAuthState:nil];
                                                               }
                                                           }];
}

@end
