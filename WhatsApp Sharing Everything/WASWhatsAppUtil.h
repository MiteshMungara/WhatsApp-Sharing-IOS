//
//  WASWhatsAppUtil.h
//  SharingWhatsApp
//
//  Created by YU LU on 24/2/15.
//  Copyright (c) 2015 YU LU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WASWhatsAppUtil : NSObject

+ (id)getInstance;
- (void)sendText:(NSString*)message;
- (void)sendAudioinView:(UIView*)view;
- (void)sendVideo:(NSData*)videoData inView:(UIView*)view;
- (void)sendImage:(NSData*)imageData inView:(UIView*)view;
- (void)sendAudio:(NSData*)audioData inView:(UIView*)view;
- (void)sendPdf:(NSData*)pdfData inView:(UIView*)view;
- (void)sendUrl:(NSString *)urlString inView:(UIView*)view;
@end
