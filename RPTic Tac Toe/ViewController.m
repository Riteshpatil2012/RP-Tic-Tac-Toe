//
//  ViewController.m
//  RPTic Tac Toe
//
//  Created by Student P_08 on 21/09/16.
//  Copyright © 2016 RiteshPatil. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initgame];
}
-(void)initgame{
    numberofturns = 0;
    currentplayer=1;
    GameFinished=false;
    
    winningplayer =     @[@[@0,@1,@2],
                          @[@3,@4,@5],
                          @[@6,@7,@8],
                          @[@0,@3,@6],
                          @[@1,@4,@7],
                          @[@2,@5,@8],
                          @[@0,@4,@8],
                          @[@2,@4,@6]];
    currentstates=[[NSMutableArray alloc]initWithObjects:@0,@0,@0,@0,@0,@0,@0,@0,@0,nil];
    for (int i=100; i<=108; i++) {
        UIButton *button=[self.view viewWithTag:i];
        [button setBackgroundImage:[UIImage new] forState:UIControlStateNormal];
        
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)buttontapped:(id)sender{
    numberofturns = numberofturns+1;
    UIButton *tiles=sender;
    UIImage *playerimage;
    int player =currentplayer;
    
    
    BOOL ifbuttonnotselected=[[currentstates objectAtIndex:(tiles.tag-100)] isEqual:@0];
    if (ifbuttonnotselected) {
        if (!GameFinished) {
            if (player==1) {
                playerimage =[UIImage imageNamed:@"nought"];
                [currentstates replaceObjectAtIndex:(tiles.tag-100) withObject:@1];
                currentplayer=2;
                
            }
            else{
                playerimage = [UIImage imageNamed:@"cross"];
                [currentstates replaceObjectAtIndex:(tiles.tag-100) withObject:@2];
                currentplayer=1;
            }
            
        }
        [tiles setBackgroundImage:playerimage forState:UIControlStateNormal];
    }
    else{
        [self alertwithtitle:@"Caution" message:@"Please select another tile" ];
    }
    
    if (numberofturns>=5) {
        for (NSArray *combination in winningplayer) {
            int indexofbuttonone =[[combination objectAtIndex:0]intValue];
            int indexofbuttonTwo =[[combination objectAtIndex:1]intValue];
            int indexofbuttonThree=[[combination objectAtIndex:2]intValue];
            NSNumber *stateatbuttonone=[currentstates objectAtIndex:indexofbuttonone];
             NSNumber *stateatbuttonTwo=[currentstates objectAtIndex:indexofbuttonTwo];
             NSNumber *stateatbuttonThree=[currentstates objectAtIndex:indexofbuttonThree];
            if (![stateatbuttonone isEqual:@0]&&[stateatbuttonone isEqual:stateatbuttonTwo]&&[stateatbuttonone isEqual:stateatbuttonThree])
            
            
            {
                GameFinished=YES;
                
                
                NSString *winnerstring = [NSString stringWithFormat:@"player %d is winner ",player];
                
                [self alertforendwithtitle:winnerstring message:@"Do u Want to Play Again"];
                break;
            }
            
        }
    }
    if (!GameFinished) {
        bool zerovaluepresent=[currentstates containsObject:@0];
        if (!zerovaluepresent) {
            [self alertforendwithtitle:@"Game Draw" message:@"Do u Wnt to play Again"];
        }
        
    }
}
-(void)alertwithtitle:(NSString *)title
              message:(NSString *)message{
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
                       
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)alertforendwithtitle:(NSString *)title
                    message:(NSString *)message{
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        
        [self initgame];
        //[self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alert addAction:ok];
    
   // [self presentViewController:alert animated:YES completion:nil];
    UIAlertAction *cancel =[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        exit(0);
    }];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}
@end
