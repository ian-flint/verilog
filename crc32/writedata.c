#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>

int main() {
    int f = open ("data.txt", O_RDWR | O_CREAT | O_TRUNC | O_NOFOLLOW);
    write (f, "abcdefghijklmnopqrstuvwxyz", 26);
    //write (f, "abcdef", 6);
    //write (f, "abc", 3);
    close (f);
    chmod ("data.txt", 0600);
}
