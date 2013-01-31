//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import "___FILEBASENAME___.h"
#import "DataStack.h"

@interface ___FILEBASENAMEASIDENTIFIER___ ()

@end

@implementation ___FILEBASENAMEASIDENTIFIER___
RFUIInterfaceOrientationSupportAll

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.managedObjectContext = [DataStack sharedInstance].managedObjectContext;
    NSFetchRequest *aRequest = [[NSFetchRequest alloc] initWithEntityName:<#(NSString *)#>];
    aRequest.predicate = [NSPredicate predicateWithFormat:<#(NSString *), ...#>];
    aRequest.sortDescriptors = @[];
    self.request = aRequest;
    
    __weak __typeof__(self) selfRef = self;
    [self setCellConfigureBlock:^(UITableViewCell *aCell, NSIndexPath *indexPath) {
        ___FILEBASENAMEASIDENTIFIER___Cell *cell = (___FILEBASENAMEASIDENTIFIER___Cell *)aCell;
        id obj = [selfRef.fetchController objectAtIndexPath:indexPath];
        // Do something

    }];
}

#pragma mark - 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    id obj = [self.fetchController objectAtIndexPath:indexPath];
    // Do something
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end

@implementation ___FILEBASENAMEASIDENTIFIER___Cell

@end
