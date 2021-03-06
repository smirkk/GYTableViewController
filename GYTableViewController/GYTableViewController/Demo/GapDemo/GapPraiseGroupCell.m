//
//  GapPraiseGroupCell.m
//  GYTableViewController
//
//  Created by 高扬 on 2018/3/26.
//  Copyright © 2018年 高扬. All rights reserved.
//

#import "GapPraiseGroupCell.h"
#import "HotModel.h"
#import "UIImageView+WebCache.h"
#import "PraiseModel.h"

@interface GapPraiseItem : UIControl

@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UIImageView *iconView;//图片
@property (nonatomic, strong) HotModel *hotModel;

@end

@implementation GapPraiseItem

- (UILabel *)titleLable {
    if (!_titleLable) {
        _titleLable = [UICreationUtils createLabel:TVStyle.sizeTextSecondary color:[UIColor whiteColor]];
        [self addSubview:_titleLable];
    }
    return _titleLable;
}

- (UIImageView *)iconView {
    if(!_iconView){
        _iconView = [[UIImageView alloc]init];
        _iconView.contentMode = UIViewContentModeScaleAspectFill;
//        _iconView.layer.masksToBounds = YES;
        [self addSubview:_iconView];
    }
    return _iconView;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:self.hotModel.iconName]];//网络加载图片
    self.iconView.frame = self.bounds;
    
    self.titleLable.text = self.hotModel.title;
    [self.titleLable sizeToFit];
    
    self.titleLable.centerX = self.width / 2.;
    self.titleLable.maxY = self.height - 5;
}

@end

@interface GapPraiseGroupCell()

@property (nonatomic,strong) UILabel *groupTitleLable;
@property (nonatomic,strong) UILabel *groupIconView;

@end

@implementation GapPraiseGroupCell

#pragma mark 根据外部传入数据开始布局
/**
 * 添加三个GapPraiseItem实例，一字排开
 */
- (void)showSubviews {
    self.backgroundColor = [UIColor whiteColor];
    
    PraiseModel *praiseModel = [self getCellData];
    
    CGFloat const toppadding = 50;
    CGFloat const padding = 15;
    CGFloat const gap = 5;
    
    self.groupIconView.text = TVStyle.iconGuanZhu;
    [self.groupIconView sizeToFit];
    
    self.groupTitleLable.text = praiseModel.groupTitle;
    [self.groupTitleLable sizeToFit];
    
    CGFloat const baseX = (self.contentView.width - self.groupIconView.width - gap - self.groupTitleLable.width) / 2.;
    
    self.groupIconView.x = baseX;
    self.groupTitleLable.x = self.groupIconView.maxX + gap;
    self.groupIconView.centerY = self.groupTitleLable.centerY = toppadding / 2.;
    
    
    NSInteger const count = praiseModel.hotModels.count;
    CGFloat const itemWidth = (self.contentView.width - padding * 2 - (count - 1) * gap) / count;
    for (NSInteger i = 0 ; i < count; i++) {
        HotModel* hotModel = praiseModel.hotModels[i];
        GapPraiseItem* item = [[GapPraiseItem alloc]init];
//        item.backgroundColor = [UIColor brownColor];
        [self.contentView addSubview:item];
        item.hotModel = hotModel;
        item.frame = CGRectMake(padding + i * (itemWidth + gap), toppadding, itemWidth, self.height - toppadding - padding);
    }
    
}

- (UILabel *)groupIconView {
    if (!_groupIconView) {
        _groupIconView = [UICreationUtils createLabel:TVStyle.iconFontName size:20 color:TVStyle.colorPrimaryPraise];
        [self.contentView addSubview:_groupIconView];
    }
    return _groupIconView;
}

- (UILabel *)groupTitleLable {
    if (!_groupTitleLable) {
        _groupTitleLable = [UICreationUtils createLabel:TVStyle.sizeTextPrimary color:TVStyle.colorPrimaryPraise];
        [self.contentView addSubview:_groupTitleLable];
    }
    return _groupTitleLable;
}

@end
