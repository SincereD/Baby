//
//  Baby_ToolBoxViewController.m
//  BabyT
//
//  Created by Sincere on 16/3/10.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import "Baby_ToolBoxViewController.h"
#define UIScreenHeight ([[UIScreen mainScreen] bounds].size.height)
#define UIScreenWidth ([[UIScreen mainScreen] bounds].size.width)
@interface Baby_ToolBoxViewController ()
{
    CGPoint GameCenter;
    CGPoint HuiheCenter;
    CGPoint FriendCenter;
    CGPoint YaoqinCenter;
    CGPoint TiaozhanCenter;
}
@property (assign,nonatomic) NSInteger mTapTag;
@end

@implementation Baby_ToolBoxViewController

bool mTapIsFinish=NO;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"百宝箱"];
    [self.view setClipsToBounds:YES];
    [self addRuchangAnimation];
    [_mYaoqinButton addTarget:self action:@selector(buttonTapAnimation:) forControlEvents:UIControlEventTouchDown];
    [_mGameButton addTarget:self action:@selector(buttonTapAnimation:) forControlEvents:UIControlEventTouchDown];
    [_mHuiheButton addTarget:self action:@selector(buttonTapAnimation:) forControlEvents:UIControlEventTouchDown];
    [_mFriendButton addTarget:self action:@selector(buttonTapAnimation:) forControlEvents:UIControlEventTouchDown];
    [_mTiaozhangButton addTarget:self action:@selector(buttonTapAnimation:) forControlEvents:UIControlEventTouchDown];
}

#pragma  mark ----动画----
/**
 *  气泡入场动画
 */
-(void)addRuchangAnimation{
    //初始化气泡位置------------------------
    _mGameButton.frame=CGRectMake(96, UIScreenHeight+128, 128, 128);
    _mHuiheButton.frame=CGRectMake(-90, 0, 90, 90);
    _mYaoqinButton.frame=CGRectMake(UIScreenWidth+84, 0, 84, 84);
    _mTiaozhangButton.frame=CGRectMake(-94, UIScreenHeight+94, 94, 94);
    _mFriendButton.frame=CGRectMake(UIScreenWidth+90, UIScreenHeight+90, 90, 90);
    
    GameCenter=CGPointMake(96+64, UIScreenHeight+128+64);
    HuiheCenter=CGPointMake(-90+45, 45);
    YaoqinCenter=CGPointMake(UIScreenWidth+84+42, 42);
    TiaozhanCenter=CGPointMake(-94+94/2, UIScreenHeight+94+94/2);
    FriendCenter=CGPointMake(UIScreenWidth+90+45, UIScreenHeight+90+45);
    
    //添加动画------------------------
    //游戏气泡
    CABasicAnimation *mGameAnimation=[CABasicAnimation animationWithKeyPath:@"position"];
    mGameAnimation.fromValue=[NSValue valueWithCGPoint:_mGameButton.layer.position];
    mGameAnimation.toValue=[NSValue valueWithCGPoint:CGPointMake(_mGameButton.layer.position.x, 300+64)];
    mGameAnimation.repeatCount=1;
    mGameAnimation.duration=2.0;
    mGameAnimation.fillMode=kCAFillModeForwards;
    mGameAnimation.removedOnCompletion=NO;
    mGameAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [_mGameButton.layer addAnimation:mGameAnimation forKey:@"Game_Ruchang"];
    //回合气泡
    CABasicAnimation *mHuiheAnimation=[CABasicAnimation animationWithKeyPath:@"position"];
    mHuiheAnimation.fromValue=[NSValue valueWithCGPoint:_mHuiheButton.layer.position];
    mHuiheAnimation.toValue=[NSValue valueWithCGPoint:CGPointMake(31+90/2, 247+90/2)];
    mHuiheAnimation.repeatCount=1;
    mHuiheAnimation.duration=2.0;
    mHuiheAnimation.fillMode=kCAFillModeForwards;
    mHuiheAnimation.removedOnCompletion=NO;
    mHuiheAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [_mHuiheButton.layer addAnimation:mHuiheAnimation forKey:@"Huihe_Ruchang"];
    //邀请气泡
    CABasicAnimation *mYaoqinAnimation=[CABasicAnimation animationWithKeyPath:@"position"];
    mYaoqinAnimation.fromValue=[NSValue valueWithCGPoint:_mYaoqinButton.layer.position];
    mYaoqinAnimation.toValue=[NSValue valueWithCGPoint:CGPointMake(192+84/2, 259+84/2)];
    mYaoqinAnimation.repeatCount=1;
    mYaoqinAnimation.duration=2.0;
    mYaoqinAnimation.fillMode=kCAFillModeForwards;
    mYaoqinAnimation.removedOnCompletion=NO;
    mYaoqinAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [_mYaoqinButton.layer addAnimation:mYaoqinAnimation forKey:@"Yaoqin_Ruchang"];
    //挑战气泡
    CABasicAnimation *mTiaoZhangAnimation=[CABasicAnimation animationWithKeyPath:@"position"];
    mTiaoZhangAnimation.fromValue=[NSValue valueWithCGPoint:_mTiaozhangButton.layer.position];
    mTiaoZhangAnimation.toValue=[NSValue valueWithCGPoint:CGPointMake(53+94/2, 389+94/2)];
    mTiaoZhangAnimation.repeatCount=1;
    mTiaoZhangAnimation.duration=2.0;
    mTiaoZhangAnimation.fillMode=kCAFillModeForwards;
    mTiaoZhangAnimation.removedOnCompletion=NO;
    mTiaoZhangAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [_mTiaozhangButton.layer addAnimation:mTiaoZhangAnimation forKey:@"TiaoZhang_Ruchang"];
    //朋友气跑
    CABasicAnimation *mFriendAnimation=[CABasicAnimation animationWithKeyPath:@"position"];
    mFriendAnimation.fromValue=[NSValue valueWithCGPoint:_mFriendButton.layer.position];
    mFriendAnimation.toValue=[NSValue valueWithCGPoint:CGPointMake(198+90/2, 379+90/2)];
    mFriendAnimation.repeatCount=1;
    mFriendAnimation.duration=2.0;
    mFriendAnimation.fillMode=kCAFillModeForwards;
    mFriendAnimation.removedOnCompletion=NO;
    mFriendAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [_mFriendButton.layer addAnimation:mFriendAnimation forKey:@"Friend_Ruchang"];
    
    
    //动画结束之后，需改变气泡变换后位置,否则无法触发点击事件
    [self performSelector:@selector(changeRuchangPosition) withObject:nil afterDelay:2.0];
    [self performSelector:@selector(addFudongAnimation) withObject:nil afterDelay:2.0];
}
/**
 *  改变入场动画执行后的各视图位置
 */
