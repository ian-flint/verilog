#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>

int main() {
    int f = open ("data.txt", O_RDWR | O_TRUNC);
    //write (f, "abcdefghijklmnopqrstuvwxyz", 26);
    write (f, "a", 1);
    close (f);
}
