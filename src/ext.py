from kmk.kmktime import PeriodicTimer
import board
import neopixel
import busio
import adafruit_displayio_ssd1306
from adafruit_display_text import label
import displayio


from kmk.extensions.lock_status import LockStatus

from side import split_side
from kmk.modules.split import  SplitSide




class ext(LockStatus):

    def __init__(self):
        super().__init__()
        self.currentlayer = -1

        self.timer = PeriodicTimer(25)
        # print("ext init pixels")
        self.numPixels = 32
        self.intensity = 25
        self.pixels = neopixel.NeoPixel(board.TX, self.numPixels , brightness=0.1, auto_write=False)
        
        self.chaseled = 0
        self.pixels.fill((0, 0, self.intensity))
        self.pixels[self.chaseled] = (( self.intensity, 0, 0))
        self.pixels.show()

        
        # print("ext init oled")
        
        displayio.release_displays()
        self.i2c = busio.I2C(board.SCL, board.SDA)
        display_bus = displayio.I2CDisplay(self.i2c, device_address=0x3C)
        
        self.display = adafruit_displayio_ssd1306.SSD1306(
            display_bus,
            width=128,
            height=32,
            rotation=180,
        )

        bitmap =  displayio.OnDiskBitmap("/default.bmp")
        tile_grid = displayio.TileGrid(bitmap, pixel_shader=bitmap.pixel_shader)
        group = displayio.Group()
        group.append(tile_grid)
        self.display.show(group)

        """
        self.layersname2 = ["base  ", "lower ", "raise ", "config"]
        self.layersname = [
            label.Label( terminalio.FONT, text="base", color=0xFFFFFF, x=0, y=10),
            label.Label( terminalio.FONT, text="lower", color=0xFFFFFF, x=0, y=10),
            label.Label( terminalio.FONT, text="raise", color=0xFFFFFF, x=0, y=10),
            label.Label( terminalio.FONT, text="config", color=0xFFFFFF, x=0, y=10)
        ]

       



        self.group = displayio.Group()
        self.group.append(self.layersname[0])
        self.display.show(self.group)
        """
    def updateOLED(self, sandbox):
        #self.group[0] = self.layersname[sandbox.active_layers[0]]
        #if self.report and self.report & LockCode.CAPSLOCK : caplock = 1
        #self.display.show(self.group)
        return

    def on_runtime_enable(self, sandbox):
        return

    def on_runtime_disable(self, sandbox):
        return

    def during_bootup(self, keyboard):
        return
    
    def updateLeds(self,sandbox,update):
        
        if self.timer.tick():
            update = True
            self.chaseled = ( self.chaseled + 1 ) % self.numPixels
        
        if update:
            if self.currentlayer == 0:
                self.pixels.fill((0, 0, self.intensity))
            elif self.currentlayer == 1:
                self.pixels.fill((0, self.intensity, 0))
            elif self.currentlayer == 2:
                self.pixels.fill((self.intensity, 0, 0))
            elif self.currentlayer == 3:
                self.pixels.fill((self.intensity, self.intensity, 0))
            self.pixels[self.chaseled] = (( self.intensity, 0, 0))

            if (split_side == SplitSide.LEFT) :
                if (self.get_caps_lock() == True) :
                    self.pixels[31] = (self.intensity, 0, 0)
            self.pixels.show()
        return
        
    def before_matrix_scan(self, sandbox):
        if sandbox.active_layers[0] != self.currentlayer:
            self.currentlayer = sandbox.active_layers[0]
            print("layer changed to " + str(self.currentlayer))
            self.updateOLED(sandbox)
            self.updateLeds(sandbox,True)
        else:
            self.updateLeds(sandbox,False)

        
        return

    def after_matrix_scan(self, sandbox):
        return

    def before_hid_send(self, sandbox):
        return

    def after_hid_send(self, sandbox):
        super().after_hid_send(sandbox)  # Critically important. Removing this will break lock status.
        if self.report_updated:
            self.updateLeds(sandbox,True)
            self.updateOLED(sandbox)
            print("caplock = ", self.get_caps_lock())
            
        return

    def on_powersave_enable(self, sandbox):
        return

    def on_powersave_disable(self, sandbox):
        return
    




