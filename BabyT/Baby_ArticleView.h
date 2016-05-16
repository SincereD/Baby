//
//  Baby_ArticleView.h
//  BabyT
//
//  Created by Sincere on 16/5/16.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Baby_ArticleView : UIView

/**
 *  初始化
 *
 *  @param content 文本内容
 *
 *  @return Baby_ArticleView
 */
- (instancetype)initWithContent:(NSString*)content;

/**
 *  计算文本高度
 *
 *  @param str     文本内容
 *  @param font    字体
 *  @param maxSize 最大面积
 *
 *  @return 文本Rect
 */
- (CGSize)sizeWithString:(NSString *)str
                    font:(UIFont *)font
                 maxSize:(CGSize)maxSize;

@end
