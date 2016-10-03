//
//  ViewController.h
//  RPTic Tac Toe
//
//  Created by Student P_08 on 21/09/16.
//  Copyright © 2016 RiteshPatil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


{
    int numberofturns,currentplayer;
    
    BOOL GameFinished;
    NSArray *winningplayer;
    NSMutableArray *currentstates;
    
}
-(IBAction)buttontapped:(id)sender;


@end

