// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.ConsumeNoticePanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.containers.VBox;
    import com.qeedoo.ui.view.comp.IntroText;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.net.Responder;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.view.comp.ConsumeNoticeItem;
    import mx.controls.Alert;
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

    public class ConsumeNoticePanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _ConsumeNoticePanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _3575610type:String;
        private var _1148655051awrdText:RoundedLabel;
        private var _3023933bind:String;
        private var _93223517award:String;
        private var _109757538start:String;
        private var _351979078itemListBox:VBox;
        private var _2077368934timeText:RoundedLabel;
        private var _100571end:String;
        private var _939489034bindText:RoundedLabel;
        private var _100361836intro:IntroText;
        private var _110371416title:RoundedLabel;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":840,
                    "height":560,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_ConsumeNoticePanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"title",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.fontSize = 25;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"y":39});
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"timeText",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 15;
                            this.left = "20";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"y":77});
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"bindText",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 15;
                            this.left = "20";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"y":100});
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"awrdText",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 15;
                            this.left = "20";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"y":121});
                        }
                    }), new UIComponentDescriptor({
                        "type":VBox,
                        "id":"itemListBox",
                        "stylesFactory":function ():void
                        {
                            this.left = "20";
                            this.right = "20";
                            this.verticalGap = 1;
                            this.paddingLeft = 10;
                            this.paddingTop = 10;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"RoundedGradientBorder",
                                "y":146,
                                "height":301
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":IntroText,
                        "id":"intro",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":455,
                                "width":534,
                                "height":83
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function ConsumeNoticePanel()
        {
            mx_internal::_document = this;
            this.width = 840;
            this.height = 560;
            this.styleName = "StandardContent";
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ConsumeNoticePanel._watcherSetupUtil = _arg_1;
        }


        public function set bind(_arg_1:String):void
        {
            var _local_2:Object = this._3023933bind;
            if (_local_2 !== _arg_1)
            {
                this._3023933bind = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bind", _local_2, _arg_1));
            };
        }

        public function set itemListBox(_arg_1:VBox):void
        {
            var _local_2:Object = this._351979078itemListBox;
            if (_local_2 !== _arg_1)
            {
                this._351979078itemListBox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemListBox", _local_2, _arg_1));
            };
        }

        public function showPanel():void
        {
            this.show();
            if (!initialized)
            {
                callLater(showPanel);
                return;
            };
            _core.remote.call("getConsumeNoticeData", new Responder(updateConsumNoticePanel), null);
        }

        [Bindable(event="propertyChange")]
        public function get bindText():RoundedLabel
        {
            return (this._939489034bindText);
        }

        private function sortItemList(obj:Object):Array
        {
            var i:* = undefined;
            var itemSort:Function;
            var hasData:* = undefined;
            var j:* = undefined;
            var sortList:* = [];
            for (i in obj)
            {
                if (obj[i].r)
                {
                    hasData = false;
                    for (j in sortList)
                    {
                        if (sortList[j] == obj[i].r)
                        {
                            hasData = true;
                        };
                    };
                    if (!hasData)
                    {
                        sortList.push(obj[i].r);
                    };
                };
            };
            itemSort = function (_arg_1:*, _arg_2:*):Number
            {
                var _local_3:* = (_arg_1 as String).split("|")[0];
                var _local_4:* = (_arg_2 as String).split("|")[0];
                return (_local_3 - _local_4);
            };
            sortList.sort(itemSort);
            return (sortList);
        }

        private function init():void
        {
        }

        override public function initialize():void
        {
            var target:ConsumeNoticePanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ConsumeNoticePanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_ConsumeNoticePanelWatcherSetupUtil");
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
        public function get timeText():RoundedLabel
        {
            return (this._2077368934timeText);
        }

        private function getYMDHMS(_arg_1:Number):String
        {
            var _local_2:Date = new Date(Number(_arg_1));
            return (((((((((_local_2.fullYear + "年") + ToolKit.add(_local_2.month, 1)) + "月") + _local_2.date) + "日 ") + _local_2.hours) + "点") + _local_2.minutes) + "分");
        }

        public function set type(_arg_1:String):void
        {
            var _local_2:Object = this._3575610type;
            if (_local_2 !== _arg_1)
            {
                this._3575610type = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "type", _local_2, _arg_1));
            };
        }

        public function set bindText(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._939489034bindText;
            if (_local_2 !== _arg_1)
            {
                this._939489034bindText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bindText", _local_2, _arg_1));
            };
        }

        private function _ConsumeNoticePanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.CONSUME_NOTICE_PANEL[0];
            _local_1 = (type + "活动奖励预览");
            _local_1 = ((("活动时间:" + start) + " 至  ") + end);
            _local_1 = (((("活动规则:活动时间内" + type) + "充值达到相应金额即可获得以下奖励（所有奖励为") + bind) + "物品）");
            _local_1 = (("活动发放： 奖励将于" + award) + "前发放");
        }

        private function getType(_arg_1:int):String
        {
            if (_arg_1 == 1)
            {
                return ("累计充值");
            };
            if (_arg_1 == 2)
            {
                return ("单笔充值");
            };
            return ("未定义");
        }

        private function getBind(_arg_1:int):String
        {
            if (_arg_1 == 1)
            {
                return ("绑定");
            };
            if (_arg_1 == 2)
            {
                return ("未绑定");
            };
            return ("未定义");
        }

        public function set timeText(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._2077368934timeText;
            if (_local_2 !== _arg_1)
            {
                this._2077368934timeText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "timeText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get awrdText():RoundedLabel
        {
            return (this._1148655051awrdText);
        }

        public function set end(_arg_1:String):void
        {
            var _local_2:Object = this._100571end;
            if (_local_2 !== _arg_1)
            {
                this._100571end = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "end", _local_2, _arg_1));
            };
        }

        public function set title(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._110371416title;
            if (_local_2 !== _arg_1)
            {
                this._110371416title = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get bind():String
        {
            return (this._3023933bind);
        }

        [Bindable(event="propertyChange")]
        public function get itemListBox():VBox
        {
            return (this._351979078itemListBox);
        }

        public function set start(_arg_1:String):void
        {
            var _local_2:Object = this._109757538start;
            if (_local_2 !== _arg_1)
            {
                this._109757538start = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "start", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get type():String
        {
            return (this._3575610type);
        }

        public function set award(_arg_1:String):void
        {
            var _local_2:Object = this._93223517award;
            if (_local_2 !== _arg_1)
            {
                this._93223517award = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "award", _local_2, _arg_1));
            };
        }

        public function set intro(_arg_1:IntroText):void
        {
            var _local_2:Object = this._100361836intro;
            if (_local_2 !== _arg_1)
            {
                this._100361836intro = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "intro", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get end():String
        {
            return (this._100571end);
        }

        [Bindable(event="propertyChange")]
        public function get award():String
        {
            return (this._93223517award);
        }

        [Bindable(event="propertyChange")]
        public function get title():RoundedLabel
        {
            return (this._110371416title);
        }

        [Bindable(event="propertyChange")]
        public function get start():String
        {
            return (this._109757538start);
        }

        public function set awrdText(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1148655051awrdText;
            if (_local_2 !== _arg_1)
            {
                this._1148655051awrdText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awrdText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get intro():IntroText
        {
            return (this._100361836intro);
        }

        public function updateConsumNoticePanel(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            var _local_8:ConsumeNoticeItem;
            if (((_arg_1) || (!(ToolKit.isEmptyObject(_arg_1)))))
            {
                type = getType(int(_arg_1.t));
                start = getYMDHMS(Number(_arg_1.start));
                end = getYMDHMS(Number(_arg_1.end));
                bind = getBind(int(_arg_1.t));
                intro.htmlText = _arg_1.info;
                award = getYMDHMS(Number(_arg_1.at));
                title.htmlText = (("<font color='#FF0000'>" + type) + "</font>活动奖励预览");
                timeText.htmlText = (((("活动时间: <font color='#FF0000'>" + start) + "</font> 至 <font color='#FF0000'>") + end) + "</font>");
                bindText.htmlText = (((("活动规则: 活动时间内<font color='#FF0000'>" + type) + "</font>达到相应金额即可获得以下奖励（所有奖励为<font color='#FF0000'>") + bind) + "</font>物品）");
                awrdText.htmlText = (("活动发放: 奖励将于<font color='#FF0000'>" + award) + "</font>前发放");
                if (_arg_1.it)
                {
                    _local_2 = sortItemList(_arg_1.it);
                    _local_3 = [];
                    itemListBox.removeAllChildren();
                    _local_4 = _arg_1.it;
                    for (_local_5 in _local_4)
                    {
                        if (_local_4[_local_5].r)
                        {
                            for (_local_7 in _local_2)
                            {
                                if (_local_2[_local_7] == _local_4[_local_5].r)
                                {
                                    if (!_local_3[_local_7])
                                    {
                                        _local_3[_local_7] = [];
                                    };
                                    _local_3[_local_7].push(_local_4[_local_5]);
                                };
                            };
                        };
                    };
                    for (_local_6 in _local_3)
                    {
                        if (_local_3[_local_6])
                        {
                            _local_8 = new ConsumeNoticeItem();
                            itemListBox.addChild(_local_8);
                            _local_8.setData(_local_3[_local_6]);
                            _local_8.type = type;
                        };
                    };
                };
            }
            else
            {
                Alert.show("未能成功获取数据");
            };
        }

        private function _ConsumeNoticePanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CONSUME_NOTICE_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ConsumeNoticePanel_BasicTitleCanvas1.text = _arg_1;
            }, "_ConsumeNoticePanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (type + "活动奖励预览");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                title.htmlText = _arg_1;
            }, "title.htmlText");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((("活动时间:" + start) + " 至  ") + end);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                timeText.htmlText = _arg_1;
            }, "timeText.htmlText");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (((("活动规则:活动时间内" + type) + "充值达到相应金额即可获得以下奖励（所有奖励为") + bind) + "物品）");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bindText.htmlText = _arg_1;
            }, "bindText.htmlText");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (("活动发放： 奖励将于" + award) + "前发放");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                awrdText.htmlText = _arg_1;
            }, "awrdText.htmlText");
            result[4] = binding;
            return (result);
        }


    }
}//package com.qeedoo.ui.view.compDragable

