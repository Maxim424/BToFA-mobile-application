//
//  AppConstants.swift
//  Application
//
//  Created by Максим Кузнецов on 03.03.2023.
//

import UIKit

final class AppConstants {
    
    final class Design {
        
        final class Color {
            
            class var Button: UIColor {
                UIColor(red: 0.951, green: 0.951, blue: 0.951, alpha: 1)
            }
            
            class var Shadow: CGColor {
                UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            }
            
        }
        
        final class Paddings {
            
            final class CornerRadius {
                
                class var Primary: CGFloat {
                    CGFloat(15)
                }
                
                class var Secondary: CGFloat {
                    CGFloat(5)
                }
                
            }
            
        }
        
    }
}
