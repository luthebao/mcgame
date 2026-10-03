// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.CrossContentionSinglePanel_inlineComponent1

package com.qeedoo.ui.view.compDragable
{
    import mx.controls.Text;
    import com.qeedoo.game.predef.GamePredef;
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

    public class CrossContentionSinglePanel_inlineComponent1 extends Text 
    {

        private var _88844982outerDocument:CrossContentionSinglePanel;

        public function CrossContentionSinglePanel_inlineComponent1()
        {
            this.selectable = false;
        }

        override public function set data(_arg_1:Object):void
        {
            super.data = _arg_1;
            this.htmlText = (((("<font color='" + GamePredef.AREAR_COLOR[data.p]) + "'>") + _arg_1.aname) + "</font>");
        }

        [Bindable(event="propertyChange")]
        public function get outerDocument():CrossContentionSinglePanel
        {
            return (this._88844982outerDocument);
        }

        override public function initialize():void
        {
            super.initialize();
        }

        public function set outerDocument(_arg_1:CrossContentionSinglePanel):void
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

