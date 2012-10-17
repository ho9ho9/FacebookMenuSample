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
    _scrollView.contentSize = CGSizeMake(defWidth + 260, _scrollView.frame.size.height);
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.scrollsToTop = NO;
    _scrollView.bounces = NO;
//    _scrollView.delegate = self;
    _scrollView.contentOffset = CGPointMake(260, _scrollView.contentOffset.y);
    
    _mainView.frame = CGRectMake(260, _scrollView.contentOffset.y, _mainView.frame.size.width, _mainView.frame.size.height);
    
    _menuTable.frame = CGRectMake(0, _scrollView.contentOffset.y, 260, _mainView.frame.size.height);
    _menuTable.delegate = self;
    _menuTable.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) swipeMenu {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.15];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    if (_scrollView.contentOffset.x == 0) {
        _scrollView.contentOffset = CGPointMake(260, _scrollView.contentOffset.y);
    } else {
        _scrollView.contentOffset = CGPointMake(0, _scrollView.contentOffset.y);
    }
    [UIView commitAnimations];
}

- (IBAction)tapMenu:(id)sender {
    [self swipeMenu];
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [_menuTable deselectRowAtIndexPath:indexPath animated:YES];
    _navigationBar.topItem.title = [NSString stringWithFormat:@"タイトル[%d-%d]", indexPath.section, indexPath.row];
    [self swipeMenu];
}
#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = 0;
    if (section == 0) {
        count = 3;
    } else {
        count = 5;
    }
    return count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [_menuTable dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString *cellValue = [NSString stringWithFormat:@"メニュー [%d-%d]", indexPath.section, indexPath.row];
    cell.textLabel.text = cellValue;
    
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *title = nil;
    if (section == 0) {
        title = @"MenuCategory α";
    } else {
        title = @"MenuCategory β";
    }
    return title;
}

@end
