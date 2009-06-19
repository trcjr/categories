
@implementation UIColor (Random)

+(UIColor *) randomColor {
  return [UIColor colorWithHue:((rand() % 100) / 100.0f) saturation:1.0 brightness:1.0 alpha:1.0];
}

@end

