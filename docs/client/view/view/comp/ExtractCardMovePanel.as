// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.ExtractCardMovePanel

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import flash.display.MovieClip;
    import flash.utils.Timer;
    import mx.core.UIComponent;
    import mx.controls.Image;
    import flash.display.Loader;
    import flash.display.Sprite;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import flash.geom.Matrix;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.ui.resource.ResManager;
    import flash.events.MouseEvent;
    import flash.filters.GlowFilter;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import com.qeedoo.game.view.ViewManager;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import com.qeedoo.game.config.Language;
    import flash.events.TimerEvent;
    import flash.net.URLRequest;
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

    use namespace mx_internal;

    public class ExtractCardMovePanel extends Canvas implements IBindingClient 
    {

        private static var time_step:Number = 60;
        private static var cost:int = 20;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _3574721txt1:RoundedLabel;
        private var hnum:int = 5;
        private var isCut:Boolean = false;
        private var swidth:Number = 10;
        private var bg:MovieClip;
        private var time:Timer;
        private var img1:UIComponent;
        private var vnum:int = 4;
        private var turn_step:int = 0;
        private var _97420bg1:Image;
        private var sheight:Number = 10;
        private var load:Loader;
        private var turnS:Sprite = null;
        private var _410956671container:UIComponent;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":450,
                    "height":361,
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
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"bg1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "visible":false,
                                "x":-42
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"txt1",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 40;
                            this.color = 0xFFFF00;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "visible":false,
                                "x":-42
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var m:Matrix = new Matrix();
        private var imgs:Array = [];
        private var pList:Array = [];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function ExtractCardMovePanel()
        {
            mx_internal::_document = this;
            this.width = 450;
            this.height = 361;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ExtractCardMovePanel._watcherSetupUtil = _arg_1;
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

        public function set txt1(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._3574721txt1;
            if (_local_2 !== _arg_1)
            {
                this._3574721txt1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txt1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get bg1():Image
        {
            return (this._97420bg1);
        }

        public function init():void
        {
            img1 = new UIComponent();
            img1.mouseEnabled = false;
            img1.mouseChildren = false;
            img1.addChild(bg1);
            img1.addChild(txt1);
            addChild(img1);
            img1.visible = false;
        }

        override public function initialize():void
        {
            var target:ExtractCardMovePanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ExtractCardMovePanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_ExtractCardMovePanelWatcherSetupUtil");
                var _local_2:* = watcherSetupUtilClass;
                (_local_2["init"](null));
            };
            _watcherSetupUtil.setup(this, function (_arg_1:String):*
            {
                return (target[_arg_1]);
            }, bindings, watchers);
            var i:uint;
            while (i < bindings.length)
            {
                Binding(bindings[i]).execute();
                i++;
            };
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            super.initialize();
        }

        private function _ExtractCardMovePanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = ResManager.getResUrl(2080130101002);
        }

        private function mouseRollOut(_arg_1:MouseEvent):void
        {
            var _local_2:Sprite = (_arg_1.currentTarget as Sprite);
            if (_local_2)
            {
                _local_2.filters = [];
            };
        }

        public function set bg1(_arg_1:Image):void
        {
            var _local_2:Object = this._97420bg1;
            if (_local_2 !== _arg_1)
            {
                this._97420bg1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bg1", _local_2, _arg_1));
            };
        }

        public function showGet(_arg_1:String, _arg_2:int):void
        {
            var _local_3:Sprite = imgs[_arg_2];
            pList.push({
                "c":_arg_1,
                "s":_local_3
            });
            if (turn_step == 0)
            {
                showEffect();
            };
        }

        private function mouseRollOver(_arg_1:MouseEvent):void
        {
            var _local_2:Sprite = (_arg_1.currentTarget as Sprite);
            if (_local_2)
            {
                _local_2.filters = [new GlowFilter(0xFFFF00, 0.5, 6, 6, 8)];
            };
        }

        private function loadComplete(_arg_1:Event):void
        {
            var _local_2:Class = (load.contentLoaderInfo.applicationDomain.getDefinition("bbb") as Class);
            bg = new (_local_2)();
            init();
            cut();
        }

        [Bindable(event="propertyChange")]
        public function get txt1():RoundedLabel
        {
            return (this._3574721txt1);
        }

        private function loadError(_arg_1:IOErrorEvent):void
        {
            trace(" load Error ");
        }

        private function cut():void
        {
            var _local_4:Sprite;
            var _local_5:Bitmap;
            var _local_6:BitmapData;
            var _local_7:int;
            var _local_8:int;
            var _local_9:Number;
            var _local_10:Number;
            if (isCut)
            {
                return;
            };
            isCut = true;
            while (container.numChildren)
            {
                container.removeChildAt((container.numChildren - 1));
            };
            imgs.length = 0;
            swidth = (bg.width / hnum);
            sheight = (bg.height / vnum);
            var _local_1:Number = ((width - bg.width) / (hnum + 1));
            var _local_2:Number = ((height - bg.height) / (vnum + 1));
            var _local_3:int;
            while (_local_3 < (hnum * vnum))
            {
                _local_4 = new Sprite();
                _local_4.addEventListener(MouseEvent.ROLL_OVER, mouseRollOver);
                _local_4.addEventListener(MouseEvent.ROLL_OUT, mouseRollOut);
                _local_4.addEventListener(MouseEvent.CLICK, toSelect);
                _local_4.buttonMode = true;
                _local_5 = new Bitmap();
                _local_6 = new BitmapData(swidth, sheight, true, 0xFFFFFF);
                _local_5.bitmapData = _local_6;
                _local_7 = (_local_3 % hnum);
                _local_8 = int(int((_local_3 / hnum)));
                _local_9 = ((_local_1 * (_local_7 + 1)) + (_local_7 * swidth));
                _local_10 = ((_local_2 * (_local_8 + 1)) + (_local_8 * sheight));
                _local_5.x = (-(swidth) / 2);
                _local_4.x = (_local_9 + (swidth / 2));
                _local_4.y = _local_10;
                m.tx = -(_local_7 * swidth);
                m.ty = -(_local_8 * sheight);
                _local_6.draw(bg, m);
                imgs.push(_local_4);
                _local_4.addChild(_local_5);
                container.addChild(_local_4);
                _local_3++;
            };
        }

        private function _ExtractCardMovePanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getResUrl(2080130101002));
            }, function (_arg_1:Object):void
            {
                bg1.source = _arg_1;
            }, "bg1.source");
            result[0] = binding;
            return (result);
        }

        private function toSelect(e:MouseEvent):void
        {
            var index:int;
            var str:String;
            var s:Sprite = (e.currentTarget as Sprite);
            index = imgs.indexOf(s);
            var view:Object = _core.view.getUI(ViewManager.PANEL_EXTRACT_CARD_ACTIVITY);
            if (!view)
            {
                return;
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("extractCardActivityExtract", null, index);
                };
            };
            if (view.alertCheck.selected)
            {
                _core.remote.call("extractCardActivityExtract", null, index);
            }
            else
            {
                str = Language.EXTRACT_CARD_PANEL_U[6];
                if (view.checkFree())
                {
                    str = Language.EXTRACT_CARD_PANEL_U[21];
                };
                Alert.show(str, "", (Alert.YES | Alert.NO), null, func);
            };
        }

        private function start(_arg_1:TimerEvent):void
        {
            if (turn_step == 1)
            {
                turnS.scaleX = (turnS.scaleX - 0.2);
                if (turnS.scaleX <= 0)
                {
                    img1.scaleX = 0;
                    img1.visible = true;
                    bg1.visible = true;
                    txt1.visible = true;
                    turn_step = 2;
                };
            }
            else
            {
                if (turn_step == 2)
                {
                    img1.scaleX = (img1.scaleX + 0.2);
                    if (img1.scaleX >= 1)
                    {
                        img1.scaleX = 1;
                        turnS.scaleX = 1;
                        turn_step = 0;
                        turnS.mouseChildren = true;
                        turnS.mouseEnabled = true;
                        showEffect();
                    };
                };
            };
        }

        public function getRes():void
        {
            if (!load)
            {
                load = new Loader();
                load.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
                load.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, loadError);
                load.load(new URLRequest(ResManager.getResUrl(2080130101001)));
            }
            else
            {
                cut();
            };
        }

        private function showEffect():void
        {
            var _local_1:Object;
            if (!time)
            {
                time = new Timer(time_step);
                time.addEventListener(TimerEvent.TIMER, start);
            };
            if (pList.length == 0)
            {
                time.stop();
                return;
            };
            _local_1 = pList.shift();
            turnS = _local_1.s;
            turnS.scaleX = 1;
            img1.x = turnS.x;
            img1.y = turnS.y;
            img1.visible = false;
            txt1.text = _local_1.c;
            bg1.visible = false;
            txt1.visible = false;
            turnS.mouseChildren = false;
            turnS.mouseEnabled = false;
            turn_step = 1;
            if (!time.running)
            {
                time.start();
            };
        }

        public function close():void
        {
            turn_step = 0;
            if (turnS)
            {
                turnS.scaleX = 1;
                turnS.mouseChildren = true;
                turnS.mouseEnabled = true;
            };
            if (img1)
            {
                img1.visible = false;
            };
            bg1.visible = false;
            txt1.visible = false;
            pList.length = 0;
            if (((time) && (time.running)))
            {
                time.stop();
                time.reset();
            };
        }


    }
}//package com.qeedoo.ui.view.comp

