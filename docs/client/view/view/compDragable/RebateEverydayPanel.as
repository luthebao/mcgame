// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.RebateEverydayPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import mx.controls.Alert;
    import mx.controls.Button;
    import mx.controls.Image;
    import mx.controls.Label;
    import mx.containers.VBox;
    import mx.controls.LinkButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.containers.Canvas;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.view.comp.RebateEverydayOneCanvas;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.utils.TimeUtil;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import mx.events.FlexEvent;
    import mx.managers.PopUpManager;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.view.ViewManager;
    import flash.net.Responder;
    import com.qeedoo.ui.resource.ResManager;
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

    public class RebateEverydayPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _100525953item4:ItemSlot;
        private var rebateEverydayExp:Number = 0;
        private var _helpAlert:Alert;
        private var _3034453btn1:Button;
        private var _100525950item1:ItemSlot;
        public var _RebateEverydayPanel_Image1:Image;
        private var _1188525589imagetexiao:Image;
        private var _100525955item6:ItemSlot;
        private var _1606289880endtime:Label;
        private var _alert:Alert;
        private var _100525952item3:ItemSlot;
        private var _3756vb:VBox;
        private var _97884btn:Button;
        public var _RebateEverydayPanel_LinkButton1:LinkButton;
        private var _100525954item5:ItemSlot;
        private var _106845584point:Label;
        private var _100525951item2:ItemSlot;
        private var _2128341457starttime:Label;
        private var _100525956item7:ItemSlot;
        public var _RebateEverydayPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _886301036rightCanvas:Canvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":670,
                    "height":450,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_RebateEverydayPanel_BasicTitleCanvas1",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 14;
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"RoundedGradientBorder",
                                "label":"Hornor",
                                "y":35,
                                "width":650,
                                "height":400,
                                "x":10,
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_RebateEverydayPanel_Image1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0,
                                            "y":0,
                                            "percentWidth":100,
                                            "percentHeight":100
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundAlpha = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0,
                                            "y":10,
                                            "width":220,
                                            "height":380,
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":VBox,
                                                "id":"vb",
                                                "stylesFactory":function ():void
                                                {
                                                    this.backgroundAlpha = 0;
                                                    this.top = "0";
                                                    this.verticalGap = 10;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "horizontalScrollPolicy":"off",
                                                        "x":0
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btn1",
                                    "events":{"click":"__btn1_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"rebateEverydayLQ",
                                            "x":380,
                                            "y":330,
                                            "width":115,
                                            "height":47,
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"imagetexiao",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":312,
                                            "y":304,
                                            "width":250,
                                            "height":100
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btn",
                                    "events":{"click":"__btn_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"rebateEverydayDH",
                                            "x":336,
                                            "y":330,
                                            "width":202,
                                            "height":47
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"rightCanvas",
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundAlpha = 1;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CanvasBorder",
                                            "x":225,
                                            "y":222,
                                            "width":420,
                                            "height":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"item1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":15,
                                                        "y":31,
                                                        "movable":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"item2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":75,
                                                        "y":31,
                                                        "movable":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"item3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":135,
                                                        "y":31,
                                                        "movable":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"item4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":195,
                                                        "y":31,
                                                        "movable":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"item5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0xFF,
                                                        "y":31,
                                                        "movable":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"item6",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":315,
                                                        "y":31,
                                                        "movable":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"item7",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":375,
                                                        "y":31,
                                                        "movable":false
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"point",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                        this.fontSize = 12;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":336,
                                            "y":380,
                                            "width":202
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":LinkButton,
                                    "id":"_RebateEverydayPanel_LinkButton1",
                                    "events":{"click":"___RebateEverydayPanel_LinkButton1_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "right";
                                        this.color = 16775802;
                                        this.textDecoration = "underline";
                                        this.fontSize = 12;
                                        this.fontWeight = "normal";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":75,
                                            "height":20,
                                            "x":560,
                                            "y":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"endtime",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.textAlign = "right";
                                        this.color = 16775802;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":399,
                                            "y":200,
                                            "width":241
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"starttime",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.textAlign = "right";
                                        this.color = 16775802;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":399,
                                            "y":187,
                                            "width":241
                                        });
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        private var rebateEverydayConf:Object = {};
        private var rebateEverydayData:Object = {};
        private var RebateEverydayCanvasObj:Object = {};
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function RebateEverydayPanel()
        {
            mx_internal::_document = this;
            this.width = 670;
            this.height = 450;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
            this.x = 103;
            this.y = 102;
            this.addEventListener("creationComplete", ___RebateEverydayPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            RebateEverydayPanel._watcherSetupUtil = _arg_1;
        }


        public function set item3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._100525952item3;
            if (_local_2 !== _arg_1)
            {
                this._100525952item3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item3", _local_2, _arg_1));
            };
        }

        public function set item4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._100525953item4;
            if (_local_2 !== _arg_1)
            {
                this._100525953item4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item4", _local_2, _arg_1));
            };
        }

        public function set item1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._100525950item1;
            if (_local_2 !== _arg_1)
            {
                this._100525950item1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item1", _local_2, _arg_1));
            };
        }

        public function set item5(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._100525954item5;
            if (_local_2 !== _arg_1)
            {
                this._100525954item5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item5", _local_2, _arg_1));
            };
        }

        public function __btn_click(_arg_1:MouseEvent):void
        {
            clickBtn();
        }

        public function set item6(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._100525955item6;
            if (_local_2 !== _arg_1)
            {
                this._100525955item6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item6", _local_2, _arg_1));
            };
        }

        public function showPanel():*
        {
            initView();
            visible = true;
        }

        public function set item7(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._100525956item7;
            if (_local_2 !== _arg_1)
            {
                this._100525956item7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item7", _local_2, _arg_1));
            };
        }

        public function __btn1_click(_arg_1:MouseEvent):void
        {
            clickBtn1();
        }

        public function set item2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._100525951item2;
            if (_local_2 !== _arg_1)
            {
                this._100525951item2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item2", _local_2, _arg_1));
            };
        }

        private function onInitRebateEverydayData(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:Number;
            var _local_4:Number;
            var _local_5:*;
            var _local_6:Date;
            var _local_7:Number;
            var _local_8:String;
            var _local_9:RebateEverydayOneCanvas;
            var _local_10:*;
            if (_arg_1)
            {
                rebateEverydayConf = _arg_1.conf;
                rebateEverydayData = ((_arg_1.data) ? _arg_1.data : rebateEverydayData);
                rebateEverydayExp = _arg_1.exp;
                starttime.text = Language.REBATE_EVERYDAY_PANEL[15].replace("{time}", TimeUtil.dateTimeToString(new Date(rebateEverydayConf.start)));
                endtime.text = Language.REBATE_EVERYDAY_PANEL[14].replace("{time}", TimeUtil.dateTimeToString(new Date(rebateEverydayConf.end)));
                RebateEverydayCanvasObj = {};
                _local_2 = rebateEverydayConf.iInfo;
                _local_3 = 1;
                vb.removeAllChildren();
                _local_4 = 1;
                while (_local_4 < 8)
                {
                    this[("item" + _local_4)].clean();
                    _local_4++;
                };
                for (_local_5 in _local_2)
                {
                    if (((_local_2[_local_5]) && (_local_2[_local_5].inc == 1)))
                    {
                        _local_9 = new RebateEverydayOneCanvas();
                        _local_10 = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_local_2[_local_5].iid];
                        _local_9.Num = _local_2[_local_5].number;
                        _local_9.ItemData = _local_2[_local_5].iid;
                        _local_9.Lab = _local_10.name;
                        RebateEverydayCanvasObj[_local_2[_local_5].iid] = _local_9;
                        vb.addChild(_local_9);
                    };
                    if (((_local_2[_local_5]) && (_local_2[_local_5].inc == 2)))
                    {
                        this[("item" + _local_3)].type = GamePredef.TBL_ITEM_TEMPLATE;
                        this[("item" + _local_3)].giid = _local_2[_local_5].iid;
                        this[("item" + _local_3)].slotData = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_local_2[_local_5].iid];
                        _local_3 = (_local_3 + 1);
                    };
                };
                btn.visible = true;
                btn1.visible = false;
                btn1.enabled = true;
                imagetexiao.visible = true;
                point.text = Language.REBATE_EVERYDAY_PANEL[10].replace("{num}", rebateEverydayExp);
                _local_6 = new Date();
                _local_6.setTime(((new Date().getTime() + _core.timeLag) + TimeUtil.timeOSOffSet));
                _local_7 = _local_6.getTime();
                _local_8 = TimeUtil.getTimeStr4("day", _local_7);
                if ((((rebateEverydayData) && (rebateEverydayData.flag == 1)) && (rebateEverydayData.day == _local_8)))
                {
                    imagetexiao.visible = false;
                    btn.visible = false;
                    btn1.visible = true;
                    btn1.enabled = false;
                };
                if ((((rebateEverydayData) && (rebateEverydayData.flag == 0)) && (rebateEverydayData.day == _local_8)))
                {
                    btn.visible = false;
                    imagetexiao.visible = false;
                    btn1.visible = true;
                    btn1.enabled = true;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get endtime():Label
        {
            return (this._1606289880endtime);
        }

        public function set point(_arg_1:Label):void
        {
            var _local_2:Object = this._106845584point;
            if (_local_2 !== _arg_1)
            {
                this._106845584point = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "point", _local_2, _arg_1));
            };
        }

        public function ___RebateEverydayPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        [Bindable(event="propertyChange")]
        public function get starttime():Label
        {
            return (this._2128341457starttime);
        }

        public function set rightCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object = this._886301036rightCanvas;
            if (_local_2 !== _arg_1)
            {
                this._886301036rightCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rightCanvas", _local_2, _arg_1));
            };
        }

        public function set endtime(_arg_1:Label):void
        {
            var _local_2:Object = this._1606289880endtime;
            if (_local_2 !== _arg_1)
            {
                this._1606289880endtime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "endtime", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btn1():Button
        {
            return (this._3034453btn1);
        }

        public function set vb(_arg_1:VBox):void
        {
            var _local_2:Object = this._3756vb;
            if (_local_2 !== _arg_1)
            {
                this._3756vb = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vb", _local_2, _arg_1));
            };
        }

        public function set starttime(_arg_1:Label):void
        {
            var _local_2:Object = this._2128341457starttime;
            if (_local_2 !== _arg_1)
            {
                this._2128341457starttime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starttime", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btn():Button
        {
            return (this._97884btn);
        }

        [Bindable(event="propertyChange")]
        public function get item1():ItemSlot
        {
            return (this._100525950item1);
        }

        [Bindable(event="propertyChange")]
        public function get item2():ItemSlot
        {
            return (this._100525951item2);
        }

        [Bindable(event="propertyChange")]
        public function get item4():ItemSlot
        {
            return (this._100525953item4);
        }

        public function changeTTButton():void
        {
            if (initialized)
            {
                btn.visible = false;
                btn1.visible = true;
                btn1.enabled = true;
                imagetexiao.source = null;
            };
        }

        [Bindable(event="propertyChange")]
        public function get item6():ItemSlot
        {
            return (this._100525955item6);
        }

        [Bindable(event="propertyChange")]
        public function get item7():ItemSlot
        {
            return (this._100525956item7);
        }

        [Bindable(event="propertyChange")]
        public function get item3():ItemSlot
        {
            return (this._100525952item3);
        }

        [Bindable(event="propertyChange")]
        public function get item5():ItemSlot
        {
            return (this._100525954item5);
        }

        private function helpInfo():void
        {
            if (_helpAlert)
            {
                PopUpManager.removePopUp(_helpAlert);
                _helpAlert = null;
            };
            Language.REBATE_EVERYDAY_PANEL[9] = Language.REBATE_EVERYDAY_PANEL[9].replace("{num}", rebateEverydayConf.goldnum).replace("{point}", rebateEverydayConf.expnum);
            var _local_1:String = Language.REBATE_EVERYDAY_PANEL[9].toString();
            _helpAlert = Alert.show(_local_1, Language.REBATE_EVERYDAY_PANEL[8].toString(), Alert.YES, null, null);
        }

        [Bindable(event="propertyChange")]
        public function get rightCanvas():Canvas
        {
            return (this._886301036rightCanvas);
        }

        override public function initialize():void
        {
            var target:RebateEverydayPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _RebateEverydayPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_RebateEverydayPanelWatcherSetupUtil");
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

        public function set btn1(_arg_1:Button):void
        {
            var _local_2:Object = this._3034453btn1;
            if (_local_2 !== _arg_1)
            {
                this._3034453btn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get vb():VBox
        {
            return (this._3756vb);
        }

        [Bindable(event="propertyChange")]
        public function get point():Label
        {
            return (this._106845584point);
        }

        private function clickBtn():void
        {
            var _local_1:* = ViewManager.getInstance().getUI(ViewManager.PANEL_EXCHANGE);
            if (_local_1)
            {
                _local_1.show();
            };
        }

        public function set btn(_arg_1:Button):void
        {
            var _local_2:Object = this._97884btn;
            if (_local_2 !== _arg_1)
            {
                this._97884btn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn", _local_2, _arg_1));
            };
        }

        public function setflag(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            rebateEverydayData = ((_arg_1.data) ? _arg_1.data : rebateEverydayData);
            rebateEverydayExp = ((_arg_1.exp) ? _arg_1.exp : rebateEverydayExp);
            if (rebateEverydayData.flag == 1)
            {
                point.text = Language.REBATE_EVERYDAY_PANEL[10].replace("{num}", rebateEverydayExp);
                btn1.enabled = false;
            };
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            _core.remote.call("initRebateEverydayPanelData", new Responder(onInitRebateEverydayData));
        }

        public function set imagetexiao(_arg_1:Image):void
        {
            var _local_2:Object = this._1188525589imagetexiao;
            if (_local_2 !== _arg_1)
            {
                this._1188525589imagetexiao = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imagetexiao", _local_2, _arg_1));
            };
        }

        public function ___RebateEverydayPanel_LinkButton1_click(_arg_1:MouseEvent):void
        {
            helpInfo();
        }

        public function changeExpnumber(_arg_1:Number):void
        {
            if (initialized)
            {
                point.text = Language.REBATE_EVERYDAY_PANEL[10].replace("{num}", _arg_1);
            };
        }

        [Bindable(event="propertyChange")]
        public function get imagetexiao():Image
        {
            return (this._1188525589imagetexiao);
        }

        private function _RebateEverydayPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.REBATE_EVERYDAY_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _RebateEverydayPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_RebateEverydayPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000531));
            }, function (_arg_1:Object):void
            {
                _RebateEverydayPanel_Image1.source = _arg_1;
            }, "_RebateEverydayPanel_Image1.source");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getResUrl(2080130102038));
            }, function (_arg_1:Object):void
            {
                imagetexiao.source = _arg_1;
            }, "imagetexiao.source");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.REBATE_EVERYDAY_PANEL[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _RebateEverydayPanel_LinkButton1.label = _arg_1;
            }, "_RebateEverydayPanel_LinkButton1.label");
            result[3] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _RebateEverydayPanel_LinkButton1.setStyle("overSkin", _arg_1);
            }, "_RebateEverydayPanel_LinkButton1.overSkin");
            result[4] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _RebateEverydayPanel_LinkButton1.setStyle("upSkin", _arg_1);
            }, "_RebateEverydayPanel_LinkButton1.upSkin");
            result[5] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _RebateEverydayPanel_LinkButton1.setStyle("downSkin", _arg_1);
            }, "_RebateEverydayPanel_LinkButton1.downSkin");
            result[6] = binding;
            return (result);
        }

        private function _RebateEverydayPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.REBATE_EVERYDAY_PANEL[0];
            _local_1 = ResManager.getIconUrl(4130220000531);
            _local_1 = ResManager.getResUrl(2080130102038);
            _local_1 = Language.REBATE_EVERYDAY_PANEL[8];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
        }

        private function clickBtn1():void
        {
            _core.remote.call("getRebateEveryday", new Responder(setflag));
        }


    }
}//package com.qeedoo.ui.view.compDragable

