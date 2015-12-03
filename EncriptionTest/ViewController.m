//
//  ViewController.m
//  EncriptionTest
//
//  Created by Ivan Sinitsa on 6/12/15.
//  Copyright © 2015 Ivan Sinitsa. All rights reserved.
//

#import "ViewController.h"

#import "AESCrypt.h"
#import "FclBlowfish.h"

@interface ViewController ()

@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *key;
@property (nonatomic, strong) NSString *vector;
@property (nonatomic, assign) NSInteger numberOfEncryptionIterations;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.message = @"test";
    self.key = @"31526136636f6258";
    self.vector = @"7539474b6e555141";
    self.numberOfEncryptionIterations = 1;
    self.sourceLabel.text = self.message;
    
}

- (IBAction)startBlowFishEncryption:(id)sender
{
    double totalTime = 0;
    CFTimeInterval startTime = 0;
    NSString *base64String = nil;
    
    //encrypt blowfish
    FclBlowfish *bf = [[FclBlowfish alloc] init];
    bf.Key = self.key;
    bf.IV = @"abcdefg";
    [bf prepare];
    for (int i = 0; i < self.numberOfEncryptionIterations; i++) {
        startTime = CACurrentMediaTime();
        base64String = [bf encrypt:self.message withMode:modeCBC withPadding:paddingRFC];
        #pragma unused(base64String)
        
        totalTime += CACurrentMediaTime() - startTime;
    }
    
    self.blowFishResultEncryptionLabel.text = [NSString stringWithFormat:@"Encryption: %.2fms", totalTime * 1000];
    
    //decrypt blowfish
    totalTime = 0;
    for (int i = 0; i < self.numberOfEncryptionIterations; i++) {
        startTime = CACurrentMediaTime();

        NSString *plainText =[bf decrypt:base64String withMode:modeCBC withPadding:paddingRFC];
        #pragma unused (plainText)
        
        totalTime += CACurrentMediaTime() - startTime;
    }
    self.blowFishResultDecryptionLabel.text = [NSString stringWithFormat:@"Decryption: %.2fms", totalTime * 1000];
    
}

- (IBAction)startRijndaelEncryption:(id)sender
{
    double totalTime = 0;
    CFTimeInterval startTime = 0;
    NSString *base64String = nil;
    
    //encrypt rijndael
    for (int i = 0; i < self.numberOfEncryptionIterations; i++) {
        startTime = CACurrentMediaTime();
        base64String = [AESCrypt encrypt:self.message password:self.key vector:self.vector];
        
        
        NSString *receivedBase64 = @"QB/gSygHZvMsy9RaRG9Maf/72J0yf1yZMdTEqwY3/zU=";
        
        
        //NSString *string = [AESCrypt decrypt:receivedBase64 password:self.key vector:self.vector];
        
        #pragma unused(base64String)
        
        totalTime += CACurrentMediaTime() - startTime;
    }
    
    self.rijndaelResultEncryptionLabel.text = [NSString stringWithFormat:@"Encryption: %.2fms", totalTime * 1000];
    
    //decrypt rijndael
    totalTime = 0;
    for (int i = 0; i < self.numberOfEncryptionIterations; i++) {
        startTime = CACurrentMediaTime();
        NSString *plainText = [AESCrypt decrypt:base64String password:self.key];
        #pragma unused(plainText)
        totalTime += CACurrentMediaTime() - startTime;
    }
    self.rijndaelResultDecryptionLabel.text = [NSString stringWithFormat:@"Decryption: %.2fms", totalTime * 1000];
}


@end
