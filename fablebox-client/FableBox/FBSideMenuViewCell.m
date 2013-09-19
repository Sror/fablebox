//
//  FBSideMenuViewCell.m
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/9/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "FBSideMenuViewCell.h"

@implementation FBSideMenuViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
//        self.layer.masksToBounds = YES;
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)drawRect:(CGRect)rect
{
    NSString *cellIdentifier = [self reuseIdentifier];
    
    if ([cellIdentifier isEqualToString:@"SideMenuEtchedCell"] || [cellIdentifier isEqualToString:@"SideMenuEtchedCellLast"])
    {
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        [UIColorFromRGB(SIDE_VIEW_ETCH_LIGHT_COLOR) setStroke];
        
        CGContextSetLineWidth(context, 2);
        CGContextBeginPath(context);
        CGContextMoveToPoint(context, 16, 1);
        CGContextAddLineToPoint(context, CGRectGetMaxX(rect)-16, 1);
        
        CGContextStrokePath(context);
    }
    
    if ([cellIdentifier isEqualToString:@"SideMenuEtchedCell"] || [cellIdentifier isEqualToString:@"SideMenuEtchedCellFirst"])
    {
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        [UIColorFromRGB(SIDE_VIEW_ETCH_DARK_COLOR) setStroke];
        
        CGContextSetLineWidth(context, 2);
        CGContextBeginPath(context);
        CGContextMoveToPoint(context, 16, CGRectGetMaxY(rect));
        CGContextAddLineToPoint(context, CGRectGetMaxX(rect)-16, CGRectGetMaxY(rect));
        
        CGContextStrokePath(context);
    }
}

@end
