#define rw  portd.B0
#define yw  portd.B1
#define gw  portd.B2
#define gs  portd.b3
#define ys  portd.b4
#define rs  portd.b5

// porta.b1 is the converter

int counter = 0;
void automatic()
{
     while(porta.b1 == 1)//converter is in automatic mode
      {
          for(counter = 15;counter > 0; counter--)
          {
                      portb = (counter % 10) + (counter/10) * 16; // (1<<4) to print the number in two 7 segments
                      portc = 255;// give power to the 7 segments

                      if(counter > 3)
                      {
                                 rw = 1;gs = 1;
                                 yw = 0;gw = 0;ys = 0; rs = 0;
                      }
                      else
                      {
                          ys = 1;rw = 1;// switch to yellow south in the last 3 minutes
                          yw = 0;gw = 0;rs = 0; gs = 0;
                      }
                      if(porta.b1 == 0)
                      {
                       portb = 0;// make the 7 segments show 0
                       break;//break the loop when the converter is switched to manual mode
                       // this if condition is made to prevent waiting till the for loop end
                      }
                      delay_ms(1000);// this make a delay of 1 second between every counter

          }

          for(counter = 23;counter > 0; counter--)
          {
                      if(porta.b1 == 0)
                      {
                       portb = 0;// make the 7 segments show 0
                       break;// this if condition is made to prevent waiting till the for loop end
                       // this is made in the beginning of the for loop to prvent switching the traffic_light after the first break in the first loop
                      }
                      portb = (counter % 10) + (counter/10) * 16; // (1<<4)
                      portc = 255;

                      if(counter > 3)
                      {
                          gw = 1;rs = 1;
                          rw = 0;yw = 0;ys = 0; gs = 0;
                      }
                      else
                      {
                          yw = 1;rs = 1;
                          rw = 0;gw = 0;ys = 0; gs = 0;
                      }

                      delay_ms(1000);
          }

      }
}

void manual()
{
// this is the manual mode where it toggle the traffic_light in case any collapse in the system or special event
if(porta.b1 == 0 && porta.b2 == 0)// if the coveter is switched to manual and then the manual switch is toggled , it will toggle the traffic_light
 {
     if(gw == 1 || yw == 1)
     {
     // if the green or yellow west are on then it will turn on the yellow and wait 3 seconds then turn on the red and toggle the red south to green
           yw = 1;rs = 1;
           gw = 0;rw = 0;gs = 0;ys = 0;
           delay_ms(3000);
           rw = 1;gs = 1;
           gw = 0;yw = 0;rs = 0;ys = 0;
     }
     else if(gs == 1 || ys == 1)// toggle the green south to red after 3 seconds passing by yellow and toggle the red west to green
     {
     // toggle the green south to red after 3 seconds passing by yellow and toggle the red west to green
           ys = 1;rw = 1;
           gw = 0;yw = 0;gs = 0;rs = 0;
           delay_ms(3000);
           rs = 1;gw = 1;
           rw = 0;yw = 0;gs = 0;ys = 0;
     }
 }

}

void main() {
     adcon1 = 7;//covert port a from analog to digital
     trisa = 0b111111;// initialize port a as input
     trisb = 0;// initialize port b as output
     trisc = 0;// initialize port a as output
     trisd = 0;// initialize port a as output
     
     porta = 0b111111;
     portb = 0;
     portc = 0xff;
     portd = 0;
     
     
     while(porta.b0 == 1);// it will stay in this infinite loop if don't toggle the start button

     while(1)
     {
     automatic();//it will do the automatic function while the program is on
     manual();// it will do the manual function in case the converter is manual and the program is on
     }

}