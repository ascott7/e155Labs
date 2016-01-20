#include "piHelpers.h"

int main()
{
  pioInit();
  spiInit(244000, 0);
  double voltage = getVoltage();
  printf("%s%c%c\n", "Content-Type:text/html;charset=iso-8859-1",13,10);
  printf("<html>\n<body>\n<h1>VOLTAGE %f</h>", voltage);
  if (voltage > 0.5) {
    printf("<img src=\"http://jesterjournals.com/wp-content/uploads/2015/04/stock-illustration-32884400-smiling-radiant-yellow-summer-sun-wearing-black-sunglasses-vecto.jpg\">");
  } else {
    printf("<img src=\"http://image.spreadshirtmedia.com/image-server/v1/designs/10599300,width=190,height=190.png/man-in-the-moon-smiling_design.png\">");
  }
  return 0;
}
