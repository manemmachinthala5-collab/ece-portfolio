// Simple C program for LED Blink Simulation

#include <stdio.h>

void delay() {
    for(long i = 0; i < 100000; i++); // Time delay
}

int main() {
    int led_status = 0; // 0 = OFF, 1 = ON
    
    for(int i = 0; i < 5; i++) {
        led_status = !led_status;
        if(led_status == 1) {
            printf("LED is ON\n");
        } else {
            printf("LED is OFF\n");
        }
        delay();
    }
    return 0;
}
