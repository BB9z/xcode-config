
#import "___FILEBASENAME___.h"

@implementation ___FILEBASENAMEASIDENTIFIER___

- (void)awakeFromNib {
    self.selectionStyle = UITableViewCellSelectionStyleBlue;
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

- (id)initWithNibName:(NSString *)cellNibName {
    return [[[NSBundle mainBundle] loadNibNamed:cellNibName owner:self options:nil] firstObject];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
