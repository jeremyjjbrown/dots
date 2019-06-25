#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>

/**
* change uid to match the sytem uuid and then build
* `chown root:$uid rootme` then `chmod 4750 rootme` as docker user.
*/

void main() {
    if(getuid() != 90024426) {
        printf("Wrong uid, buddy!\n");
        exit(1);
    }
    printf("setuid root script for jeremybr\n");
    setuid(0);
    setgid(0);
    putenv("HOME=/root");
    chdir("/root");
    execv("/bin/bash", NULL);
}
