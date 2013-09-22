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
        self.layer.masksToBounds = YES;
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
    [self.contentView setBackgroundColor:UIColorFromRGB(SIDE_VIEW_BG_COLOR)];
    
    NSString *cellIdentifier = [self reuseIdentifier];
    
    if ([cellIdentifier isEqualToString:@"SideMenuEtchedCell"] || [cellIdentifier isEqualToString:@"SideMenuEtchedCellLast"])
    {
        CALayer *line = [self lineLayerWithColor:UIColorFromRGB(SIDE_VIEW_ETCH_LIGHT_COLOR)
                                           width:1 x:16 y:1 toX:CGRectGetMaxX(rect)-16 toY:1];
        [self.layer addSublayer:line];
    }
    
    if ([cellIdentifier isEqualToString:@"SideMenuEtchedCell"] || [cellIdentifier isEqualToString:@"SideMenuEtchedCellFirst"])
    {
        CALayer *line = [self lineLayerWithColor:UIColorFromRGB(SIDE_VIEW_ETCH_DARK_COLOR)
                                           width:1 x:16 y:CGRectGetMaxY(rect) toX:CGRectGetMaxX(rect)-16 toY:CGRectGetMaxY(rect)];
        [self.layer addSublayer:line];
    }
}

-(CALayer *)lineLayerWithColor:(UIColor*)color width:(float)width x:(int)x y:(int)y toX:(int)toX toY:(int)toY
{
    CAShapeLayer *lineShape = nil;
    CGMutablePathRef linePath = nil;
    linePath = CGPathCreateMutable();
    lineShape = [CAShapeLayer layer];
    
    lineShape.lineWidth = width;
    lineShape.lineCap = kCALineCapRound;
    lineShape.strokeColor = [color CGColor];
    
    CGPathMoveToPoint(linePath, NULL, x, y);
    CGPathAddLineToPoint(linePath, NULL, toX, toY);
    
    lineShape.path = linePath;
    CGPathRelease(linePath);

    return lineShape;
}

@end
