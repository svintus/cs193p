#import "prefs.h"

static NSUserDefaults* defaults(void)
{
  return [NSUserDefaults standardUserDefaults];
}

BOOL get_pref_bool(NSString* pref)
{
  return [defaults() boolForKey: pref];
}

void set_pref_bool(NSString* pref, BOOL val)
{
  [defaults() setBool: val
               forKey: pref];
}

void sync_prefs(void)
{
  [defaults() synchronize];
}
