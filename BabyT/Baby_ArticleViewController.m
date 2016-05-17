//
//  Baby_ArticleViewController.m
//  BabyT
//
//  Created by Sincere on 16/4/22.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import "Baby_ArticleViewController.h"
#import "Baby_Animation.h"
#import "Baby_ArticleView.h"

@interface Baby_ArticleViewController ()<UINavigationControllerDelegate,UIViewControllerTransitioningDelegate>
{
    Baby_ArticleView * _articleView;
}

@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *percentDrivenTransition;

@end

@implementation Baby_ArticleViewController

- (instancetype)initWithData:(Baby_MainNotificationData*)data
{
    if (self = [super init])
    {
        _data = data;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//     self.navigationController.delegate = self;
    [self.navigationItem setRightBarButtonItems:[self rightItems] animated:YES];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setTitle:_data.article_title];
    [self setup];
    [self initContentView];
}

- (NSArray*)rightItems
{
 
    UIButton * saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [saveBtn setFrame:CGRectMake(0, 0, 20, 20)];
    [saveBtn setBackgroundImage:[UIImage imageNamed:@"文章收藏.png"] forState:UIControlStateNormal];
    [saveBtn addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [shareBtn setFrame:CGRectMake(0, 0, 20, 20)];
    [shareBtn setBackgroundImage:[UIImage imageNamed:@"文章分享.png"] forState:UIControlStateNormal];
    [shareBtn addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * saveItem = [[UIBarButtonItem alloc] initWithCustomView:saveBtn];
    UIBarButtonItem * shareItem = [[UIBarButtonItem alloc] initWithCustomView:shareBtn];
    return @[saveItem,shareItem];
}

- (void)initContentView
{
    _articleView = [[Baby_ArticleView alloc] initWithContent:_data.content];
    [self.view addSubview:_articleView];
}

- (void)save
{
    
}

- (void)share
{
    
}

- (void)setup
{
    UIScreenEdgePanGestureRecognizer *edgePanGestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(edgePanGesture:)];
    edgePanGestureRecognizer.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:edgePanGestureRecognizer];
}

- (void)edgePanGesture:(UIScreenEdgePanGestureRecognizer *)recognizer
{
    
    CGFloat progress = [recognizer translationInView:self.view].x / (ScreenWidth * 1.0);
    
    if (recognizer.state == UIGestureRecognizerStateBegan)
    {
        
        self.percentDrivenTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
        [self.navigationController popViewControllerAnimated:YES];
    }
    else if (recognizer.state == UIGestureRecognizerStateChanged)
    {
        
        [self.percentDrivenTransition updateInteractiveTransition:progress];
        
    }
    else if (recognizer.state == UIGestureRecognizerStateCancelled || recognizer.state == UIGestureRecognizerStateEnded)
    {
        
        if (progress > 0.5)
        {
            [self.percentDrivenTransition finishInteractiveTransition];
        }
        else
        {
            [self.percentDrivenTransition cancelInteractiveTransition];
        }
        self.percentDrivenTransition = nil;
    }
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC
{
    
    Baby_Animation * transition = [[Baby_Animation alloc] init];
    return transition;
}

- (id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                          interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController {
    return self.percentDrivenTransition;
}

@end
