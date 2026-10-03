// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.ShowTimeCard

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.event.GameDataEvent;
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

    public class ShowTimeCard extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _ShowTimeCard_BasicDelayButton1:BasicDelayButton;
        private var _3002509area:RoundedLabel;
        private var _1872065246playerImg:Image;
        private var _2096610540playername:RoundedLabel;
        private var _cardIndex:int;
        private var _639303740voteNum:RoundedLabel;
        private var _name:String;
        private var _3492908rank:RoundedLabel;
        private var _cardData:Object;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":172.5,
                    "height":226,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"playerImg",
                        "stylesFactory":function ():void
                        {
                            this.horizontalAlign = "center";
                            this.horizontalCenter = "0";
                            this.top = "3";
                            this.bottom = "3";
                            this.left = "3";
                            this.right = "3";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"scaleContent":true});
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.backgroundColor = 0;
                            this.backgroundAlpha = 0.41;
                            this.bottom = "2";
                            this.left = "2";
                            this.right = "2";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "height":69,
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"area",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "text":"区服信息",
                                            "x":10,
                                            "y":7,
                                            "width":115
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"playername",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "text":"角色名",
                                            "x":10,
                                            "y":25,
                                            "width":150
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"rank",
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "10";
                                        this.color = 0xFF0000;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "text":"排名",
                                            "y":7
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"voteNum",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 15;
                                        this.color = 0xFF0000;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":44,
                                            "width":110
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicDelayButton,
                                    "id":"_ShowTimeCard_BasicDelayButton1",
                                    "events":{"click":"___ShowTimeCard_BasicDelayButton1_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "5";
                                        this.bottom = "3";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "clickDelay":100,
                                            "styleName":"BtnStdGreen"
                                        });
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function ShowTimeCard()
        {
            mx_internal::_document = this;
            this.width = 172.5;
            this.height = 226;
            this.styleName = "CanvasBorder";
            this.verticalScrollPolicy = "off";
            this.horizontalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ShowTimeCard._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get rank():RoundedLabel
        {
            return (this._3492908rank);
        }

        [Bindable(event="propertyChange")]
        public function get voteNum():RoundedLabel
        {
            return (this._639303740voteNum);
        }

        override public function initialize():void
        {
            var target:ShowTimeCard;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ShowTimeCard_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_ShowTimeCardWatcherSetupUtil");
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

        [Bindable(event="propertyChange")]
        public function get playername():RoundedLabel
        {
            return (this._2096610540playername);
        }

        public function get cardData():Object
        {
            return (_cardData);
        }

        public function set playername(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._2096610540playername;
            if (_local_2 !== _arg_1)
            {
                this._2096610540playername = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "playername", _local_2, _arg_1));
            };
        }

        public function set area(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._3002509area;
            if (_local_2 !== _arg_1)
            {
                this._3002509area = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "area", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get area():RoundedLabel
        {
            return (this._3002509area);
        }

        public function set playerImg(_arg_1:Image):void
        {
            var _local_2:Object = this._1872065246playerImg;
            if (_local_2 !== _arg_1)
            {
                this._1872065246playerImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "playerImg", _local_2, _arg_1));
            };
        }

        public function set rank(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._3492908rank;
            if (_local_2 !== _arg_1)
            {
                this._3492908rank = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rank", _local_2, _arg_1));
            };
        }

        public function ___ShowTimeCard_BasicDelayButton1_click(_arg_1:MouseEvent):void
        {
            vote();
        }

        private function _ShowTimeCard_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SHOW_TIME_PANEL[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                voteNum.text = _arg_1;
            }, "voteNum.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SHOW_TIME_PANEL[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ShowTimeCard_BasicDelayButton1.label = _arg_1;
            }, "_ShowTimeCard_BasicDelayButton1.label");
            result[1] = binding;
            return (result);
        }

        private function vote():void
        {
            var _local_1:GameDataEvent = new GameDataEvent("showTimeCardClick", true);
            _local_1.data = _cardData;
            this.dispatchEvent(_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get playerImg():Image
        {
            return (this._1872065246playerImg);
        }

        public function set cardData(_arg_1:Object):void
        {
            _cardData = _arg_1;
            area.text = _arg_1.a;
            playername.text = _arg_1.n;
            rank.text = ("排名: " + _arg_1.r);
            voteNum.text = (_arg_1.v + " 票");
            playerImg.source = ("../img/" + _arg_1.i);
        }

        public function set voteNum(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._639303740voteNum;
            if (_local_2 !== _arg_1)
            {
                this._639303740voteNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "voteNum", _local_2, _arg_1));
            };
        }

        private function _ShowTimeCard_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.SHOW_TIME_PANEL[2];
            _local_1 = Language.SHOW_TIME_PANEL[1];
        }


    }
}//package com.qeedoo.ui.view.comp

