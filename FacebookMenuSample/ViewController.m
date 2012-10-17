//
//  ViewController.m
//  FacebookMenuSample
//
//  Created by ho9ho9 on 2012/10/17.
//
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    float defWidth = _scrollView.frame.size.width;
    
    _scrollView.pagingEnabled = YES;
    _scrollView.contentSize = CGSizeMake(defWidth + (defWidth * 0.8), _scrollView.frame.size.height);
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.scrollsToTop = NO;
    _scrollView.bounces = NO;
//    _scrollView.delegate = self;
    _scrollView.contentOffset = CGPointMake((defWidth * 0.8), _scrollView.contentOffset.y);
    
    _mainView.frame = CGRectMake((defWidth * 0.8), _scrollView.contentOffset.y, _mainView.frame.size.width, _mainView.frame.size.height);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapMenu:(id)sender {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    if (_scrollView.contentOffset.x == 0) {
        _scrollView.contentOffset = CGPointMake((_scrollView.frame.size.width * 0.8), _scrollView.contentOffset.y);
    } else {
        _scrollView.contentOffset = CGPointMake(0, _scrollView.contentOffset.y);
    }
    [UIView commitAnimations];
}

@end
