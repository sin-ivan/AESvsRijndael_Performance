//
//  ViewController.h
//  EncriptionTest
//
//  Created by Ivan Sinitsa on 6/12/15.
//  Copyright © 2015 Ivan Sinitsa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *sourceLabel;

@property (nonatomic, weak) IBOutlet UIButton *blowFishStartButton;
@property (nonatomic, weak) IBOutlet UIButton *rijndaelStartButton;
@property (nonatomic, weak) IBOutlet UILabel *blowFishResultEncryptionLabel;
@property (nonatomic, weak) IBOutlet UILabel *blowFishResultDecryptionLabel;
@property (nonatomic, weak) IBOutlet UILabel *rijndaelResultEncryptionLabel;
@property (nonatomic, weak) IBOutlet UILabel *rijndaelResultDecryptionLabel;


@end

