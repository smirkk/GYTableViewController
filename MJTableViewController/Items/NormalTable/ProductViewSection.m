//
//  ProductViewSection.m
//  MJTableViewController
//
//  Created by admin on 2018/3/19.
//  Copyright © 2018年 高扬. All rights reserved.
//

#import "ProductViewSection.h"

@interface ProductViewSection()

@property(nonatomic,retain)UILabel* titleLabel;
@property(nonatomic,retain)UIView* square;

@end

@implementation ProductViewSection

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:16];
//        _titleLabel.textColor =
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}

-(UIView *)square{
    if (!_square) {
        _square = [[UIView alloc] init];
        _square.backgroundColor = [UIColor orangeColor];
        [self addSubview:_square];
    }
    return _square;
}

-(void)layoutSubviews{
    CGFloat const cellHeight = CGRectGetHeight(self.bounds);
    self.backgroundColor = [UIColor colorWithRed:230/255. green:230/255. blue:230/255. alpha:1];
    //square用懒加载方式添加一个UIView方块，具体创建方式不赘述
    self.square.frame = CGRectMake(0, 0, 5, cellHeight);
    //titleLabel用懒加载方式添加一个普通UILabel，具体创建方式不赘述
    self.titleLabel.frame = CGRectMake(15, 10, 0, 0);
    self.titleLabel.text = self.data;//将外部传入的sectionVo.sectionData显示到标题文本上
    [self.titleLabel sizeToFit];
}

@end
