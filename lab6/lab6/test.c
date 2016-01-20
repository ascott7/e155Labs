
#include "piHelpers.h"
#include <sys/mman.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>

int main()
{
  pioInit();
  spiInit(244000, 0);
  printf("voltage: %f\n", getVoltage());
}
