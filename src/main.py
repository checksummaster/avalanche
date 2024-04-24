import gc

from kb import KMKKeyboard
from kmk.hid import HIDModes
from kmk.modules.split import Split, SplitType
from kmk.extensions.media_keys import MediaKeys
from kmk.modules.mouse_keys import MouseKeys
from kmk.modules.layers import Layers
from kmk.modules.modtap import ModTap
from kmk.keys import KC
from kmk.modules.split import  SplitSide
from side import split_side, banner, debug, usebluetooth

print(banner)
mem = gc.mem_free()
keyboard = KMKKeyboard()
keyboard.modules.append(Layers())
keyboard.extensions.append(MediaKeys())
keyboard.modules.append(MouseKeys())
if usebluetooth:
    keyboard.modules.append(Split(split_type=SplitType.BLE, split_side=split_side, debug_enabled=debug))
else:
    keyboard.modules.append(Split( split_side=split_side, debug_enabled=debug))
keyboard.modules.append(ModTap())


from kmk.modules.power import Power
keyboard.modules.append(Power(powersave_pin=keyboard.powersave_pin))

print("---Memory used by extension: " + str(mem - gc.mem_free()))

mem = gc.mem_free()



L______ = 0
LED_CAPS = 1
LED_NUML = 2
LED_SCRL = 3
L___R   = (1,0,0)
L___G   = (0,1,0)
L___B   = (0,0,1)
L___Y   = (1,1,0)
L___C   = (0,1,1)
L___M   = (1,0,1)
L___W   = (1,1,1)


Leds = [
    [   #Main  KC.RESET
                 L___B  ,  L______,  LED_NUML, L______,  L______,  L______,                                              L______,  L______,  L______,  L______,  LED_SCRL, L___B,
                 L______,  L______,  L______,  L______,  L______,  L______,                                              L______,  L______,  L______,  L______,  L______,  L______,
       LED_CAPS, L______,  L______,  L______,  L______,  L______,  L______,                                              L______,  L______,  L______,  L______,  L______,  L______, L______,
                 L______,  L______,  L______,  L______,  L______,  L______,  L______,  L______,      L______  ,  L______,  L______,  L______,  L______,  L______,  L______,  L______,
                                               L______,  L______,  L______,  L______,  L______,      L______  ,  L______,  L______,  L______,  L______
    ],
    [  #LOWER
                 L___G  ,  L______,  L______,  L______,  L______,  L______,                                              L______,  L______,  L______,  L______,  L______,  L___G,
                 L______,  L______,  L______,  L___R  ,  L______,  L______,                                              L______,  L______,  L___R  ,  L______,  L___Y  ,  L______,
       LED_CAPS, L______,  L______,  L___R  ,  L___R  ,  L___R  ,  L______,                                              L______,  L___R  ,  L___R  ,  L___R  ,  L___C  ,  L______, L______,
                 L______,  L______,  L______,  L______,  L______,  L______,  L______,  L______,      L______,  L______,  L______,  L___Y  ,  L___C  ,  L______,  L______,  L______,
                                               L______,  L______,  L______,  L______,  L______,      L______,  L______,  L______,  L______,  L______    
    ],
    [  #RAISE 
                 L___R  ,  L______,  L______,  L______,  L______,  L______,                                              L______,  L______,  L______,  L______,  L______,  L___R,
                 L______,  L______,  L___B  ,  L___B  ,  L___B  ,  L___G  ,                                              L______,  L______,  L______,  L______,  L______,  L______,
       LED_CAPS, L______,  L______,  L___B  ,  L___B  ,  L___B  ,  L___R,                                                L______,  L______,  L______,  L______,  L______,  L______, L______,
                 L______,  L______,  L___B  ,  L___B  ,  L___B  ,  L______,  L______,  L______,      L______,  L______,  L______,  L______,  L______,  L______,  L______,  L______,
                                               L______,  L______,  L______,  L______,  L___R  ,      L______,  L______,  L______,  L______,  L______  
    ],
]



from ext import ext
_ext = ext(Leds, keyboard.leds_mapping,L___R)
keyboard.extensions.append(_ext)
gc.collect()
print("---Memory used by custom extension: " + str(mem - gc.mem_free()))

try :
    from kmk.modules.pimoroni_trackball import Trackball, TrackballMode
    keyboard.modules.append(Trackball(_ext.i2c))
except Exception as e:
    print("Error loading trackball module: " + str(e))



#from kmk.modules.serialace import SerialACE
#keyboard.modules.append(SerialACE())

#from btuart import btuart
#keyboard.extensions.append(btuart())


