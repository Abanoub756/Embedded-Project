#line 1 "D:/Embedded Systems Project/Code/Traffic.c"







int counter = 0;
void automatic()
{
 while(porta.b1 == 1)
 {
 for(counter = 15;counter > 0; counter--)
 {
 portb = (counter % 10) + (counter/10) * 16;
 portc = 255;

 if(counter > 3)
 {
  portd.B0  = 1; portd.b3  = 1;
  portd.B1  = 0; portd.B2  = 0; portd.b4  = 0;  portd.b5  = 0;
 }
 else
 {
  portd.b4  = 1; portd.B0  = 1;
  portd.B1  = 0; portd.B2  = 0; portd.b5  = 0;  portd.b3  = 0;
 }
 if(porta.b1 == 0)
 {
 portb = 0;
 break;
 }
 delay_ms(700);

 }

 for(counter = 23;counter > 0; counter--)
 {
 if(porta.b1 == 0)
 {
 portb = 0;
 break;
 }
 portb = (counter % 10) + (counter/10) * 16;
 portc = 255;

 if(counter > 3)
 {
  portd.B2  = 1; portd.b5  = 1;
  portd.B0  = 0; portd.B1  = 0; portd.b4  = 0;  portd.b3  = 0;
 }
 else
 {
  portd.B1  = 1; portd.b5  = 1;
  portd.B0  = 0; portd.B2  = 0; portd.b4  = 0;  portd.b3  = 0;
 }

 delay_ms(700);
 }

 }
}

void manual()
{
if(porta.b1 == 0 && porta.b2 == 0)
 {
 if( portd.B2  == 1 ||  portd.B1  == 1)
 {
  portd.B1  = 1; portd.b5  = 1;
  portd.B2  = 0; portd.B0  = 0; portd.b3  = 0; portd.b4  = 0;
 delay_ms(2000);
  portd.B0  = 1; portd.b3  = 1;
  portd.B2  = 0; portd.B1  = 0; portd.b5  = 0; portd.b4  = 0;
 }
 else if( portd.b3  == 1 ||  portd.b4  == 1)
 {
  portd.b4  = 1; portd.B0  = 1;
  portd.B2  = 0; portd.B1  = 0; portd.b3  = 0; portd.b5  = 0;
 delay_ms(2000);
  portd.b5  = 1; portd.B2  = 1;
  portd.B0  = 0; portd.B1  = 0; portd.b3  = 0; portd.b4  = 0;
 }
 }

}

void main() {
 adcon1 = 7;
 trisa = 0b111111;
 trisb = 0;
 trisc = 0;
 trisd = 0;

 porta = 0b111111;
 portb = 0;
 portc = 0xff;
 portd = 0;


 while(porta.b0 == 1);

 while(1)
 {
 automatic();
 manual();
 }

}
