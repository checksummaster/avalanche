import board
from kmk.scanners.keypad import MatrixScanner
from kmk.scanners.encoder import RotaryioEncoder
from kmk.kmk_keyboard import KMKKeyboard as _KMKKeyboard
from kmk.scanners import DiodeOrientation

"""
            Pin pro micro                                   nice nano
                                                        
                   ,--------------.                         GND(B-)       BATTERY+(B+)       LED P0_15
            Led   -|1  tx   raw 24|-   Switch battery       P0_06         BATTERY+           Plot P1_01, P1_02, P1_03
TRRS        data  -|2  rx   gnd 23|-   GND battery          p0_08         GND                UnderTap P0_26, P0_12, SWC, SWD
            GND   -|3  gnd  rst 22|-   RST                  GND           RESET              Battery sensor P0_04 (ADC)
            GND   -|4  gnd  vcc 21|-   VCC                  GND           VCC                Turn off led P0_13
Display     SDA   -|5  sda   a3 20|-   encB                 P0_17         P0_31
Display     SCL   -|6  scl   a2 19|-   col0                 P0_20         P0_29
            ROW0  -|7  d4    a1 18|-   col1                 P0_22         P0_02                 
            ROW1  -|8  d5    a0 17|-   col2                 P0_24         P1_15
            ROW2  -|9  d6   d15 16|-   col3                 P1_00         P1_13
            ROW3  -|10 d7   d14 15|-   col4                 P0_11         P1_11
            ROW4  -|11 d8   d16 14|-   col5                 P1_04         P0_10
            encA  -|12 d9   d10 13|-   col6                 P1_06         P0_09
                   `--------------'

    DIODE -> col-switch--anode-cathode-rom

    Scancode Matrix 7x5 = 35
           ,-----------------------------------------.                                         ,-----------------------------------------.
           |  00  |  01  |  02  |  03  |  04  |  05  | 06                                      |  05  |  04  |  03  |  02  |  01  |  00  |
           |------+------+------+------+------+------|                                         |------+------+------+------+------+------|
           |  10  |  11  |  12  |  13  |  14  |  15  | 16                                      |  15  |  14  |  13  |  12  |  11  |  10  |
    ,------+------+------+------+------+------+------|                                         |------+------+------+------+------+------+------.
    |  40  |  20  |  21  |  22  |  23  |  24  |  25  |                                         |  25  |  24  |  23  |  22  |  21  |  20  |  40  |
    `------+------+------+------+------+------|------|---------------.         ,---------------|------+------+------+------+------+------+------'
           |  30  |  31  |  32  |  33  |  34  |  35  | /  36  /  26  |         |  26  \  36  \ |  35  |  34  |  33  |  32  |  31  |  30  |  
           `-------------------------------------------------|------/          \---------------------------------------------------------'
                        41  |  42  |  43  |  44  |  /  45  /  46  /              \  46  \  45  \  |  44  |  43  |  42  |
                            `------------------------------------'                `------------------------------------'


LED
           ,-----------------------------------------.
           |  27  |  26  |  18  |  17  |   8  |   7  |
           |------+------+------+------+------+------|
           |  28  |  25  |  19  |  16  |   9  |   6  |
    ,------+------+------+------+------+------+------|
    |  31  |  29  |  24  |  20  |  15  |  10  |   5  |
    `------+------+------+------+------+------|------|---------------.
           |  30  |  23  |  21  |  14  |  11  |   4  | /  3   /  2   |
           `-------------------------------------------------|------/
                            |  22  |  13  |  12  |  /   0  /   1  /
                            `------------------------------------'
"""
class KMKKeyboard(_KMKKeyboard):
    row_pins = (
        board.P0_22,
        board.P0_24,
        board.P1_00,
        board.P0_11,
        board.P1_04,
    )
    col_pins = (
        board.P0_29,
        board.P0_02,
        board.P1_15,
        board.P1_13,
        board.P1_11,
        board.P0_10,
        board.P0_09,
    )
    #diode_orientation = DiodeOrientation.COL2ROW

    rx = board.RX
    tx = board.TX
    #SCL=  board.SCL
    #SDA=  board.SDA
    powersave_pin = board.P0_13


    #Scancode mapping (skip 6, 13, 29, max = 5X7 = 35)
    coord_mapping = [
         0,  1,  2,  3,  4,  5,                    42, 41, 40, 39, 38, 37,
         7,  8,  9, 10, 11, 12,                    49, 48, 47, 46, 45, 44,
    28, 14, 15, 16, 17, 18, 19,                    56, 55, 54, 53, 52, 51, 65,
        21, 22, 23, 24, 25, 26, 27, 20,    57, 64, 63, 62, 61, 60, 59, 58,         
                   30, 31, 32, 33, 34,      71, 70, 69, 68, 67,  
                   35,36,                                72,73 #<-- second scanner
    ]

    leds_mapping = [
            27, 26, 18, 17, 8, 7,                   39, 40, 49, 50, 58, 59 , 
            28, 25, 19, 16, 9, 6,                   38, 41, 48, 51, 57, 60,
         31,29, 24, 20, 15, 10, 5,                  37, 42, 47, 52, 56, 61, 63,
            30, 23, 21, 14, 11, 4, 3, 2,    34, 35, 36, 43, 46, 53, 55, 62,  
                   22, 13, 12, 0, 1,            33, 32, 44, 45, 54 
    ]

    def __init__(self):
        # create and register the scanner
        self.matrix = [MatrixScanner(
            # required arguments:
            column_pins=self.col_pins,
            row_pins=self.row_pins,
            # optional arguments with defaults:
            columns_to_anodes=DiodeOrientation.COL2ROW,
            interval=0.02,  # Debounce time in floating point seconds
            max_events=64
        ),
        RotaryioEncoder(
            pin_a=board.P1_06,
            pin_b=board.P0_31,
            # optional
            divisor=4,
        )]
