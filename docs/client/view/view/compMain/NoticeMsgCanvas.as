// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compMain.NoticeMsgCanvas

package com.qeedoo.ui.view.compMain
{
    import mx.containers.VBox;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
    import com.qeedoo.game.utils.TextUtil;
    import mx.controls.Text;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
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

    public class NoticeMsgCanvas extends VBox 
    {

        private var maxNum:uint = 3;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":VBox,
            "propertiesFactory":function ():Object
            {
                return ({"width":400});
            }
        });
        private var textQueue:Array = new Array();
        private var waitQueue:Array = new Array();
        private var _core:Core = Core.getInstance();

        public function NoticeMsgCanvas()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.horizontalAlign = "center";
                this.verticalGap = 0;
                this.backgroundAlpha = 0.3;
                this.fontSize = 14;
                this.color = 16720418;
                this.fontWeight = "bold";
            };
            this.width = 400;
            this.mouseEnabled = false;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
            this.alpha = 1;
            this.mouseChildren = false;
            this.cacheAsBitmap = true;
        }

        public function addText(_arg_1:String, _arg_2:uint=2000):void
        {
            _arg_1 = TextUtil.decode(_arg_1);
            if (textQueue.length >= maxNum)
            {
                waitForAppend(_arg_1, _arg_2);
                return;
            };
            var _local_3:Text = new Text();
            _local_3.setStyle("color", "#FF2222");
            _local_3.htmlText = _arg_1;
            _local_3.cacheAsBitmap = true;
            var _local_4:Timer = new Timer(_arg_2, 1);
            _local_4.addEventListener(TimerEvent.TIMER_COMPLETE, complete);
            var _local_5:Object = new Object();
            _local_5["timer"] = _local_4;
            _local_5["ui"] = _local_3;
            textQueue.push(_local_5);
            textQueue[0]["ui"].cacheAsBitmap = true;
            textQueue[0]["ui"].filters = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            this.addChild(_local_3);
            _local_4.start();
            visible = true;
        }

        private function oneLineShift():void
        {
            var _local_1:Object;
            if (waitQueue.length > 0)
            {
                _local_1 = waitQueue.shift();
                addText(_local_1["str"], _local_1["time"]);
                _local_1 = null;
            };
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        private function waitForAppend(_arg_1:String, _arg_2:uint):void
        {
            var _local_3:Object = new Object();
            _local_3["str"] = _arg_1;
            _local_3["time"] = _arg_2;
            waitQueue.push(_local_3);
        }

        private function complete(_arg_1:TimerEvent):void
        {
            var _local_2:Object = textQueue.shift();
            if (textQueue.length != 0)
            {
                Text(textQueue[0]["ui"]).cacheAsBitmap = true;
                Text(textQueue[0]["ui"]).filters = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            };
            this.removeChild(_local_2["ui"]);
            Timer(_arg_1.target).removeEventListener(TimerEvent.TIMER_COMPLETE, complete);
            oneLineShift();
            _local_2 = null;
            if (numChildren <= 0)
            {
                visible = false;
            };
        }


    }
}//package com.qeedoo.ui.view.compMain

