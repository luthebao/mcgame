// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.MoneyItemPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.core.Repeater;
    import mx.containers.VBox;
    import mx.core.UIComponentDescriptor;
    import mx.controls.Button;
    import mx.containers.HBox;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.collections.ArrayCollection;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.MouseEvent;
    import mx.binding.RepeatableBinding;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.ui.utils.ToolKit;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
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

    public class MoneyItemPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var itemId:Number = 0;
        private var _114847tit:RoundedLabel;
        public var _MoneyItemPanel_RoundedLabel2:Array;
        private var _3646rp:Repeater;
        public var _MoneyItemPanel_VBox1:VBox;
        private var sid:int = -1;
        public var _MoneyItemPanel_BasicGlowButton1:Array;
        private var _1177491377itemSlot:Array;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"tit",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "-11";
                            this.fontSize = 13;
                            this.textAlign = "center";
                            this.fontWeight = "bold";
                            this.color = 16713993;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":10,
                                "width":108,
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{
                            "click":"___MoneyItemPanel_Button1_click",
                            "mouseDown":"___MoneyItemPanel_Button1_mouseDown"
                        },
                        "stylesFactory":function ():void
                        {
                            this.right = "10";
                            this.top = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"styleName":"BtnPanelClose"});
                        }
                    }), new UIComponentDescriptor({
                        "type":VBox,
                        "id":"_MoneyItemPanel_VBox1",
                        "stylesFactory":function ():void
                        {
                            this.left = "10";
                            this.right = "10";
                            this.bottom = "20";
                            this.top = "40";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"childDescriptors":[new UIComponentDescriptor({
                                    "type":Repeater,
                                    "id":"rp",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"childDescriptors":[new UIComponentDescriptor({
                                                "type":HBox,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"itemSlot",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"movable":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"_MoneyItemPanel_RoundedLabel2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 16599578;
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"_MoneyItemPanel_BasicGlowButton1",
                                                            "events":{"click":"___MoneyItemPanel_BasicGlowButton1_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalRed",
                                                                    "width":53.6,
                                                                    "height":19
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            })]});
                                    }
                                })]});
                        }
                    })]});
            }
        });
        private var _2116176462itemArr:ArrayCollection = new ArrayCollection();
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function MoneyItemPanel()
        {
            mx_internal::_document = this;
            this.styleName = "CanvasPopup";
            this.x = 550;
            this.y = 120;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MoneyItemPanel._watcherSetupUtil = _arg_1;
        }


        public function set rp(_arg_1:Repeater):void
        {
            var _local_2:Object = this._3646rp;
            if (_local_2 !== _arg_1)
            {
                this._3646rp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rp", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:MoneyItemPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MoneyItemPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_MoneyItemPanelWatcherSetupUtil");
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
        public function get tit():RoundedLabel
        {
            return (this._114847tit);
        }

        public function ___MoneyItemPanel_Button1_click(_arg_1:MouseEvent):void
        {
            hide();
        }

        private function _MoneyItemPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (itemArr);
            }, function (_arg_1:Object):void
            {
                rp.dataProvider = _arg_1;
            }, "rp.dataProvider");
            result[0] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):int
            {
                return (getType(rp.mx_internal::getItemAt(_arg_2[0])));
            }, function (_arg_1:int, _arg_2:Array):void
            {
                itemSlot[_arg_2[0]].type = _arg_1;
            }, "itemSlot.type");
            result[1] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):Number
            {
                return (getGiid(rp.mx_internal::getItemAt(_arg_2[0])));
            }, function (_arg_1:Number, _arg_2:Array):void
            {
                itemSlot[_arg_2[0]].giid = _arg_1;
            }, "itemSlot.giid");
            result[2] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):String
            {
                var _local_3:* = getText(rp.mx_internal::getItemAt(_arg_2[0]));
                var _local_4:* = ((_local_3 == undefined) ? null : String(_local_3));
                return (_local_4);
            }, function (_arg_1:String, _arg_2:Array):void
            {
                _MoneyItemPanel_RoundedLabel2[_arg_2[0]].text = _arg_1;
            }, "_MoneyItemPanel_RoundedLabel2.text");
            result[3] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):String
            {
                var _local_3:* = Language.MONEYITMEPANEL_U[0];
                var _local_4:* = ((_local_3 == undefined) ? null : String(_local_3));
                return (_local_4);
            }, function (_arg_1:String, _arg_2:Array):void
            {
                _MoneyItemPanel_BasicGlowButton1[_arg_2[0]].label = _arg_1;
            }, "_MoneyItemPanel_BasicGlowButton1.label");
            result[4] = binding;
            return (result);
        }

        private function getText(_arg_1:Object):String
        {
            return (_arg_1.tips);
        }

        private function set itemArr(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._2116176462itemArr;
            if (_local_2 !== _arg_1)
            {
                this._2116176462itemArr = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemArr", _local_2, _arg_1));
            };
        }

        public function set title(_arg_1:String):void
        {
            tit.text = _arg_1;
        }

        [Bindable(event="propertyChange")]
        public function get itemSlot():Array
        {
            return (this._1177491377itemSlot);
        }

        private function getType(_arg_1:Object):int
        {
            return (_arg_1.itemData.type);
        }

        private function useItem(_arg_1:MouseEvent):void
        {
            var _local_2:String = String(_arg_1.currentTarget);
            var _local_3:int = int(_local_2.substr(-2, 1));
            var _local_4:int = itemArr[_local_3].itemData.id;
            var _local_5:Object = new Object();
            var _local_6:* = "";
            itemId = _local_4;
            var _local_7:String = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_local_4].name;
            var _local_8:int;
            while (_local_8 <= GameData.d[GamePredef.TBL_SHOP_SLOT].length)
            {
                if (GameData.d[GamePredef.TBL_SHOP_SLOT][_local_8])
                {
                    if ((((GameData.d[GamePredef.TBL_SHOP_SLOT][_local_8].type == GamePredef.TBL_ITEM_TEMPLATE) && (GameData.d[GamePredef.TBL_SHOP_SLOT][_local_8].itemId == _local_4)) && (!(ToolKit.isEqual(GameData.d[GamePredef.TBL_SHOP_SLOT][_local_8].st, 5)))))
                    {
                        _local_5 = GameData.d[GamePredef.TBL_SHOP_SLOT][_local_8];
                        sid = _local_8;
                        break;
                    };
                };
                _local_8++;
            };
            _local_6 = Language.MONEYITEMPANEL_S[0];
            _local_6 = _local_6.replace("{shopData.gold}", _local_5.gold);
            _local_6 = _local_6.replace("{name}", _local_7);
            Alert.show(_local_6, null, (Alert.OK | Alert.CANCEL), this, onSele);
        }

        [Bindable(event="propertyChange")]
        public function get rp():Repeater
        {
            return (this._3646rp);
        }

        public function set tit(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._114847tit;
            if (_local_2 !== _arg_1)
            {
                this._114847tit = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tit", _local_2, _arg_1));
            };
        }

        public function set arr(_arg_1:ArrayCollection):void
        {
            itemArr = _arg_1;
            rp.dataProvider = _arg_1;
        }

        private function onSele(_arg_1:CloseEvent):void
        {
            var _local_2:Object;
            if (_arg_1.detail == Alert.OK)
            {
                _local_2 = new Object();
                _local_2.tid = itemId;
                _local_2.sid = sid;
                _core.remote.useItemGoldByShopId(_local_2);
            };
            itemId = 0;
            sid = -1;
        }

        [Bindable(event="propertyChange")]
        private function get itemArr():ArrayCollection
        {
            return (this._2116176462itemArr);
        }

        public function get title():String
        {
            return (tit.text);
        }

        public function set itemSlot(_arg_1:Array):void
        {
            var _local_2:Object = this._1177491377itemSlot;
            if (_local_2 !== _arg_1)
            {
                this._1177491377itemSlot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemSlot", _local_2, _arg_1));
            };
        }

        private function _MoneyItemPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = itemArr;
            _local_1 = getType(rp.currentItem);
            _local_1 = getGiid(rp.currentItem);
            _local_1 = getText(rp.currentItem);
            _local_1 = Language.MONEYITMEPANEL_U[0];
        }

        private function getGiid(_arg_1:Object):int
        {
            return (_arg_1.itemData.id);
        }

        public function ___MoneyItemPanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            useItem(_arg_1);
        }

        public function ___MoneyItemPanel_Button1_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }


    }
}//package com.qeedoo.ui.view.compDragable

