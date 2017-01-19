//
//  ViewController.m
//  WhatsApp Sharing Everything
//
//  Created by iSquare infoTech on 1/11/17.
//  Copyright © 2017 iSquare infoTech. All rights reserved.
//

#import "ViewController.h"
#import "WASWhatsAppUtil.h"

typedef enum {
    kSendText = 0,
    kSendImage,
    kSendTextWithImage,
    kSendAudio,
    kSendCancel
} options;

@interface ViewController ()<UIActionSheetDelegate, UIDocumentInteractionControllerDelegate>{
    UIDocumentInteractionController *docController;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions
- (IBAction)sendDidTouch:(id)sender
{
    UIAlertController* alertAS = [UIAlertController alertControllerWithTitle:@"Choose"
                                                                     message:nil
                                                              preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* sendtext = [UIAlertAction actionWithTitle:@"Send text" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              NSLog(@"text");
                                                               [[WASWhatsAppUtil getInstance] sendText:@"This is test text"];
                                                          }];
    [alertAS addAction:sendtext];
    
    UIAlertAction* sendimage = [UIAlertAction actionWithTitle:@"Send Image" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              NSLog(@"image.jpg");
                                                             
              NSString *savePath = [[NSBundle mainBundle] pathForResource:@"image" ofType:@"jpg"];
              NSURL *tempFile1 = [NSURL fileURLWithPath:savePath];
              NSData *ImageData = [NSData dataWithContentsOfURL:tempFile1];
              
              [[WASWhatsAppUtil getInstance] sendImage:ImageData inView:self.view];
                                                              
                                                          }];
    [alertAS addAction:sendimage];
    
    UIAlertAction* sendvideo = [UIAlertAction actionWithTitle:@"Send Video" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
               NSLog(@"Video");
              NSString *savePath = [[NSBundle mainBundle] pathForResource:@"BlueChatapp" ofType:@"mp4"];
                NSURL *tempFile1 = [NSURL fileURLWithPath:savePath];
              NSData *Videodata = [NSData dataWithContentsOfURL:tempFile1];
              [[WASWhatsAppUtil getInstance] sendVideo:Videodata inView:self.view];
                                                              
                                                          }];
    [alertAS addAction:sendvideo];
    
    UIAlertAction* sendaudio = [UIAlertAction actionWithTitle:@"Send Audio" style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * action) {
                                                          NSLog(@"Action");
          NSString *savePath = [[NSBundle mainBundle] pathForResource:@"Songs" ofType:@"mp3"];
          NSURL *tempFile1 = [NSURL fileURLWithPath:savePath];
          NSData *Videodata = [NSData dataWithContentsOfURL:tempFile1];                                  [[WASWhatsAppUtil getInstance] sendAudio:Videodata inView:self.view];
                                                         
                                                      }];
    [alertAS addAction:sendaudio];
    
    UIAlertAction* sendpdf = [UIAlertAction actionWithTitle:@"Send PDF" style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * action) {
                  NSLog(@"PDF");
                  NSString *savePath = [[NSBundle mainBundle] pathForResource:@"Agreement" ofType:@"pdf"];
                  NSURL *tempFile1 = [NSURL fileURLWithPath:savePath];
                  NSData *Pdfdata = [NSData dataWithContentsOfURL:tempFile1];                                  [[WASWhatsAppUtil getInstance] sendPdf:Pdfdata inView:self.view];
                                                      }];
    [alertAS addAction:sendpdf];
    
    UIAlertAction* sendurl = [UIAlertAction actionWithTitle:@"Send URL" style:UIAlertActionStyleDefault
                                                    handler:^(UIAlertAction * action) {
                                                        NSLog(@"PDF");
                                    [[WASWhatsAppUtil getInstance] sendUrl:[NSString stringWithFormat:@"%@",@"https://www.google.co.in"] inView:self.view];
                                                    }];
    [alertAS addAction:sendurl];

    
    UIAlertAction* sendimageVideo = [UIAlertAction actionWithTitle:@"Send image with text" style:UIAlertActionStyleDefault
                                                    handler:^(UIAlertAction * action) {
                                                      
        NSLog(@"text with image");
        NSLog(@"Send text with image");
        NSMutableArray *objectsToShare = [[NSMutableArray alloc]init];
        [objectsToShare addObject:[NSString stringWithFormat:@"Text string"]];
        [objectsToShare addObject:[UIImage imageNamed:@"image.jpg"]];
        
        // init and present the controller
        UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
        [self presentViewController:controller animated:YES completion:nil];
                                                    }];
    [alertAS addAction:sendimageVideo];
    
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
    }];
    [alertAS addAction:cancleAction];
    [self presentViewController:alertAS animated:YES completion:nil];

}

@end