-(void) changeRuchangPosition{
    _mGameButton.frame=CGRectMake(96, 300, 128, 128);
    _mHuiheButton.frame=CGRectMake(31, 247, 90, 90);
    _mYaoqinButton.frame=CGRectMake(192, 259, 84, 84);
    _mTiaozhangButton.frame=CGRectMake(53, 389, 94, 94);
    _mFriendButton.frame=CGRectMake(198, 379, 90, 90);
}
/**
 *  改变出场动画执行后位置
 */
-(void) changeChuchangPosition{
    _mGameButton.center=GameCenter;
    _mFriendButton.center=FriendCenter;
    _mHuiheButton.center=HuiheCenter;
    _mTiaozhangButton.center=TiaozhanCenter;
    _mYaoqinButton.center=YaoqinCenter;
}
/**
 *  添加出场动画
 */
-(void) addChuChangAnimation{
    //游戏
    CAKeyframeAnimation *mGameAnim=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    mGameAnim.values=@[[NSValue valueWithCGPoint:_mGameButton.layer.position],[NSValue valueWithCGPoint:CGPointMake(_mGameButton.layer.position.x, _mGameButton.layer.position.y-50)],[NSValue valueWithCGPoint:GameCenter]];
    mGameAnim.repeatCount=1;
    mGameAnim.duration=2.0;
    mGameAnim.fillMode=kCAFillModeForwards;
    mGameAnim.removedOnCompletion=NO;
    mGameAnim.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [_mGameButton.layer addAnimation:mGameAnim forKey:nil];
    //回合
    CAKeyframeAnimation *mHuiheAnim=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    mHuiheAnim.values=@[[NSValue valueWithCGPoint:_mHuiheButton.layer.position],[NSValue valueWithCGPoint:CGPointMake(_mHuiheButton.layer.position.x+30, _mHuiheButton.layer.position.y+30)],[NSValue valueWithCGPoint:HuiheCenter]];
    mHuiheAnim.repeatCount=1;
    mHuiheAnim.duration=2.0;
    mHuiheAnim.fillMode=kCAFillModeForwards;
    mHuiheAnim.removedOnCompletion=NO;
    mHuiheAnim.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [_mHuiheButton.layer addAnimation:mHuiheAnim forKey:nil];
    //邀请
    CAKeyframeAnimation *mYaoqinAnim=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    mYaoqinAnim.values=@[[NSValue valueWithCGPoint:_mYaoqinButton.layer.position],[NSValue valueWithCGPoint:CGPointMake(_mYaoqinButton.layer.position.x-30, _mYaoqinButton.layer.position.y+30)],[NSValue valueWithCGPoint:YaoqinCenter]];
    mYaoqinAnim.repeatCount=1;
    mYaoqinAnim.duration=2.0;
    mYaoqinAnim.fillMode=kCAFillModeForwards;
    mYaoqinAnim.removedOnCompletion=NO;
    mYaoqinAnim.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [_mYaoqinButton.layer addAnimation:mYaoqinAnim forKey:nil];
    //挑战
    CAKeyframeAnimation *mTiaozhanAnim=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    mTiaozhanAnim.values=@[[NSValue valueWithCGPoint:_mTiaozhangButton.layer.position],[NSValue valueWithCGPoint:CGPointMake(_mTiaozhangButton.layer.position.x+30, _mTiaozhangButton.layer.position.y-30)],[NSValue valueWithCGPoint:TiaozhanCenter]];
    mTiaozhanAnim.repeatCount=1;
    mTiaozhanAnim.duration=2.0;
    mTiaozhanAnim.fillMode=kCAFillModeForwards;
    mTiaozhanAnim.removedOnCompletion=NO;
    mTiaozhanAnim.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [_mTiaozhangButton.layer addAnimation:mTiaozhanAnim forKey:nil];
    //朋友
    CAKeyframeAnimation *mFriendAnim=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    mFriendAnim.values=@[[NSValue valueWithCGPoint:_mFriendButton.layer.position],[NSValue valueWithCGPoint:CGPointMake(_mFriendButton.layer.position.x-30, _mFriendButton.layer.position.y-30)],[NSValue valueWithCGPoint:FriendCenter]];
    mFriendAnim.repeatCount=1;
    mFriendAnim.duration=2.0;
    mFriendAnim.fillMode=kCAFillModeForwards;
    mFriendAnim.removedOnCompletion=NO;
    mFriendAnim.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [_mFriendButton.layer addAnimation:mFriendAnim forKey:nil];
    
    
    [self performSelector:@selector(changeChuchangPosition) withObject:nil afterDelay:2.0];
}
/**
 *  移除所有动画
 */
