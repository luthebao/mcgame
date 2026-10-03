// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.BoxLabel

package com.qeedoo.ui.view.comp
{
    import mx.controls.TextInput;
    import mx.styles.CSSStyleDeclaration;
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

    public class BoxLabel extends TextInput 
    {

        public function BoxLabel()
        {
            super();
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.textIndent = 5;
            };
            this.styleName = "BoxLabel";
            this.editable = false;
            this.height = 18;
        }

        override public function initialize():void
        {
            super.initialize();
        }


    }
}//package com.qeedoo.ui.view.comp

