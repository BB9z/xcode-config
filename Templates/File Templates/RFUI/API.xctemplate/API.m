
#import "API.h"

#import "AFHTTPRequestOperationLogger.h"

#import "NSJSONSerialization+RFKit.h"
#import "NSDateFormatter+RFKit.h"
#import "UIDevice+RFKit.h"
#import "UIAlertView+RFKit.h"

static NSString *const UDkLastUpdateCheckTime = @"Last Update Check Time";
static NSString *const CPkAutoUpdateCheckInterval = @"Auto Update Check Interval";

#define DebugAPIUpdateForceAutoUpdate 0
static NSString *const APIURLDeployBase = @"http://example.com";
static NSString *const APIURLLogin = @"/no";


@interface API ()
<UIAlertViewDelegate>
@property (RF_STRONG, nonatomic) NSDictionary *configInfo;

@property (readwrite, nonatomic) BOOL updating;
- (void)doUpdate;

@end

@implementation API

- (NSString *)macAddress {
    static NSString *_macAddress = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _macAddress =  [UIDevice macAddress];
    });
	return _macAddress;
}

- (NSDictionary *)configInfo {
    if (!_configInfo) {
        NSDictionary *config = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"config" ofType:@"plist"]];
        _configInfo = config[@"API"];
    }
    return _configInfo;
}

- (BOOL)isNetworkReachable {
    return (self.core.networkReachabilityStatus != AFNetworkReachabilityStatusNotReachable)? : NO;
}

#pragma mark -
+ (instancetype)sharedInstance {
	static API* sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        sharedInstance = [[self alloc] init];
    });
	return sharedInstance;
}

- (id)init {
    self = [super init];
    if (self) {
        // 设置属性
        
        // 配置网络
        if (DEBUG) {
            [[AFHTTPRequestOperationLogger sharedLogger] startLogging];
        }
        [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
        _core = [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:APIURLDeployBase]];
        
        // 设置环境监听
        __weak __typeof__(self) selfRef = self;
        [_core setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            if (status == AFNetworkReachabilityStatusReachableViaWiFi) {
                if (!selfRef.hasAutoSynced) {

                    [selfRef autoUpdate];
                    selfRef.hasAutoSynced = NO;
                }
            }
        }];
        
        // 后续操作
        [self contextCheck];
    }
    return self;
}

- (void)contextCheck {
    @autoreleasepool {

    }
}

#pragma mark -
- (void)requestUpdate {
    if (!self.isUpdating) {
        [self doUpdate];
    }
}

- (void)autoUpdate {
    NSDate *lastUpdateCheckTime = [[NSUserDefaults standardUserDefaults] objectForKey:UDkLastUpdateCheckTime];
    
    if (lastUpdateCheckTime && !DebugAPIUpdateForceAutoUpdate) {
        NSTimeInterval updateCheckInterval = [self.configInfo doubleForKey:CPkAutoUpdateCheckInterval];
        if (fabs([lastUpdateCheckTime timeIntervalSinceNow]) < updateCheckInterval) return;
    }
    
    if (self.isNetworkReachable) {
        dout_info(@"Start auto update.");
        [self doUpdate];
    }
}

- (void)doUpdate {
    self.updating = YES;
    [[NSUserDefaults standardUserDefaults] setObject:[NSDate date] forKey:UDkLastUpdateCheckTime];
    
    if (!self.isNetworkReachable) {
        [UIAlertView showWithTitle:@"提示" message:@"可能尚未联网，请检查你的网络连接" buttonTitle:@"OK"];
    }
    
    // TODO: 更新操作
}

#pragma mark - 更新结束
/// 执行更新后的工作，需保证必定能被调用
- (void)afterUpdate {
    dout_info(@"更新完毕")
    
    self.updating = NO;
}

#pragma mark - 
- (void)loginWithUserName:(NSString *)name pass:(NSString *)pass callback:(void (^)(BOOL success, NSString *message))callback {
    if (!callback) return;
    
    NSString *userName = name;
    if (self.isNetworkReachable) {
        [self.core postPath:APIURLLogin parameters:@{
         @"login" : userName,
         @"password" : pass,
         @"mac_address" : self.macAddress
         } success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSDictionary *info = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
             douto(info)
             if ([info boolForKey:@"status"]) {
                 callback(YES, info[@"msg"]);
             }
             else {
                 callback(NO, info[@"msg"]);
             }
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             callback(NO, error.localizedDescription);
         }];
    }
    else {
        // 离线登陆
        if ([[[NSUserDefaults standardUserDefaults] stringForKey:UDkUserName] isEqualToString:name]
            && [[[NSUserDefaults standardUserDefaults] stringForKey:UDkUserPass] isEqualToString:pass]) {
            callback(YES, @"OK");
        }
        else {
            callback(NO, @"用户名与密码不匹配");
        }
    }
}

@end
