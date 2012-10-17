//
//  ViewController.h
//  FacebookMenuSample
//
//  Created by ho9ho9 on 2012/10/17.
//
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate> {
    @private
    __weak IBOutlet UIScrollView *_scrollView;
    __weak IBOutlet UIView *_mainView;
    __weak IBOutlet UITableView *_menuTable;
    __weak IBOutlet UINavigationBar *_navigationBar;
}

- (IBAction)tapMenu:(id)sender;

@end
