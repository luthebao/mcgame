// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.RendererLabel

package com.qeedoo.ui.view.comp
{
    import mx.controls.Label;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.*;
    import flash.display.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.text.*;
    import flash.media.*;
    import mx.binding.*;
    import flash.net.*;
    import flash.utils.*;
    import flash.system.*;
    import flash.accessibility.*;
    import flash.ui.*;
    import flash.filters.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class RendererLabel extends Label 
    {


        override public function initialize():void
        {
            super.initialize();
        }

        override public function set data(_arg_1:Object):void
        {
            super.data = _arg_1;
            text = data.name;
            setStyle("color", GamePredef.CODE_ITEM_COLOR[_arg_1.color]);
        }


    }
}//package com.qeedoo.ui.view.comp