-(void) removeAllAnimation{
    [_mGameButton.layer removeAllAnimations];
    [_mFriendButton.layer removeAllAnimations];
    [_mYaoqinButton.layer removeAllAnimations];
    [_mHuiheButton.layer removeAllAnimations];
    [_mTiaozhangButton.layer removeAllAnimations];
}
/**
 *  浮动动画
 */
-(void)addFudongAnimation{
    [self removeAllAnimation];
    
    [_mYaoqinButton setAdjustsImageWhenHighlighted:NO];
    [_mGameButton setAdjustsImageWhenHighlighted:NO];
    [_mHuiheButton setAdjustsImageWhenHighlighted:NO];
    [_mFriendButton setAdjustsImageWhenHighlighted:NO];
    [_mTiaozhangButton setAdjustsImageWhenHighlighted:NO];
    
    [self addAniamtionLikeGameCenterBubble:_mYaoqinButton];
    [self addAniamtionLikeGameCenterBubble:_mHuiheButton];
    [self addAniamtionLikeGameCenterBubble:_mGameButton];
    [self addAniamtionLikeGameCenterBubble:_mFriendButton];
    [self addAniamtionLikeGameCenterBubble:_mTiaozhangButton];
    _mYaoqinButton.layer.speed=0.8;
    _mFriendButton.layer.speed=0.9;
    _mHuiheButton.layer.speed=0.7;
    _mTiaozhangButton.layer.speed=0.6;
}
/**
 *  添加浮动动画
 *
 *  @param mView 添加动画的视图
 */
