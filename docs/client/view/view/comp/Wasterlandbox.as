// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.Wasterlandbox

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import flash.display.Sprite;
    import flash.display.Bitmap;
    import mx.core.UIComponent;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.controls.Alert;
    import mx.core.IUITextField;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.view.compDragable.Wasteland;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.MouseEvent;
    import mx.events.CloseEvent;
    import mx.events.FlexEvent;
    import flash.display.BitmapData;

    public class Wasterlandbox extends Canvas 
    {

        private static var yellowbm:Sprite;

        private var bm:Bitmap;
        private var uic:UIComponent;
        private var index:int = -1;
        private var covered:Boolean = false;
        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":50,
                    "height":50,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":UIComponent,
                        "id":"container",
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
        private var _410956671container:UIComponent;
        public var type:int = -1;

        public function Wasterlandbox()
        {
            mx_internal::_document = this;
            this.width = 50;
            this.height = 50;
            this.addEventListener("creationComplete", ___Wasterlandbox_Canvas1_creationComplete);
        }

        [Bindable(event="propertyChange")]
        public function get container():UIComponent
        {
            return (this._410956671container);
        }

        public function set container(_arg_1:UIComponent):void
        {
            var _local_2:Object = this._410956671container;
            if (_local_2 !== _arg_1)
            {
                this._410956671container = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "container", _local_2, _arg_1));
            };
        }

        public function click(_arg_1:MouseEvent):void
        {
            var _local_2:String;
            var _local_3:Alert;
            var _local_4:IUITextField;
            if (this.index == 3)
            {
                Core.getInstance().sysMidNote(Language.SUMMER_GAME_PANEL[66]);
                return;
            };
            if (this.type != -1)
            {
                if (Wasteland.showAlert)
                {
                    _local_2 = Language.ANNIVERSARY_LANG[19];
                    _local_3 = Alert.show(_local_2, "", (Alert.YES | Alert.NO), null, showChange);
                    _local_4 = _local_3.mx_internal::alertForm.mx_internal::textField;
                    _local_4.htmlText = _local_2;
                    _local_4.filters = GamePredef.FILTER_TEXT1;
                }
                else
                {
                    Core.getInstance().remote.call("wastelandChangeBox", null, index);
                };
                return;
            };
            Core.getInstance().remote.call("wastelandSetBox", null, index);
        }

        private function showChange(_arg_1:CloseEvent):void
        {
            if (_arg_1.detail == Alert.YES)
            {
                Core.getInstance().remote.call("wastelandChangeBox", null, index);
            };
        }

        private function init():void
        {
        }

        public function ___Wasterlandbox_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function setIndex(_arg_1:int):void
        {
            index = _arg_1;
        }

        public function mouseOver(_arg_1:MouseEvent):void
        {
            if (!yellowbm)
            {
                return;
            };
            yellowbm.x = (this.x - 4);
            yellowbm.y = (this.y - 4);
            this.parent.addChild(yellowbm);
        }

        public function refresh(_arg_1:BitmapData):void
        {
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        public function register():void
        {
            addEventListener(MouseEvent.ROLL_OVER, mouseOver);
            addEventListener(MouseEvent.ROLL_OUT, mouseOut);
            addEventListener(MouseEvent.CLICK, click);
        }

        public function mouseOut(_arg_1:MouseEvent):void
        {
            if (!yellowbm)
            {
                return;
            };
            if (yellowbm.parent)
            {
                yellowbm.parent.removeChild(yellowbm);
            };
        }

        public function setType(_arg_1:int, _arg_2:Boolean):void
        {
            var _local_3:Bitmap;
            if (!bm)
            {
                uic = new UIComponent();
                bm = new Bitmap();
                uic.addChild(bm);
                addChild(uic);
                if (!yellowbm)
                {
                    yellowbm = new Sprite();
                    yellowbm.mouseChildren = false;
                    yellowbm.mouseEnabled = false;
                    _local_3 = new Bitmap();
                    _local_3.bitmapData = Wasteland.yellowBMD;
                    yellowbm.addChild(_local_3);
                };
            };
            type = _arg_1;
            covered = _arg_2;
            if (type == -1)
            {
                bm.bitmapData = Wasteland.backBMD;
            }
            else
            {
                if (!covered)
                {
                    bm.bitmapData = Wasteland.pic_bmds[type];
                }
                else
                {
                    bm.bitmapData = Wasteland.picc_bmds[type];
                };
            };
        }


    }
}//package com.qeedoo.ui.view.comp

