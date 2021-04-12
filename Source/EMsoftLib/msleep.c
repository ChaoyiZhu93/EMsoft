#if defined (_MSC_VER)
#include <time.h>
#else
#include <sys/time.h>
#endif

void msleep(int tms)
{
    struct timeval tv;
    tv.tv_sec  = tms / 1000;
    tv.tv_usec = (tms % 1000) * 1000;
    select (0, NULL, NULL, NULL, &tv);
}