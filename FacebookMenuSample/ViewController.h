//
//  ViewController.h
//  FacebookMenuSample
//
//  Created by ho9ho9 on 2012/10/17.
//
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    @private
    __weak IBOutlet UIScrollView *_scrollView;
    __weak IBOutlet UIView *_mainView;
}

- (IBAction)tapMenu:(id)sender;

@end
