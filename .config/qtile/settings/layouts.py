from libqtile import layout



def get_layouts():

    return [
        layout.Columns( margin= [10,10,10,10], border_focus='#1F1D2E',
            border_normal='#1F1D2E',
            border_width=0,
        ),

        layout.Max(	border_focus='#1F1D2E',
            border_normal='#1F1D2E',
            margin=10,
            border_width=0,
        ),

        layout.Floating(	border_focus='#1F1D2E',
            border_normal='#1F1D2E',
            margin=10,
            border_width=0,
        ),
        # Try more layouts by unleashing below layouts
    #  layout.Stack(num_stacks=2),
    #  layout.Bsp(),
        layout.Matrix(	border_focus='#1F1D2E',
            border_normal='#1F1D2E',
            margin=10,
            border_width=0,
        ),
        layout.MonadTall(	border_focus='#1F1D2E',
            border_normal='#1F1D2E',
            margin=10,
            border_width=0,
        ),
        layout.MonadWide(	border_focus='#1F1D2E',
            border_normal='#1F1D2E',
            margin=10,
            border_width=0,
        ),
    #  layout.RatioTile(),
        layout.Tile(	border_focus='#1F1D2E',
            border_normal='#1F1D2E',
        ),
    #  layout.TreeTab(),
    #  layout.VerticalTile(),
    #  layout.Zoomy(),
    ]
