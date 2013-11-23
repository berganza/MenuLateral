//
//  ViewController.m
//  MenuLateral
//
//  Created by LLBER on 22/11/13.
//  Copyright (c) 2013 LLBER. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize pantallaPrincipal, posicionPantalla;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.posicionPantalla = self.pantallaPrincipal.frame.origin.x;
    
}


#define POSICION_VISTA 225

-(void) animateLayerToPoint: (CGFloat)x {
    
    [UIView animateWithDuration:1
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         CGRect marco = self.pantallaPrincipal.frame;
                         marco.origin.x = x;
                         self.pantallaPrincipal.frame = marco;
                     }
                     completion:^(BOOL finished) {
                         self.posicionPantalla = self.pantallaPrincipal.frame.origin.x;
                     }];
}


- (IBAction)gesto:(UIPanGestureRecognizer *)reconocerGesto {
    
    if(reconocerGesto.state == UIGestureRecognizerStateChanged) {
        
        CGPoint punto = [reconocerGesto translationInView:self.pantallaPrincipal];
        CGRect marco = self.pantallaPrincipal.frame;
        marco.origin.x = self.posicionPantalla + punto.x;
        
        if (marco.origin.x <0) marco.origin.x = 0;
        self.pantallaPrincipal.frame = marco;
    }
    
    if (reconocerGesto.state == UIGestureRecognizerStateEnded) {
        
        if (self.pantallaPrincipal.frame.origin.x <=160) {
            
            [self animateLayerToPoint:0];
        } else {
            
            [self animateLayerToPoint: POSICION_VISTA];
        }
    }
    
    
    
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end








