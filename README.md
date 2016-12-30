# CamoUI
UI Libraries for iOS / Swift

any contributes are in welcome!

# CamoUButton v0.0.2

Easy button maker, inherits UIButton. It suppors alpha and scaling animation


       v0.0.2 - removed button init for disabled and highlighted.
              - added autoSetButtonsWith(_ normal:UIImage?) - auto sets buttons for normal, selected, highlighted, disabled

# CamoUTabButton v0.0.1

Easy Tab Button maker, inherits CamoUButton. toggles by differentiating background color.

# CamoURadioButton v0.0.3

radio button for UIButton. Automatically resizes with(horizontal, vertical | center aligns).

       v0.0.3 - addTarget method added. it returns buttons and it's index(by tag)
              - now it perfectly works as radio button(added deselect, select) / align bug fixed
       
       
# CamoUImage v0.0.1

Extensions for UIImage.

currently supports
       
       - crop : returns cropped image into center position. (By input param CGSize)
       - alpha : returns alpha blended image.   
       - noir : returns noir type effected(grayscale) image.
