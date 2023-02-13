import gc

from kb import KMKKeyboard
from kmk.hid import HIDModes
from kmk.modules.split import Split, SplitType
from kmk.extensions.media_keys import MediaKeys
from kmk.modules.mouse_keys import MouseKeys
from kmk.modules.layers import Layers
from kmk.modules.modtap import ModTap
from kmk.keys import KC
from side import split_side, banner, debug

print(banner)

keyboard = KMKKeyboard()
keyboard.modules.append(Layers())
keyboard.extensions.append(MediaKeys())
keyboard.modules.append(MouseKeys())
keyboard.modules.append(Split(split_type=SplitType.BLE, split_side=split_side, debug_enabled=debug))
keyboard.modules.append(ModTap())

from ext import ext
_ext = ext()
keyboard.extensions.append(_ext)


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
XXXXXXX = KC.N0 #KC.NO
LOWER = KC.MO(1)
RAISE = KC.MO(2)
LALT_ENT = KC.MT(KC.ENTER,KC.LALT)
RALT_ENT = KC.MT(KC.ENTER,KC.RALT)
gc.collect()
keyboard.keymap = [
    [   #Main
                 KC.ESC,    KC.N1,   KC.N2,   KC.N3,   KC.N4,   KC.N5,                                      KC.N6,   KC.N7,   KC.N8,   KC.N9,  KC.N0,    KC.BSLASH,
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
    [  #LOWER
                 _______, KC.F1,   KC.F2,    KC.F3,      KC.F4,     KC.F5,                                           KC.F6,     KC.F7,   KC.F8,     KC.F9,    KC.F10,   KC.F11,
                 _______, XXXXXXX, KC.MB_LMB,KC.MS_UP,   KC.MB_RMB, KC.BSPACE,                                       KC.DEL,    KC.HOME, KC.UP,     KC.END,   KC.PGUP,  XXXXXXX,
        _______, _______, KC.APP,  KC.MS_LT, KC.MS_DOWN, KC.MS_RT,  KC.DEL,                                          KC.BSPACE, KC.LEFT, KC.DOWN,   KC.RIGHT, KC.PGDOWN,XXXXXXX, KC.F12,
                 _______, XXXXXXX, XXXXXXX,  KC.MB_MMB,  XXXXXXX,   XXXXXXX, _______,  _______,    _______, _______, XXXXXXX,   KC.PGUP, KC.PGDOWN, XXXXXXX,  XXXXXXX,  _______,
                                     _______, _______, _______, _______, _______,                     _______, LOWER,  _______, RAISE,  _______,
        #encoder
        _______,
        _______, 
        _______,
        _______
    ],
    [  #RAISE
                 _______, KC.F1, KC.F2, KC.F3, KC.F4, KC.F5,                                                 KC.F6,     KC.F7,   KC.F8,     KC.F9,       KC.F10,    KC.F11,
                 _______, KC.NO, KC.N1, KC.N2, KC.N3, KC.BSPACE,                                             KC.DEL,    KC.HOME, KC.UP,     KC.END,      KC.PGUP,   XXXXXXX,
        _______, _______, KC.NO, KC.N4, KC.N5, KC.N6, KC.DEL,                                                KC.BSPACE, KC.LEFT, KC.DOWN,   KC.RIGHT,    KC.PGDOWN, XXXXXXX, KC.F12,
                 _______, KC.NO, KC.N7, KC.N8, KC.N9, KC.DOT, _______,  _______,           _______, _______, XXXXXXX,   KC.PGUP, KC.PGDOWN,  XXXXXXX,    XXXXXXX,   _______,
                               _______, _______, _______, _______, _______,                   _______, LOWER,  _______, RAISE,  _______,
        #encoder
        _______,
        _______, 
        _______,
        _______
    ]
]


if __name__ == '__main__':
    keyboard.debug_enabled = False
    gc.collect()
    print("---Go " + str(gc.mem_free()))
    keyboard.go(hid_type=HIDModes.BLE,ble_name='AlexKeyboard')

