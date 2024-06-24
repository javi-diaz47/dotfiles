#from libqtile.config import Key
from libqtile.config import EzKey as Key
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

def get_keys(mod):
        
    terminal = guess_terminal()

 #   modifier_keys = {
 #      'M': 'mod4'
 #      'A': 'mod1'
 #      'S': 'shift'
 #      'C': 'control'
 #   }

    return [
        # D E F A U L T 
        Key("M-h", lazy.layout.left(), desc="Move focus to left"),
        Key("M-l", lazy.layout.right(), desc="Move focus to right"),
        Key("M-j", lazy.layout.down(), desc="Move focus down"),
        Key("M-k", lazy.layout.up(), desc="Move focus up"),
        
        Key("M-S-h", lazy.layout.shuffle_left(), desc="Move window to the left"),
        Key("M-S-l", lazy.layout.shuffle_right(), desc="Move window to the right"),
        Key("M-S-j", lazy.layout.shuffle_down(), desc="Move window down"),
        Key("M-S-k", lazy.layout.shuffle_up(), desc="Move window up"),
       
        Key("M-C-h", lazy.layout.grow_left(), desc="Grow window to the left"),
        Key("M-C-l", lazy.layout.grow_right(), desc="Grow window to the right"),
        Key("M-C-j", lazy.layout.grow_down(), desc="Grow window down"),
        Key("M-C-k", lazy.layout.grow_up(), desc="Grow window up"),
        Key("M-n", lazy.layout.normalize(), desc="Reset all window sizes"),
       
        Key("M-S-<Return>", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),
        Key("M-<Return>", lazy.spawn(terminal), desc="Launch terminal"),
        
        Key("M-<Tab>", lazy.next_layout(), desc="Toggle between layouts"),
        Key("M-q", lazy.window.kill(), desc="Kill focused window"),
        Key("M-f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen on the focused window"),
        Key("M-<space>", lazy.next_layout(), desc="Toggle floating on the focused window"),
        Key("M-S-<space>", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
        Key("M-C-r", lazy.reload_config(), desc="Reload the config"),
        Key("M-C-q", lazy.shutdown(), desc="Shutdown Qtile"),
        Key("M-r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),

    
        # C U S T O M
        Key("M-S-d", lazy.spawn("rofi -show drun"), desc="Menu"),
        Key("M-s", lazy.spawn("flameshot gui"), desc='Screenshot'),
        Key("M-e", lazy.spawn("thunar"), desc='File manager'),
        Key("M-S-e", lazy.spawn("rofi -show emoji -modi emoji"), desc='Show emoji menu'),
        Key("M-c", lazy.spawn("rofi -show calc -no-show-match -no-sort"), desc='Open calculator'),

    ]