# Cleaner key names
_______ = KC.TRNS
XXXXXXX = KC.NO
LOWER = KC.MO(1)
RAISE = KC.MO(2)
LALT_ENT = KC.MT(KC.ENTER,KC.LALT)
RALT_ENT = KC.MT(KC.ENTER,KC.RALT)
ESC = KC.MT(KC.ESC,KC.RESET)
BSLASH = KC.MT(KC.BSLASH,KC.RESET)
gc.collect()
mem = gc.mem_free()
keyboard.keymap = [
    [   #Main  KC.RESET
                 ESC,       KC.N1,   KC.N2,   KC.N3,   KC.N4,   KC.N5,                                      KC.N6,   KC.N7,   KC.N8,   KC.N9,  KC.N0,    BSLASH,
                 KC.TAB,    KC.Q,    KC.W,    KC.E,    KC.R,    KC.T,                                       KC.Y,    KC.U,    KC.I,    KC.O,   KC.P,     KC.LBRC,
        KC.CAPS, KC.LSFT,   KC.A,    KC.S,    KC.D,    KC.F,    KC.G,                                       KC.H,    KC.J,    KC.K,    KC.L,   KC.SCLN,  KC.QUOT, KC.RBRC,
                 KC.LCTL,   KC.Z,    KC.X,    KC.C,    KC.V,    KC.B, KC.DEL,KC.LGUI,   KC.INSERT, KC.BSPACE,  KC.N,    KC.M, KC.COMM,  KC.DOT, KC.SLSH, KC.RCTL,
                                 KC.MUTE,KC.GRAVE, KC.EQUAL,  KC.SPACE,  LALT_ENT,                   RALT_ENT, LOWER,  KC.MINUS, RAISE, KC.PSCREEN, 
        #encoder
        KC.VOLU,
        KC.VOLD,  
        KC.MW_UP,
        KC.MW_DOWN
    ],
    [  #LOWER                         Mouse + Functions keys                                                                          Arrows + Functions keys
                 _______, KC.F1,   KC.F2,    KC.F3,      KC.F4,     KC.F5,                                           KC.F6,     KC.F7,   KC.F8,     KC.F9,    KC.F10,   KC.F11,
                 _______, XXXXXXX, KC.MB_LMB,KC.MS_UP,   KC.MB_RMB, KC.BSPACE,                                       KC.DEL,    KC.HOME, KC.UP,     KC.END,   KC.PGUP,  XXXXXXX,
        _______, _______, KC.APP,  KC.MS_LT, KC.MS_DOWN, KC.MS_RT,  KC.DEL,                                          KC.BSPACE, KC.LEFT, KC.DOWN,   KC.RIGHT, KC.PGDOWN,XXXXXXX, KC.F12,
                 _______, XXXXXXX, XXXXXXX,  KC.MB_MMB,  XXXXXXX,   XXXXXXX, _______,  _______,    _______, _______, XXXXXXX,   KC.PGUP, KC.PGDOWN, XXXXXXX,  XXXXXXX,  _______,
                                     _______, _______, _______, _______, _______,                     _______, LOWER,  _______, RAISE,  _______,
        #encoder
        KC.EXT_BR_UP,
        KC.EXT_BR_DOWN, 
        _______,
        _______
    ],
    [  #RAISE                           NUMPAD                                                                                                              Arrorws + config (todo)
                 _______, XXXXXXX, KC.NUMLOCK, KC.KP_SLASH, KC.KP_ASTERISK, KC.KP_MINUS,                                               XXXXXXX,   XXXXXXX, XXXXXXX,  KC.PSCREEN,   KC.SCROLLLOCK, KC.PAUSE,
                 _______, KC.KP_0, KC.KP_1,    KC.KP_2,     KC.KP_3,        KC.KP_PLUS,                                                _______,   _______, _______,  _______,      _______,   XXXXXXX,
        _______, _______, KC.KP_0, KC.KP_4,    KC.KP_5,     KC.KP_6,        KC.KP_ENTER,                                               _______,   _______, _______,  _______,      _______,   XXXXXXX, KC.PS_TOG,
                 _______, KC.KP_0, KC.KP_7,    KC.KP_8,     KC.KP_9,        KC.KP_DOT, _______,  _______,            _______, _______, XXXXXXX,   _______, _______,  XXXXXXX,      XXXXXXX,   _______,
                               _______, _______, _______, _______,          KC.KP_ENTER,                                  _______, LOWER,  _______, RAISE,  _______,
        #encoder
        _______,
        _______, 
        _______,
        _______
    ]
]



print("---Memory used by keys: " + str(mem - gc.mem_free()))

if __name__ == '__main__':
    keyboard.debug_enabled = True
    gc.collect()
    print("---Free memory " + str(gc.mem_free()))
    if split_side == SplitSide.LEFT and usebluetooth:
        keyboard.go(hid_type=HIDModes.BLE,ble_name='AlexKeyboard')
    else:
        keyboard.go()

