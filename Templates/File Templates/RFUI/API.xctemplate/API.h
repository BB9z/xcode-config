//
//  API.h
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import "DataStack.h"
#import "AFNetworking.h"

@interface API : NSObject
+ (API *)sharedInstance;

@property (RF_STRONG, nonatomic) AFHTTPClient *core;
@property (readonly, nonatomic, getter = isNetworkReachable) BOOL networkReachable;
@property (readonly, nonatomic) NSString *macAddress;

- (void)requestUpdate;
@property (readonly, nonatomic, getter = isUpdating) BOOL updating;
// 应用启动后，会在网络可用时执行一次自动同步的操作
@property (assign, nonatomic) BOOL hasAutoSynced;

- (void)loginWithUserName:(NSString *)name pass:(NSString *)pass callback:(void (^)(BOOL success, NSString *message))callback;

@end

static NSString *const UDkUserName = @"User Name";
static NSString *const UDkUserPass = @"User Password";
static NSString *const UDkUserRemeberPass = @"User Password Remeber";
