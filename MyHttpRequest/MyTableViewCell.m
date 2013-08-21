//
//  MyTableViewCell.m
//  MyHttpRequest
//
//  Created by Dong JiaLi on 12-12-26.
//  Copyright (c) 2012年 Dong JiaLi. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell
@synthesize labelText=labelText_;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setLabelText:(NSString *)labelText
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.origin.x+20, self.center.y-10, 100, 20)];
    label.text = labelText;
    label.backgroundColor = ColorClear;
    label.font = [UIFont systemFontOfSize:20];
    label.textColor = [UIColor blueColor];
    [self.contentView addSubview:label];
    [label release];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc{
    [super dealloc];
}

@end
