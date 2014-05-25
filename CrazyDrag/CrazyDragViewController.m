//
//  CrazyDragViewController.m
//  CrazyDrag
//
//  Created by Jeremial on 14-5-25.
//  Copyright (c) 2014年 Jeremial. All rights reserved.
//

#import "CrazyDragViewController.h"
#import "AboutViewController.h"

@implementation CrazyDragViewController
@synthesize slider;
@synthesize targetLabel;
@synthesize scoreLabel;
@synthesize roundLabel;

- (void)updateLabels{
    self.targetLabel.text = [NSString stringWithFormat:@"%d",targetValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", score];
    self.roundLabel.text = [NSString stringWithFormat:@"%d", round];
}

- (void)startNewRound{
    round += 1;
    targetValue = 1+ (arc4random() % 100);
    currentValue = 50;
    self.slider.value = currentValue;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self startNewGame];
    [self updateLabels];
	// Do any additional setup after loading the view, typically from a nib.

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispo    se of any resources that can be recreated.
}

- (IBAction)showAlert:(id)sender {
    int difference = abs(currentValue - targetValue);
    int points = 100 - difference;
    
    NSString *title;
    
    if (difference == 0) {
        title = @"土豪你太NB了!";
        points += 100;
    }else if(difference < 5){
        title = @"土豪太棒了,差一点!";
        if (difference == 1) {
            points += 50;
        }
    }else if(difference < 10){
        title = @"好吧,勉强算个土豪";
    }else{
        title = @"不是土豪少来装!";
    }
    
    score += points;
        
    NSString *message = [NSString stringWithFormat:@"恭喜高富帅,您的得分是: %d",points];

    [[[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil]show];

}

- (IBAction)sliderMoved:(UISlider*)sender {
    
    currentValue = (int)lroundf(slider.value);
}
- (void) alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    [self startNewRound];
    [self updateLabels];
}
- (IBAction)startOver:(id)sender {
    [self startNewGame];
    [self updateLabels];
}

- (IBAction)showInfo:(id)sender {
    AboutViewController *controller = [[AboutViewController alloc]initWithNibName:@"AboutViewController" bundle:nil];
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:controller animated:YES completion:nil];
}
- (void)startNewGame{
    score = 0;
    round = 0;
    [self startNewRound];
}
@end
