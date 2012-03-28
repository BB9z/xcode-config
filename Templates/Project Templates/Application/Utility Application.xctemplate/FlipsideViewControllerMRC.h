//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ___VARIABLE_classPrefix:identifier___FlipsideViewController;

@protocol ___VARIABLE_classPrefix:identifier___FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(___VARIABLE_classPrefix:identifier___FlipsideViewController *)controller;
@end

@interface ___VARIABLE_classPrefix:identifier___FlipsideViewController : UIViewController

@property (assign, nonatomic) id <___VARIABLE_classPrefix:identifier___FlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
