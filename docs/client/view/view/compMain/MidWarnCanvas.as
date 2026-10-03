// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compMain.MidWarnCanvas

package com.qeedoo.ui.view.compMain
{
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import com.qeedoo.game.ui.IMainUI;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.config.Language;
    import flash.events.MouseEvent;
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

    public class MidWarnCanvas extends SimpleCanvas implements IMainUI 
    {

        private var currentWarn:*;
        private var _1768633739warnImage:Image;
        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":50,
                    "height":50,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"warnImage",
                        "events":{"click":"__warnImage_click"},
                        "stylesFactory":function ():void
                        {
                            this.themeColor = 2782887;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "percentHeight":100
                            });
                        }
                    })]
                });
            }
        });
        private var warnArray:Array = new Array();
        private var _core:Core = Core.getInstance();

        public function MidWarnCanvas()
        {
            mx_internal::_document = this;
            this.width = 50;
            this.height = 50;
            this.cacheAsBitmap = true;
        }

        public function addWarn(_arg_1:Object):void
        {
            this.x = ((this.parent.width - this.width) / 2);
            this.y = (((this.parent.height - this.height) / 2) - 150);
            warnArray.push(_arg_1);
            visible = true;
            initView();
        }

        public function reset():void
        {
            warnArray = new Array();
            warnImage.source = null;
            visible = false;
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        public function delThisImage():*
        {
            var _local_1:Object;
            for each (_local_1 in warnArray)
            {
                if (_local_1.warnType == GamePredef.WARN_TYPE_ROBBER)
                {
                    delete warnArray[warnArray.indexOf(_local_1)];
                    currentWarn = undefined;
                };
            };
            initView();
        }

        public function update():void
        {
        }

        public function initView():void
        {
            var _local_2:int;
            var _local_1:* = "";
            if (warnArray.length != 0)
            {
                _local_2 = (warnArray.length - 1);
                while (_local_2 >= 0)
                {
                    if (warnArray[_local_2])
                    {
                        currentWarn = warnArray[_local_2];
                        break;
                    };
                    _local_2--;
                };
                if (currentWarn)
                {
                    visible = true;
                    switch (currentWarn.warnType)
                    {
                        case GamePredef.WARN_TYPE_ROBBER:
                            warnImage.source = ResManager.ICON_GLOBAL_000009;
                            _local_1 = Language.WARNCANVAS_S[7];
                            warnImage.toolTip = _local_1;
                            break;
                    };
                }
                else
                {
                    visible = false;
                };
            }
            else
            {
                visible = false;
            };
        }

        public function __warnImage_click(_arg_1:MouseEvent):void
        {
            imageClick();
        }

        public function set warnImage(_arg_1:Image):void
        {
            var _local_2:Object = this._1768633739warnImage;
            if (_local_2 !== _arg_1)
            {
                this._1768633739warnImage = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "warnImage", _local_2, _arg_1));
            };
        }

        private function imageClick():void
        {
            var _local_1:* = "";
            switch (currentWarn.warnType)
            {
                case GamePredef.WARN_TYPE_ROBBER:
                    _core.sysMidNote(Language.WARNCANVAS_S[8]);
                    delThisImage();
                    return;
            };
        }

        [Bindable(event="propertyChange")]
        public function get warnImage():Image
        {
            return (this._1768633739warnImage);
        }


    }
}//package com.qeedoo.ui.view.compMain

