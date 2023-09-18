local db = require('dashboard')

local conf = {}
conf.header = {
    "",
    "",
    "",
    "",
    "     ▄████▄                                                     ",
    "    ███  ██▄                                                    ",
    "    ▀▀    ██▄                                 _|                ",
    "           ██           _|_|_|    _|      _|      _|_|_|  _|_|  ",
    "         ████           _|    _|  _|      _|  _|  _|    _|    _|",
    "       ██████▄          _|    _|    _|  _|    _|  _|    _|    _|",
    "      ██▀  ███          _|    _|      _|      _|  _|    _|    _|",
    "    ▄██▀    ██▄▄██                                              ",
    "    ██▀      ▀██▀                                               ",
    "",
    "",
    "",
    ""
}

conf.center = {
    {
        icon = "󰈞  ",
        desc = "Find  File                              ",
        action = "Telescope find_files",
        key = "SPC f f",
    },
    {
        icon = "  ",
        desc = "Open Configuration                     ",
        action = "tabnew $MYVIMRC | tcd %:p:h",
        key = "SPC e v",
    },
    {
        icon = "  ",
        desc = "New file                                ",
        action = "enew",
        key = "e",
    },
    {
        icon = "×  ",
        desc = "Quit Nvim                               ",
        action = "qa",
        key = "q",
    },
}

db.setup({
    theme = 'doom',
    shortcut_type = 'number',
    config = conf
})
