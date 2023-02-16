from kmk.kmktime import PeriodicTimer
from kmk.extensions.lock_status import LockStatus
from kmk.modules.split import  SplitSide
from kmk.keys import make_key
from kmk.handlers.stock import passthrough as handler_passthrough
import board
import neopixel
import busio
import adafruit_displayio_ssd1306
import displayio

from side import split_side

class ext(LockStatus):



    def __init__(self, leds, leds_mapping):
        super().__init__()
        self.currentlayer = None
        self.brightness = 0.1
        self.needupdate = False
        self.caps_lock = False
        self.num_lock = False
        self.scroll_lock = False
        self.leds = leds
        self.leds_mapping = leds_mapping
        self.initHardware()
    
        make_key(
            names=("EXT_BR_UP",), on_press=self._bri_up, on_release=handler_passthrough
        )
        make_key(
            names=("EXT_BR_DOWN",), on_press=self._bri_down, on_release=handler_passthrough
        )

    def initOLED(self):
        """print("init stuff")
        self.group = displayio.Group(max_size=3)
        self.layersname = ["base","fn","media","mouse"]
        self.group.append(displayio.TileGrid(displayio.OnDiskBitmap("/default.bmp"), pixel_shader=displayio.ColorConverter(), position=(0, 0)))
        self.group.append(displayio.TileGrid(displayio.OnDiskBitmap("/default.bmp"), pixel_shader=displayio.ColorConverter(), position=(0, 0)))
        self.group.append(displayio.TileGrid(displayio.OnDiskBitmap("/default.bmp"), pixel_shader=displayio.ColorConverter(), position=(0, 0))
        """
        displayio.release_displays()
        self.i2c = busio.I2C(board.SCL, board.SDA)
        self.display_bus = displayio.I2CDisplay(self.i2c, device_address=0x3C)
        self.display = adafruit_displayio_ssd1306.SSD1306(
            self.display_bus,
            width=128,
            height=32,
            rotation=180,
            brightness=self.brightness,
        )
        return

    def initHardware(self):
        self.initLeds()
        self.updateLeds(None,True)
        
        self.initOLED()
        self.updateOLED(None)
        return
    
    def updateOLED(self, sandbox):
        #self.group[0] = self.layersname[sandbox.active_layers[0]]
        #if self.report and self.report & LockCode.CAPSLOCK : caplock = 1
        #self.display.show(self.group)
        bitmap =  displayio.OnDiskBitmap("/default.bmp")
        tile_grid = displayio.TileGrid(bitmap, pixel_shader=bitmap.pixel_shader)
        group = displayio.Group()
        group.append(tile_grid)
        self.display.show(group)
        return

    def initLeds(self):
        self.timer = PeriodicTimer(25) # led chase timer   
        self.numPixels = 32
        self.intensity = int(self.brightness * 255)
        self.pixels = neopixel.NeoPixel(board.TX, self.numPixels , brightness=0.1, auto_write=False)
        self.chaseled = 0
        return
    
    def updateLeds(self,sandbox,update):
        
        if self.timer.tick():
            update = True
            self.chaseled = ( self.chaseled + 1 ) % self.numPixels

        
        if update:

            # base layer
            """if self.currentlayer == 0:
                self.pixels.fill((0, 0, self.intensity))
            elif self.currentlayer == 1:
                self.pixels.fill((0, self.intensity, 0))
            elif self.currentlayer == 2:
                self.pixels.fill((self.intensity, 0, 0))
            elif self.currentlayer == 3:
                self.pixels.fill((self.intensity, self.intensity, 0))
            """
            self.pixels.fill((0, 0, 0))
            # led chase
            self.pixels[self.chaseled] = (( self.intensity, 0, 0))

            offset = 32
            if split_side == SplitSide.LEFT:
                offset = 0

            ledlayer = self.currentlayer
            if ledlayer == None:
                ledlayer = 0
            for i in range(64):
                lednumber = self.leds_mapping[i] - offset
                if lednumber >= 0 and lednumber < 32:
                    if isinstance(self.leds[ledlayer][i], (tuple)):
                        
                        self.pixels[lednumber] = tuple([self.intensity*x for x in self.leds[ledlayer][i]]) 
                    if self.leds[ledlayer][i] == 1: #capslock
                        if (self.caps_lock == True) :
                            self.pixels[lednumber] = (self.intensity, 0, 0)
                    if self.leds[ledlayer][i] == 2: #numlock
                        if (self.num_lock == True) :
                            self.pixels[lednumber] = (self.intensity, 0, 0)
                    if self.leds[ledlayer][i] == 3: #scrolllock
                        if (self.scroll_lock == True) :
                            self.pixels[lednumber] = (self.intensity, 0, 0)            


            
            self.pixels.show()
        
        return
    
    def on_runtime_enable(self, sandbox):
        return

    def on_runtime_disable(self, sandbox):
        return

    def during_bootup(self, keyboard):
        
        return
    
        
    def before_matrix_scan(self, sandbox):
        if sandbox.active_layers[0] != self.currentlayer:
            self.currentlayer = sandbox.active_layers[0]
            #print("layer changed to " + str(self.currentlayer))
            self.needupdate

        if self.needupdate:
            self.updateLeds(sandbox,True)
            self.updateOLED(sandbox)
        else :
            self.updateLeds(sandbox,False) 
        
        self.needupdate = False
        return
    

    def after_matrix_scan(self, sandbox):
        return

    def before_hid_send(self, sandbox):
        return

    def after_hid_send(self, sandbox):
        
        super().after_hid_send(sandbox)  # Critically important. Removing this will break lock status.
        if self.report_updated  :
            self.caps_lock = self.get_caps_lock()
            self.num_lock = self.get_num_lock()
            self.scroll_lock = self.get_scroll_lock()
            #print("capslock : " + str(self.caps_lock) + " numlock : " + str(self.num_lock) + " scrolllock : " + str(self.scroll_lock))
            self.needupdate

        

        return

    def on_powersave_enable(self, sandbox):
        return

    def on_powersave_disable(self, sandbox):
        self.updateLeds(sandbox,True)
        self.initOLED()
        self.updateOLED(sandbox)
        return
    
    def _bri_up(self, *args, **kwargs):
        self.brightness = self.brightness + 0.1
        if self.brightness > 1.0:
            self.brightness = 1.0
        self.display.brightness = self.brightness
        self.intensity = int(self.brightness * 255)
        self.needupdate = True
        return
    
    def _bri_down(self, *args, **kwargs):
        self.brightness = self.brightness - 0.1
        if self.brightness < 0.0:
            self.brightness = 0.0
        self.display.brightness = self.brightness
        self.intensity = int(self.brightness * 255)
        self.needupdate = True
        return
    
