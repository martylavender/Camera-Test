//
//  ViewController.m
//  Camera
//
//  Created by Marty Lavender on 6/28/15.
//  Copyright (c) 2015 Marty Lavender. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
		
		UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Womp womp"
															  message:@"I can has no camera"
															 delegate:nil
														cancelButtonTitle:@"DOH!"
													otherButtonTitles: nil];
		
		[myAlertView show];
		
	}
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	
	UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
	self.imageView.image = chosenImage;
	
	[picker dismissViewControllerAnimated:YES completion:NULL];
	
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
	
	[picker dismissViewControllerAnimated:YES completion:NULL];
	
}



- (IBAction)takePhoto:(UIButton *)sender {
	
	UIImagePickerController *picker = [[UIImagePickerController alloc] init];
	picker.delegate = self;
	picker.allowsEditing = YES;
	picker.sourceType = UIImagePickerControllerSourceTypeCamera;
	
	[self presentViewController:picker animated:YES completion:NULL];
	
}

- (IBAction)selectPhoto:(UIButton *)sender {
	
	UIImagePickerController *picker = [[UIImagePickerController alloc] init];
	picker.delegate = self;
	picker.allowsEditing = YES;
	picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
	
	[self presentViewController:picker animated:YES completion:NULL];
	
	
}

@end
