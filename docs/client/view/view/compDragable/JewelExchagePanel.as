// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.JewelExchagePanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.ItemSlotJewel;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.Alert;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import flash.filters.ColorMatrixFilter;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.MouseEvent;
    import mx.events.FlexEvent;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.Event;
    import com.qeedoo.ui.event.GameEvent;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import mx.managers.PopUpManager;
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

    public class JewelExchagePanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _847667717jewelExchageItem2:ItemSlotJewel;
        private var _100348226info0:Label;
        private var _1110417474label2:Label;
        private var _847667718jewelExchageItem1:ItemSlotJewel;
        private var _1110417472label4:Label;
        private var _3237038info:Label;
        private var _847667719jewelExchageItem0:ItemSlotJewel;
        private var _1322604301eTitle:BasicTitleCanvas;
        private var _847667715jewelExchageItem4:ItemSlotJewel;
        private var _1110417475label1:Label;
        private var _1110417473label3:Label;
        private var _847667716jewelExchageItem3:ItemSlotJewel;
        internal var _alert:Alert;
        private var _1640725936jewelExchageButtonOne:BasicGlowButton;
        private var _selectIndex:Number = 0;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":306,
                    "height":242,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"eTitle",
                        "events":{"creationComplete":"__eTitle_creationComplete"}
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":36,
                                "width":286,
                                "height":195,
                                "styleName":"txtArea",
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"jewelExchageButtonOne",
                                    "events":{"click":"__jewelExchageButtonOne_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnStdRed",
                                            "x":118,
                                            "width":50,
                                            "y":168
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"info0",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFF0000;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":57,
                                            "y":5,
                                            "width":0x0101,
                                            "height":37
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlotJewel,
                        "id":"jewelExchageItem0",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":84,
                                "movable":true,
                                "showStackNum":true,
                                "x":134
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlotJewel,
                        "id":"jewelExchageItem1",
                        "events":{"click":"__jewelExchageItem1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":142,
                                "movable":false,
                                "showStackNum":true,
                                "x":49
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"label1",
                        "events":{"click":"__label1_click"},
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 30;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":47,
                                "y":146,
                                "height":28,
                                "width":38
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlotJewel,
                        "id":"jewelExchageItem2",
                        "events":{"click":"__jewelExchageItem2_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":142,
                                "movable":false,
                                "showStackNum":true,
                                "x":221
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"label2",
                        "events":{"click":"__label2_click"},
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 30;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":219,
                                "y":146,
                                "height":28,
                                "width":38
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlotJewel,
                        "id":"jewelExchageItem3",
                        "events":{"click":"__jewelExchageItem3_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":142,
                                "movable":false,
                                "showStackNum":true,
                                "x":107
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"label3",
                        "events":{"click":"__label3_click"},
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 30;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":105,
                                "y":146,
                                "height":28
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlotJewel,
                        "id":"jewelExchageItem4",
                        "events":{"click":"__jewelExchageItem4_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":142,
                                "movable":false,
                                "showStackNum":true,
                                "x":160
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"label4",
                        "events":{"click":"__label4_click"},
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 30;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":158,
                                "y":146,
                                "height":28
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"info",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":49,
                                "y":182,
                                "width":0x0101
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var jewel_color1:Object = [55, 56, 57, 58, 59];
        private var jewel_color2:Object = [60, 61, 62, 63, 64];
        private var _matrix:Array = [new ColorMatrixFilter([0.3086, 0.6094, 0.082, 0, 0, 0.3086, 0.6094, 0.082, 0, 0, 0.3086, 0.6094, 0.082, 0, 0, 0, 0, 0, 1, 0])];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function JewelExchagePanel()
        {
            mx_internal::_document = this;
            this.width = 306;
            this.height = 242;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            JewelExchagePanel._watcherSetupUtil = _arg_1;
        }


        public function set jewelExchageItem0(_arg_1:ItemSlotJewel):void
        {
            var _local_2:Object = this._847667719jewelExchageItem0;
            if (_local_2 !== _arg_1)
            {
                this._847667719jewelExchageItem0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "jewelExchageItem0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get jewelExchageItem2():ItemSlotJewel
        {
            return (this._847667717jewelExchageItem2);
        }

        public function set jewelExchageItem1(_arg_1:ItemSlotJewel):void
        {
            var _local_2:Object = this._847667718jewelExchageItem1;
            if (_local_2 !== _arg_1)
            {
                this._847667718jewelExchageItem1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "jewelExchageItem1", _local_2, _arg_1));
            };
        }

        public function set info0(_arg_1:Label):void
        {
            var _local_2:Object = this._100348226info0;
            if (_local_2 !== _arg_1)
            {
                this._100348226info0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "info0", _local_2, _arg_1));
            };
        }

        private function selectChageJewel(_arg_1:Number):void
        {
            var _local_2:Number;
            if (((jewelExchageItem0.slotData) && (this[("jewelExchageItem" + _arg_1)].giid)))
            {
                _selectIndex = 0;
                _local_2 = 1;
                while (_local_2 <= 4)
                {
                    if (_local_2 == _arg_1)
                    {
                        this[("label" + _local_2)].htmlText = Language.JEWEL_EXCHANGE_PANEL[1];
                        _selectIndex = _arg_1;
                    }
                    else
                    {
                        this[("label" + _local_2)].htmlText = "";
                    };
                    _local_2++;
                };
            };
        }

        public function set label4(_arg_1:Label):void
        {
            var _local_2:Object = this._1110417472label4;
            if (_local_2 !== _arg_1)
            {
                this._1110417472label4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label4", _local_2, _arg_1));
            };
        }

        public function set eTitle(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._1322604301eTitle;
            if (_local_2 !== _arg_1)
            {
                this._1322604301eTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "eTitle", _local_2, _arg_1));
            };
        }

        public function set info(_arg_1:Label):void
        {
            var _local_2:Object = this._3237038info;
            if (_local_2 !== _arg_1)
            {
                this._3237038info = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "info", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get jewelExchageItem3():ItemSlotJewel
        {
            return (this._847667716jewelExchageItem3);
        }

        [Bindable(event="propertyChange")]
        public function get jewelExchageItem4():ItemSlotJewel
        {
            return (this._847667715jewelExchageItem4);
        }

        public function set label3(_arg_1:Label):void
        {
            var _local_2:Object = this._1110417473label3;
            if (_local_2 !== _arg_1)
            {
                this._1110417473label3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label3", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:JewelExchagePanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _JewelExchagePanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_JewelExchagePanelWatcherSetupUtil");
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
        public function get jewelExchageItem1():ItemSlotJewel
        {
            return (this._847667718jewelExchageItem1);
        }

        [Bindable(event="propertyChange")]
        public function get jewelExchageItem0():ItemSlotJewel
        {
            return (this._847667719jewelExchageItem0);
        }

        public function set jewelExchageItem4(_arg_1:ItemSlotJewel):void
        {
            var _local_2:Object = this._847667715jewelExchageItem4;
            if (_local_2 !== _arg_1)
            {
                this._847667715jewelExchageItem4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "jewelExchageItem4", _local_2, _arg_1));
            };
        }

        public function set label2(_arg_1:Label):void
        {
            var _local_2:Object = this._1110417474label2;
            if (_local_2 !== _arg_1)
            {
                this._1110417474label2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label2", _local_2, _arg_1));
            };
        }

        public function set jewelExchageButtonOne(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1640725936jewelExchageButtonOne;
            if (_local_2 !== _arg_1)
            {
                this._1640725936jewelExchageButtonOne = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "jewelExchageButtonOne", _local_2, _arg_1));
            };
        }

        public function __jewelExchageItem1_click(_arg_1:MouseEvent):void
        {
            selectChageJewel(1);
        }

        public function __eTitle_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function __jewelExchageItem3_click(_arg_1:MouseEvent):void
        {
            selectChageJewel(3);
        }

        private function jewelExchageItemChange(_arg_1:Event):void
        {
            var _local_3:Object;
            var _local_4:Number;
            var _local_5:Number;
            var _local_6:*;
            jewelExchageButtonOne.enabled = true;
            info.htmlText = Language.JEWEL_EXCHANGE_PANEL[5];
            jewelExchageItem1.clean();
            jewelExchageItem2.clean();
            jewelExchageItem3.clean();
            jewelExchageItem4.clean();
            _selectIndex = 0;
            var _local_2:Object = jewelExchageItem0.slotData;
            if (_local_2)
            {
                if (jewelExchageItem0.tempBagFlag)
                {
                    _local_3 = _core.getTemplateData(_local_2.ti, _local_2.ii);
                }
                else
                {
                    _local_3 = _core.getTemplateData(_local_2.type, _local_2.itemId);
                };
                if (((_local_3) && (ToolKit.isEqual(_local_3.type, GamePredef.ITEM_TYPE_JEWEL))))
                {
                    _local_4 = 0;
                    if (_local_3.id)
                    {
                        for (_local_6 in jewel_color1)
                        {
                            if (Number(jewel_color1[_local_6]) == _local_3.id)
                            {
                                _local_4 = 1;
                                break;
                            };
                        };
                        for (_local_6 in jewel_color2)
                        {
                            if (Number(jewel_color2[_local_6]) == _local_3.id)
                            {
                                _local_4 = 2;
                                break;
                            };
                        };
                        if (_local_4 == 0)
                        {
                            jewelExchageItem0.clean();
                            info.htmlText = "";
                            return;
                        };
                    };
                    _local_5 = 1;
                    _local_6 = 1;
                    while (_local_6 <= 5)
                    {
                        if (!ToolKit.isEqual(this[("jewel_color" + _local_4)][Number((Number(_local_6) - 1))], _local_3.id))
                        {
                            this[("jewelExchageItem" + _local_5)].type = GamePredef.TBL_ITEM_TEMPLATE;
                            this[("jewelExchageItem" + _local_5)].giid = this[("jewel_color" + _local_4)][Number((Number(_local_6) - 1))];
                            this[("jewelExchageItem" + _local_5)].stackNum = jewelExchageItem0.stackNum;
                            _local_5++;
                        };
                        _local_6++;
                    };
                };
            };
        }

        private function init():void
        {
            jewelExchageItem0.addEventListener(GameEvent.SLOT_NUM_CHANGE, jewelExchageItemChange);
        }

        public function __label4_click(_arg_1:MouseEvent):void
        {
            selectChageJewel(4);
        }

        private function _JewelExchagePanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.JEWEL_EXCHANGE_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                eTitle.text = _arg_1;
            }, "eTitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.JEWEL_EXCHANGE_PANEL[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                jewelExchageButtonOne.label = _arg_1;
            }, "jewelExchageButtonOne.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.JEWEL_EXCHANGE_PANEL[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                info0.text = _arg_1;
            }, "info0.text");
            result[2] = binding;
            return (result);
        }

        private function _JewelExchagePanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.JEWEL_EXCHANGE_PANEL[0];
            _local_1 = Language.JEWEL_EXCHANGE_PANEL[2];
            _local_1 = Language.JEWEL_EXCHANGE_PANEL[7];
        }

        public function __label2_click(_arg_1:MouseEvent):void
        {
            selectChageJewel(2);
        }

        [Bindable(event="propertyChange")]
        public function get label2():Label
        {
            return (this._1110417474label2);
        }

        [Bindable(event="propertyChange")]
        public function get info():Label
        {
            return (this._3237038info);
        }

        [Bindable(event="propertyChange")]
        public function get label4():Label
        {
            return (this._1110417472label4);
        }

        [Bindable(event="propertyChange")]
        public function get info0():Label
        {
            return (this._100348226info0);
        }

        public function set label1(_arg_1:Label):void
        {
            var _local_2:Object = this._1110417475label1;
            if (_local_2 !== _arg_1)
            {
                this._1110417475label1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get jewelExchageButtonOne():BasicGlowButton
        {
            return (this._1640725936jewelExchageButtonOne);
        }

        [Bindable(event="propertyChange")]
        public function get label1():Label
        {
            return (this._1110417475label1);
        }

        [Bindable(event="propertyChange")]
        public function get label3():Label
        {
            return (this._1110417473label3);
        }

        private function jewelExchage():void
        {
            var sid:Number;
            var giid:Number;
            var tempFlag:Boolean;
            var handler:Function;
            var slot:Object;
            var itemTmp:Object;
            var exchageItemTmp:Object;
            var str:String;
            if (((((jewelExchageItem0.slotData) && (_selectIndex)) && (ToolKit.isBigThan(_selectIndex, 0))) && (ToolKit.isBigThan(jewelExchageItem0.slotData.stackNum, 0))))
            {
                sid = jewelExchageItem0.slotData.id;
                giid = this[("jewelExchageItem" + _selectIndex)].giid;
                tempFlag = jewelExchageItem0.tempBagFlag;
                handler = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        info.htmlText = "";
                        jewelExchageButtonOne.enabled = false;
                        _core.remote.call("pmJewelExchage", new Responder(onJewelExchage), sid, giid, tempFlag);
                    };
                };
                if (_alert)
                {
                    PopUpManager.removePopUp(_alert);
                    _alert = null;
                };
                slot = jewelExchageItem0.slotData;
                if (slot)
                {
                    if (jewelExchageItem0.tempBagFlag)
                    {
                        itemTmp = _core.getTemplateData(slot.ti, slot.ii);
                    }
                    else
                    {
                        itemTmp = _core.getTemplateData(slot.type, slot.itemId);
                    };
                    exchageItemTmp = _core.getTemplateData(29, this[("jewelExchageItem" + _selectIndex)].giid);
                    str = Language.JEWEL_EXCHANGE_PANEL[6].toString().replace("{num}", jewelExchageItem0.slotData.stackNum).replace("{name}", itemTmp.name).replace("{name1}", exchageItemTmp.name);
                    _alert = Alert.show(str, null, (Alert.YES | Alert.NO), null, handler);
                };
            }
            else
            {
                if (((jewelExchageItem0.slotData) && ((!(_selectIndex)) || (ToolKit.isEqual(_selectIndex, 0)))))
                {
                    _core.sysMidNote(Language.JEWEL_EXCHANGE_PANEL[5]);
                };
            };
        }

        public function __label1_click(_arg_1:MouseEvent):void
        {
            selectChageJewel(1);
        }

        public function __label3_click(_arg_1:MouseEvent):void
        {
            selectChageJewel(3);
        }

        public function __jewelExchageItem2_click(_arg_1:MouseEvent):void
        {
            selectChageJewel(2);
        }

        public function __jewelExchageItem4_click(_arg_1:MouseEvent):void
        {
            selectChageJewel(4);
        }

        [Bindable(event="propertyChange")]
        public function get eTitle():BasicTitleCanvas
        {
            return (this._1322604301eTitle);
        }

        public function set jewelExchageItem3(_arg_1:ItemSlotJewel):void
        {
            var _local_2:Object = this._847667716jewelExchageItem3;
            if (_local_2 !== _arg_1)
            {
                this._847667716jewelExchageItem3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "jewelExchageItem3", _local_2, _arg_1));
            };
        }

        public function __jewelExchageButtonOne_click(_arg_1:MouseEvent):void
        {
            jewelExchage();
        }

        private function onJewelExchage(_arg_1:Object):void
        {
            jewelExchageButtonOne.enabled = true;
            jewelExchageItem0.clean();
            jewelExchageItem1.clean();
            jewelExchageItem2.clean();
            jewelExchageItem3.clean();
            jewelExchageItem4.clean();
            _selectIndex = 0;
            var _local_2:Number = 1;
            while (_local_2 <= 4)
            {
                this[("label" + _local_2)].htmlText = "";
                _local_2++;
            };
            var _local_3:* = "";
            if (_arg_1)
            {
                if (_arg_1.flag)
                {
                    if (_arg_1.finalNum)
                    {
                        _local_3 = Language.JEWEL_EXCHANGE_PANEL[3].toString().replace("{num}", _arg_1.finalNum).replace("{name}", _arg_1.finalNme);
                        _core.sysMidNote(_local_3);
                        info.htmlText = (("<font color='#FF0000'>" + _local_3) + "</font>");
                    }
                    else
                    {
                        _core.sysMidNote(Language.JEWEL_EXCHANGE_PANEL[4]);
                    };
                }
                else
                {
                    _core.sysMidNote(Language.JEWEL_EXCHANGE_PANEL[4]);
                };
            };
        }

        public function set jewelExchageItem2(_arg_1:ItemSlotJewel):void
        {
            var _local_2:Object = this._847667717jewelExchageItem2;
            if (_local_2 !== _arg_1)
            {
                this._847667717jewelExchageItem2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "jewelExchageItem2", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

