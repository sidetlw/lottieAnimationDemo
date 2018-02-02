//
//  ViewController.m
//  lottieAnimationDemo
//
//  Created by sidetang on 2017/8/14.
//  Copyright © 2017年 sidetang. All rights reserved.
//

#import "ViewController.h"
#import "Lottie.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *animationPlaceView;
@property (nonatomic, strong) LOTAnimationView *laAnimation;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self _loadAnimationNamed:@"data-test6.json"];
    [self _loadAnimationNamed:@"BG-data.json"];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    self.laAnimation.frame = CGRectMake(0, 0, screenSize.width , CGRectGetHeight(self.animationPlaceView.frame));
    self.laAnimation.backgroundColor = [UIColor clearColor]; //[UIColor colorWithRed:45/255.0 green:50/255.0 blue:63/255.0 alpha:1/1.0];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)_loadAnimationNamed:(NSString *)named {
    [self.laAnimation removeFromSuperview];
    self.laAnimation = nil;
    
    self.laAnimation = [LOTAnimationView animationNamed:named];
    self.laAnimation.contentMode = UIViewContentModeScaleToFill;
    [self.animationPlaceView addSubview:self.laAnimation];
    [self.view setNeedsLayout];
    [self _play];
}

- (void)_play {
    [self.laAnimation playWithCompletion:nil];
    self.laAnimation.loopAnimation = YES;
}

@end
