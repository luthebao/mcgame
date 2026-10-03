// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.DotaPanel_inlineComponent3

package com.qeedoo.ui.view.compDragable
{
    import mx.controls.Label;
    import com.qeedoo.game.config.Language;
    import mx.events.PropertyChangeEvent;
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

    public class DotaPanel_inlineComponent3 extends Label 
    {

        private var _88844982outerDocument:DotaPanel;


        override public function set data(_arg_1:Object):void
        {
            super.data = _arg_1;
            var _local_2:* = "#ff0000";
            if (_arg_1.group == 1)
            {
                _local_2 = "#00ff00";
                this.htmlText = (((("<font color='" + _local_2) + "'>") + Language.DOTA_PANEL[11]) + "</font>");
            }
            else
            {
                this.htmlText = (((("<font color='" + _local_2) + "'>") + Language.DOTA_PANEL[12]) + "</font>");
            };
        }

        [Bindable(event="propertyChange")]
        public function get outerDocument():DotaPanel
        {
            return (this._88844982outerDocument);
        }

        override public function initialize():void
        {
            super.initialize();
        }

        public function set outerDocument(_arg_1:DotaPanel):void
        {
            var _local_2:Object = this._88844982outerDocument;
            if (_local_2 !== _arg_1)
            {
                this._88844982outerDocument = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "outerDocument", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

