{...}:
{
    services.kanata = {
        enable = true;
        keyboards.default = {
            config = ''
                (defsrc ralt u i h j k l )
                (defalias 
                    nav (tap-hold 40 200 ralt (layer-while-held navigation))
                )
                (deflayer base
                    @nav _ _ _ _ _ _
                )
                (deflayer navigation
                    _ home end left down up right 
                )
                
            '';
        };
    };
}