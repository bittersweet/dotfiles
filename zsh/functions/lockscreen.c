// https://stackoverflow.com/questions/1976520/lock-screen-by-api-in-mac-os-x/26492632#26492632
// lockscreen.c
extern void SACLockScreenImmediate ( );

int main()
{
    SACLockScreenImmediate();
    return 0;
}
