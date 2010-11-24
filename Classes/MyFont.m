//
//  MyFont.m
//  FontRelease
//
//  Created by Kyosuke Takayama on 10/11/25.
//  Copyright 2010 aill. All rights reserved.
//

#import "MyFont.h"

@implementation MyFont

- (id) init {
   if(self = [super init]) {
      NSString *fontPath = [[NSBundle mainBundle] pathForResource:@"ipam" ofType:@"otf"];

      NSData *fontData = [NSData dataWithContentsOfFile:fontPath];
      CFDataRef data = (CFDataRef)fontData;
      CGDataProviderRef fontDataProvider = CGDataProviderCreateWithCFData(data);
      CGFontRef cgFont = CGFontCreateWithDataProvider(fontDataProvider);

      CTFontRef font = CTFontCreateWithGraphicsFont(cgFont, 12.0, NULL, NULL);
      CFRelease(font);

      CGDataProviderRelease(fontDataProvider);
      CFRelease(cgFont);
   }
   return self;
}

- (void) dealloc {
   [super dealloc];
}

@end