-(void)addAniamtionLikeGameCenterBubble:(UIView *)mView{
    
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.calculationMode = kCAAnimationPaced;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.repeatCount = INFINITY;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    pathAnimation.duration = 5.0;
    
    CGMutablePathRef curvedPath = CGPathCreateMutable();
    CGRect circleContainer = CGRectInset(mView.frame, mView.bounds.size.width / 2 - 3, mView.bounds.size.width / 2 - 3);
    CGPathAddEllipseInRect(curvedPath, NULL, circleContainer);
    
    pathAnimation.path = curvedPath;
    CGPathRelease(curvedPath);
    [mView.layer addAnimation:pathAnimation forKey:@"myCircleAnimation"];
    
    
    CAKeyframeAnimation *scaleX = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.x"];
    scaleX.duration = 4.0;
    scaleX.values = @[@1.0, @1.1, @1.0];
    scaleX.repeatCount = INFINITY;
    scaleX.autoreverses = YES;
    
    scaleX.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [mView.layer addAnimation:scaleX forKey:@"scaleXAnimation"];
    
    
    CAKeyframeAnimation *scaleY = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.y"];
    scaleY.duration = 4.5;
    scaleY.values = @[@1.0, @1.1, @1.0];
    scaleY.repeatCount = INFINITY;
    scaleY.autoreverses = YES;
    scaleX.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [mView.layer addAnimation:scaleY forKey:@"scaleYAnimation"];
}
/**
 *  手指点击按钮动画
 *
 *  @param view 按钮
 */
-(void) buttonTapAnimation:(UIView *)view{
    CAKeyframeAnimation *scale=[CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    scale.duration=1.0;
    scale.values=@[@0.7,@1.0,@0.8,@1.0];
    scale.repeatCount=1;
    scale.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    scale.delegate=self;
    [view.layer addAnimation:scale forKey:@"TapAnimation"];
    _mTapTag=view.tag;
}
/**
 *  手指离开按钮动画
 *
 *  @param view
 */
-(void) buttonUpInsideAnimation:(UIView *)view{
    [self removeAllAnimation];
    [self addChuChangAnimation];
}
#pragma mark ----按钮事件---
- (IBAction)tiaozhangAction:(UIButton *)sender {
    if (mTapIsFinish==YES) {
        [self buttonUpInsideAnimation:sender];
    }
}

- (IBAction)youxiAction:(UIButton *)sender {
    if (mTapIsFinish==YES) {
        [self buttonUpInsideAnimation:sender];
    }
    
}

- (IBAction)huiheAction:(UIButton *)sender {
    if (mTapIsFinish==YES) {
        [self buttonUpInsideAnimation:sender];
    }
}

- (IBAction)yaoqingAction:(UIButton *)sender {
    if (mTapIsFinish==YES) {
        [self buttonUpInsideAnimation:sender];
    }
    
}

- (IBAction)friendAction:(UIButton *)sender {
    if (mTapIsFinish==YES) {
        [self buttonUpInsideAnimation:sender];
    }
    
}

#pragma mark -----动画监听事件----
-(void)animationDidStart:(CAAnimation *)anim{
    mTapIsFinish=NO;
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    mTapIsFinish=YES;
    NSLog(@"%ld",(long)_mTapTag);
    switch (_mTapTag) {
        case 0:
            if (_mGameButton.state==UIControlStateNormal) {
                [self performSelector:@selector(youxiAction:) withObject:_mGameButton];
            }
            break;
        case 1:
            if (_mHuiheButton.state==UIControlStateNormal) {
                [self performSelector:@selector(huiheAction:) withObject:_mHuiheButton];
            }
            break;
        case 2:
            if (_mYaoqinButton.state==UIControlStateNormal) {
                [self performSelector:@selector(yaoqingAction:) withObject:_mYaoqinButton];
            }
            break;
        case 3:
            if (_mTiaozhangButton.state==UIControlStateNormal) {
                [self performSelector:@selector(tiaozhangAction:) withObject:_mTiaozhangButton];
            }
            break;
        case 4:
            if (_mFriendButton.state==UIControlStateNormal) {
                [self performSelector:@selector(friendAction:) withObject:_mFriendButton];
            }
            break;
        default:
            break;
    }
}
//暂停动画
-(void)pauseLayer:(CALayer*)layer{
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
    NSLog(@"%f",pausedTime);
}
//开始动画
-(void)resumeLayer:(CALayer*)layer{
    CFTimeInterval pausedTime = [layer timeOffset];
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    layer.beginTime = timeSincePause;
    NSLog(@"%f",timeSincePause);
}

@end
