//
//  CrazyDragViewController.h
//  CrazyDrag
//
//  Created by Jeremial on 14-5-25.
//  Copyright (c) 2014年 Jeremial. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CrazyDragViewController : UIViewController<UIAlertViewDelegate>{
    int currentValue;
    int targetValue;
    int score;
    int round;
}

@property (strong, nonatomic) IBOutlet UISlider *slider;
@property (strong, nonatomic) IBOutlet UILabel *targetLabel;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *roundLabel;

- (IBAction)sliderMoved:(UISlider*)sender;

- (IBAction)showAlert:(id)sender;

- (IBAction)startOver:(id)sender;

- (IBAction)showInfo:(id)sender;

@end
