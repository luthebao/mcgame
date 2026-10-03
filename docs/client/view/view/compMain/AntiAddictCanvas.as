// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compMain.AntiAddictCanvas

package com.qeedoo.ui.view.compMain
{
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import com.qeedoo.game.ui.IMainUI;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Text;
    import mx.controls.Button;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import flash.utils.Timer;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.controls.Alert;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.Event;
    import flash.events.TimerEvent;
    import mx.events.FlexEvent;
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

    public class AntiAddictCanvas extends SimpleCanvas implements IMainUI, IBindingClient 
    {

        private static var _addict_url_key:* = "lezi.com";
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _AntiAddictCanvas_Text1:Text;
        private var firstTimeFlag:Boolean = true;
        private var _3034453btn1:Button;
        public var _AntiAddictCanvas_Label1:Label;
        private var min:int;
        private var _3560141time:String = "";
        private var hour:int;
        private var url:* = "http://www.lezi.com/index.php/user/authentic";
        private var seconds:int;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "height":62,
                    "width":180,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Label,
                        "id":"_AntiAddictCanvas_Label1",
                        "stylesFactory":function ():void
                        {
                            this.color = 13833740;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":3,
                                "y":10,
                                "width":101
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Text,
                        "id":"_AntiAddictCanvas_Text1",
                        "stylesFactory":function ():void
                        {
                            this.color = 13833740;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":9,
                                "y":32,
                                "width":80
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"btn1",
                        "events":{"click":"__btn1_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":9,
                                "styleName":"BtnChatHeadline"
                            });
                        }
                    })]
                });
            }
        });
        private var timer:Timer = new Timer(1000);
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function AntiAddictCanvas()
        {
            mx_internal::_document = this;
            this.cacheAsBitmap = true;
            this.height = 62;
            this.width = 180;
            this.addEventListener("show", ___AntiAddictCanvas_SimpleCanvas1_show);
            this.addEventListener("creationComplete", ___AntiAddictCanvas_SimpleCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            AntiAddictCanvas._watcherSetupUtil = _arg_1;
        }


        public function __btn1_click(_arg_1:MouseEvent):void
        {
            enterAddictInfo();
        }

        override public function initialize():void
        {
            var target:AntiAddictCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _AntiAddictCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compMain_AntiAddictCanvasWatcherSetupUtil");
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

        private function setAlert(_arg_1:String):void
        {
            if (visible == true)
            {
                _core.sysMsg(_arg_1);
                Alert.show(_arg_1);
            };
        }

        private function set time(_arg_1:String):void
        {
            var _local_2:Object = this._3560141time;
            if (_local_2 !== _arg_1)
            {
                this._3560141time = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "time", _local_2, _arg_1));
            };
        }

        private function _AntiAddictCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ANTIADDICTCANVAS_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AntiAddictCanvas_Label1.text = _arg_1;
            }, "_AntiAddictCanvas_Label1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ANTIADDICTCANVAS_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AntiAddictCanvas_Label1.toolTip = _arg_1;
            }, "_AntiAddictCanvas_Label1.toolTip");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = time;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AntiAddictCanvas_Text1.text = _arg_1;
            }, "_AntiAddictCanvas_Text1.text");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ANTIADDICTCANVAS_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn1.label = _arg_1;
            }, "btn1.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ANTIADDICTCANVAS_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn1.toolTip = _arg_1;
            }, "btn1.toolTip");
            result[4] = binding;
            return (result);
        }

        private function enterAddictInfo():void
        {
            navigateToURL(new URLRequest(url), "_blank");
        }

        public function init(_arg_1:Event):void
        {
            var _local_2:String = GamePredef.SERVER_ADD_CLASSIFY;
            if (((!(_local_2 == "underfined")) && (_local_2.indexOf(_addict_url_key) < 0)))
            {
            };
        }

        private function _AntiAddictCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.ANTIADDICTCANVAS_U[0];
            _local_1 = Language.ANTIADDICTCANVAS_U[6];
            _local_1 = time;
            _local_1 = Language.ANTIADDICTCANVAS_U[1];
            _local_1 = Language.ANTIADDICTCANVAS_U[3];
        }

        public function updateTime(_arg_1:TimerEvent):void
        {
            if (seconds > 0)
            {
                seconds--;
            }
            else
            {
                if (min > 0)
                {
                    min--;
                    seconds = 59;
                }
                else
                {
                    if (hour > 0)
                    {
                        hour--;
                        min = (seconds = 59);
                    }
                    else
                    {
                        hour = (min = (seconds = 0));
                        setAlert("每日游戏时间已到,您会被踢下线, 如果想免除时间限额,请到平台内填写正确的身份证信息");
                        _core.remote.setAddictFlagFromClient(_core.cid);
                        timer.stop();
                    };
                };
            };
            time = ((((hour + " : ") + min) + " : ") + seconds);
        }

        public function set btn1(_arg_1:Button):void
        {
            var _local_2:Object = this._3034453btn1;
            if (_local_2 !== _arg_1)
            {
                this._3034453btn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn1", _local_2, _arg_1));
            };
        }

        public function update():void
        {
        }

        [Bindable(event="propertyChange")]
        private function get time():String
        {
            return (this._3560141time);
        }

        public function ___AntiAddictCanvas_SimpleCanvas1_show(_arg_1:FlexEvent):void
        {
            onShow();
        }

        public function initView():void
        {
        }

        public function setOnLineTime(_arg_1:Number):void
        {
            if (_arg_1 < 0)
            {
                _arg_1 = 0;
            };
            hour = int(Math.floor(((_arg_1 / 1000) / 3600)));
            min = int(Math.floor((((_arg_1 - ((hour * 1000) * 3600)) / 1000) / 60)));
            seconds = int(Math.floor((((_arg_1 - ((hour * 1000) * 3600)) - ((min * 1000) * 60)) / 1000)));
            time = ((((hour + " : ") + min) + " : ") + seconds);
            if (!timer.running)
            {
                timer.start();
            };
        }

        public function stopTimer():void
        {
            if (timer.running)
            {
                timer.stop();
            };
        }

        [Bindable(event="propertyChange")]
        public function get btn1():Button
        {
            return (this._3034453btn1);
        }

        private function onShow():void
        {
            if (firstTimeFlag)
            {
                _core.sysMsg(Language.ANTIADDICTCANVAS_U[6]);
                timer.addEventListener(TimerEvent.TIMER, updateTime);
                firstTimeFlag = false;
            };
        }

        public function ___AntiAddictCanvas_SimpleCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init(_arg_1);
        }


    }
}//package com.qeedoo.ui.view.compMain

