// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.ProductPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.HSlider;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.ProgressBar;
    import com.qeedoo.ui.view.comp.IntroText;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import flash.utils.Timer;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.TimerEvent;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import mx.controls.Alert;
    import mx.events.FlexEvent;
    import mx.events.DragEvent;
    import flash.utils.setTimeout;
    import mx.events.SliderEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.net.Responder;
    import com.qeedoo.ui.view.comp.Slot;
    import flash.events.MouseEvent;
    import flash.utils.clearTimeout;
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

    public class ProductPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const LEVEL_DECREASE:Number = 0.05;
        private const DELAY_NEXT:int = 1000;
        private var _109446num:int = 0;
        private var _1177184812itemIcon:ItemSlot;
        public var _ProductPanel_Label3:Label;
        public var _ProductPanel_Label4:Label;
        public var _ProductPanel_Label5:Label;
        private var _3317767left:int = 0;
        private var handler:int = -1;
        public var _ProductPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _3339hs:HSlider;
        public var _ProductPanel_BasicTxtButton1:BasicTxtButton;
        private var flag:Boolean = false;
        public var isInited:Boolean = false;
        public var _ProductPanel_BasicGlowButton1:BasicGlowButton;
        private var _963188850gloveIcon:ItemSlot;
        private var _122370912manaIcon:ItemSlot;
        private var _3237038info:Label;
        private var _111277pro:ProgressBar;
        private var _2116189043itemNum:Label;
        private var npcId:Number;
        private var _1335252116descid:IntroText;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":300,
                    "height":411,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_ProductPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "events":{"mouseDown":"___ProductPanel_Canvas1_mouseDown"},
                        "stylesFactory":function ():void
                        {
                            this.borderStyle = "none";
                            this.borderColor = 0;
                            this.backgroundColor = 0xFFFFFF;
                            this.backgroundAlpha = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":15,
                                "y":37,
                                "width":270,
                                "height":206,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"itemIcon",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":9,
                                            "y":8,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"info",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":47.5,
                                            "y":6
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"manaIcon",
                                    "events":{"dragDrop":"__manaIcon_dragDrop"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":9,
                                            "y":109
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"gloveIcon",
                                    "events":{"dragDrop":"__gloveIcon_dragDrop"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":9,
                                            "y":153
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HSlider,
                                    "id":"hs",
                                    "events":{"change":"__hs_change"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":49,
                                            "y":121,
                                            "minimum":0,
                                            "maximum":100,
                                            "allowTrackClick":true,
                                            "value":10,
                                            "width":209
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ProgressBar,
                                    "id":"pro",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "mode":"manual",
                                            "x":10,
                                            "y":51,
                                            "labelPlacement":"center",
                                            "height":10,
                                            "width":248,
                                            "label":" "
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"itemNum",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 6205693;
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":49,
                                            "y":24
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_ProductPanel_Label3",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                        this.textAlign = "right";
                                        this.right = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"y":24});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_ProductPanel_BasicGlowButton1",
                                    "events":{"click":"___ProductPanel_BasicGlowButton1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":190,
                                            "y":166,
                                            "styleName":"BtnRed",
                                            "width":70,
                                            "height":19
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":IntroText,
                        "id":"descid",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":19,
                                "y":244,
                                "width":263,
                                "height":148
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_ProductPanel_BasicTxtButton1",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 1;
                            this.paddingRight = 1;
                            this.paddingTop = 1;
                            this.paddingBottom = 1;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":103,
                                "y":121,
                                "width":95,
                                "height":19
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_ProductPanel_Label4",
                        "stylesFactory":function ():void
                        {
                            this.color = 15116365;
                            this.fontSize = 14;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":70,
                                "y":150,
                                "width":50,
                                "height":18,
                                "text":"0%"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_ProductPanel_Label5",
                        "stylesFactory":function ():void
                        {
                            this.color = 15116365;
                            this.fontSize = 14;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":230,
                                "y":150,
                                "width":50,
                                "height":18,
                                "text":"100%"
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var timer:Timer = new Timer(100);
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function ProductPanel()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.borderStyle = "solid";
                this.borderColor = 0;
                this.backgroundColor = 11589631;
                this.backgroundAlpha = 0.5;
            };
            this.width = 300;
            this.height = 411;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___ProductPanel_DragableCanvas1_creationComplete);
        }

        public static function isGloveEquip(_arg_1:*):Boolean
        {
            var _local_2:*;
            for (_local_2 in GamePredef.PROUDCT_GLOVE_EQUIP)
            {
                if (_arg_1 == GamePredef.PROUDCT_GLOVE_EQUIP[_local_2])
                {
                    return (true);
                };
            };
            return (false);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ProductPanel._watcherSetupUtil = _arg_1;
        }


        private function stop():void
        {
            timer.removeEventListener(TimerEvent.TIMER, showProgress);
            timer.stop();
            timer.reset();
        }

        [Bindable(event="propertyChange")]
        private function get left():int
        {
            return (this._3317767left);
        }

        private function set num(_arg_1:int):void
        {
            var _local_2:Object = this._109446num;
            if (_local_2 !== _arg_1)
            {
                this._109446num = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "num", _local_2, _arg_1));
            };
        }

        public function updateView():void
        {
            initView();
        }

        public function updateGlove(_arg_1:Number):void
        {
            if (gloveIcon == null)
            {
                return;
            };
            gloveIcon.type = GamePredef.TBL_EQUIPT_INSTANCE;
            gloveIcon.giid = _arg_1;
            if (gloveIcon.giid > 0)
            {
                flag = true;
            }
            else
            {
                flag = false;
            };
        }

        [Bindable(event="propertyChange")]
        public function get hs():HSlider
        {
            return (this._3339hs);
        }

        private function set left(_arg_1:int):void
        {
            var _local_2:Object = this._3317767left;
            if (_local_2 !== _arg_1)
            {
                this._3317767left = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "left", _local_2, _arg_1));
            };
        }

        public function set hs(_arg_1:HSlider):void
        {
            var _local_2:Object = this._3339hs;
            if (_local_2 !== _arg_1)
            {
                this._3339hs = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hs", _local_2, _arg_1));
            };
        }

        public function init(_arg_1:Object):void
        {
            visible = true;
            gloveIcon.type = GamePredef.TBL_EQUIPT_INSTANCE;
            gloveIcon.giid = GamePredef.GLOBAL_SETTING["glid"];
            if (gloveIcon.giid > 0)
            {
                flag = true;
            };
            npcId = _arg_1.nid;
            itemIcon.giid = _arg_1.iid;
            num = 0;
            info.text = Language.PRODUCTPANEL_S[11];
            info.setStyle("color", "#99FF99");
            if (!flag)
            {
                Alert.show(Language.PRODUCTPANEL_S[10]);
                return;
            };
            produceReady();
        }

        public function ___ProductPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
            isInited = true;
        }

        [Bindable(event="propertyChange")]
        public function get itemIcon():ItemSlot
        {
            return (this._1177184812itemIcon);
        }

        private function setStack():void
        {
            var _local_1:Object = _core.getItemNumFromBag(GamePredef.TBL_ITEM_TEMPLATE, manaIcon.giid);
            manaIcon.stackNum = _local_1.num;
            if (manaIcon.stackNum > 0)
            {
                manaIcon.alpha = 1;
            }
            else
            {
                manaIcon.alpha = 0.5;
            };
        }

        public function onUpdateView(_arg_1:Object):void
        {
            productEnd(_arg_1);
        }

        public function __gloveIcon_dragDrop(_arg_1:DragEvent):void
        {
            setGloveSlot(_arg_1);
        }

        private function showProgress(_arg_1:TimerEvent):void
        {
            pro.setProgress(timer.currentCount, timer.repeatCount);
        }

        public function set itemIcon(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177184812itemIcon;
            if (_local_2 !== _arg_1)
            {
                this._1177184812itemIcon = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemIcon", _local_2, _arg_1));
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
        public function get manaIcon():ItemSlot
        {
            return (this._122370912manaIcon);
        }

        public function set pro(_arg_1:ProgressBar):void
        {
            var _local_2:Object = this._111277pro;
            if (_local_2 !== _arg_1)
            {
                this._111277pro = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pro", _local_2, _arg_1));
            };
        }

        private function start():void
        {
            timer.reset();
            timer.start();
            info.text = Language.PRODUCTPANEL_S[1];
            info.setStyle("color", "#99FF99");
        }

        public function __manaIcon_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        private function productEnd(_arg_1:Object):void
        {
            var _local_2:String;
            if (((manaIcon.giid > 0) && (((_core.player.currentMp / _core.player.property.finalMp) * 100) < hs.value)))
            {
                _core.useItem(manaIcon.giid, manaIcon);
            };
            if ((_arg_1 is Number))
            {
                info.text = Language.PRODUCTPANEL_S[2];
                info.setStyle("color", "#9999FF");
                handler = setTimeout(start, DELAY_NEXT);
                num++;
                left = Number(_arg_1);
                if (left <= 0)
                {
                    handler = -1;
                    stop();
                    hide();
                };
                return;
            };
            if (_arg_1 == "s")
            {
                info.text = Language.PRODUCTPANEL_S[3];
                info.setStyle("color", "#9999FF");
                handler = setTimeout(start, DELAY_NEXT);
                num++;
            }
            else
            {
                if (_arg_1 == "f")
                {
                    info.text = Language.PRODUCTPANEL_S[4];
                    info.setStyle("color", "#FF9999");
                    handler = setTimeout(start, DELAY_NEXT);
                }
                else
                {
                    _local_2 = Language.PRODUCTPANEL_S[12];
                    if (_arg_1 == "ed")
                    {
                        _local_2 = Language.PRODUCTPANEL_S[14];
                    }
                    else
                    {
                        if (_arg_1 == "eg")
                        {
                            _local_2 = Language.PRODUCTPANEL_S[15];
                        }
                        else
                        {
                            if (_arg_1 == "em")
                            {
                                _local_2 = Language.PRODUCTPANEL_S[16];
                            }
                            else
                            {
                                if (_arg_1 == "eb")
                                {
                                    _local_2 = Language.PRODUCTPANEL_S[17];
                                }
                                else
                                {
                                    if (_arg_1 == "ea")
                                    {
                                        _local_2 = Language.PRODUCTPANEL_S[18];
                                    }
                                    else
                                    {
                                        if (_arg_1 == "ee")
                                        {
                                            _local_2 = Language.PRODUCTPANEL_S[19];
                                        }
                                        else
                                        {
                                            if (_arg_1 == "el")
                                            {
                                                _local_2 = Language.PRODUCTPANEL_S[20];
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                    info.text = Language.PRODUCTPANEL_S[5];
                    handler = -1;
                    Alert.show(_local_2);
                    stop();
                    _core.remote.onProductCancel();
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get gloveIcon():ItemSlot
        {
            return (this._963188850gloveIcon);
        }

        [Bindable(event="propertyChange")]
        public function get descid():IntroText
        {
            return (this._1335252116descid);
        }

        [Bindable(event="propertyChange")]
        public function get itemNum():Label
        {
            return (this._2116189043itemNum);
        }

        private function setSlot(_arg_1:DragEvent):void
        {
            var _local_4:Object;
            var _local_2:ItemSlot = ItemSlot(_arg_1.currentTarget);
            var _local_3:Object = _arg_1.dragSource.dataForFormat("slot");
            if (_local_2 == _local_3)
            {
                return;
            };
            if (((_local_3.type == GamePredef.TBL_ITEM_INSTANCE) || (_local_3.type == GamePredef.TBL_ITEM_TEMPLATE)))
            {
                _local_4 = _core.getTemplateData(_local_3.type, _local_3.giid, false);
                if (((!(_local_4)) || ((_local_4.skillId <= 0) && ((!(_local_4.scriptUse)) || (_local_4.scriptUse.length <= 0)))))
                {
                    return;
                };
                _core.updateSettingNow("pid", _local_4.id);
            };
        }

        private function buyGlove():void
        {
            _core.remote.clickShop(275);
        }

        public function __hs_change(_arg_1:SliderEvent):void
        {
            setProgress();
        }

        [Bindable(event="propertyChange")]
        private function get num():int
        {
            return (this._109446num);
        }

        override public function initialize():void
        {
            var target:ProductPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ProductPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_ProductPanelWatcherSetupUtil");
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

        private function produceReady():void
        {
            stop();
            info.text = Language.PRODUCTPANEL_S[0];
            info.setStyle("color", "#99FF99");
            var _local_1:Object = {};
            _local_1.npcId = npcId;
            _local_1.gloveId = gloveIcon.giid;
            _core.remote.call("onProductReady", new Responder(onStart), _local_1);
        }

        private function _ProductPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.PRODUCTPANEL_U[0];
            _local_1 = GamePredef.TBL_ITEM_TEMPLATE;
            _local_1 = Language.PRODUCTPANEL_S[6];
            _local_1 = Language.PRODUCTPANEL_S[21];
            _local_1 = GamePredef.TBL_ITEM_TEMPLATE;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Language.PRODUCTPANEL_S[22];
            _local_1 = GamePredef.TBL_EQUIPT_INSTANCE;
            _local_1 = Slot.SLOT_EQUIP;
            _local_1 = [13];
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = (Language.PRODUCTPANEL_S[7] + num);
            _local_1 = (Language.PRODUCTPANEL_S[8] + left);
            _local_1 = Language.PRODUCTPANEL_U[2];
            _local_1 = Language.PRODUCTPANEL_U[1];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
        }

        [Bindable(event="propertyChange")]
        public function get info():Label
        {
            return (this._3237038info);
        }

        private function setProgress():void
        {
            _core.updateSettingNow("p1", int(hs.value));
        }

        public function updateMana(_arg_1:Number):void
        {
            manaIcon.type = GamePredef.TBL_ITEM_TEMPLATE;
            manaIcon.giid = _arg_1;
            setStack();
        }

        [Bindable(event="propertyChange")]
        public function get pro():ProgressBar
        {
            return (this._111277pro);
        }

        private function setGloveSlot(_arg_1:DragEvent):void
        {
            var _local_4:Object;
            var _local_2:ItemSlot = ItemSlot(_arg_1.currentTarget);
            var _local_3:Object = _arg_1.dragSource.dataForFormat("slot");
            if (_local_2 == _local_3)
            {
                return;
            };
            if (_local_3.type == GamePredef.TBL_EQUIPT_INSTANCE)
            {
                _local_4 = _core.getTemplateData(_local_3.type, _local_3.giid, false);
                if ((((!(_local_4)) || (!(isGloveEquip(_local_4.id)))) || (_core.player.level < _local_4.reqLevel)))
                {
                    return;
                };
                _core.updateSettingNow("glid", _local_3.giid);
                produceReady();
            };
        }

        private function timeoutOnProduct(_arg_1:TimerEvent):void
        {
            stop();
            produceReady();
        }

        public function ___ProductPanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            buyGlove();
        }

        public function set manaIcon(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._122370912manaIcon;
            if (_local_2 !== _arg_1)
            {
                this._122370912manaIcon = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "manaIcon", _local_2, _arg_1));
            };
        }

        private function onStart(_arg_1:Object):void
        {
            var _local_2:Object;
            if (_arg_1 == "e")
            {
                Alert.show(Language.PRODUCTPANEL_S[12]);
            }
            else
            {
                if (_arg_1 == "ed")
                {
                    Alert.show(Language.PRODUCTPANEL_S[14]);
                }
                else
                {
                    if (_arg_1 == "eg")
                    {
                        Alert.show(Language.PRODUCTPANEL_S[15]);
                    }
                    else
                    {
                        if (_arg_1 == "em")
                        {
                            Alert.show(Language.PRODUCTPANEL_S[16]);
                        }
                        else
                        {
                            if (_arg_1 == "eb")
                            {
                                Alert.show(Language.PRODUCTPANEL_S[17]);
                            }
                            else
                            {
                                if (_arg_1 == "ea")
                                {
                                    Alert.show(Language.PRODUCTPANEL_S[18]);
                                }
                                else
                                {
                                    visible = true;
                                    left = Number(_arg_1);
                                    _local_2 = _core.getTemplateData(gloveIcon.type, gloveIcon.giid, true);
                                    if (_local_2 == null)
                                    {
                                        return;
                                    };
                                    timer.repeatCount = (Number(_local_2.proTime) * 10);
                                    timer.addEventListener(TimerEvent.TIMER, showProgress);
                                    pro.setProgress(0, timer.repeatCount);
                                    handler = setTimeout(start, DELAY_NEXT);
                                };
                            };
                        };
                    };
                };
            };
        }

        override public function initView():void
        {
            if (_core.player.maxActpoint == 9999)
            {
                descid.text = Language.PRODUCTPANEL_S[9];
            }
            else
            {
                descid.text = Language.PRODUCTPANEL_S[13];
            };
            manaIcon.type = GamePredef.TBL_ITEM_TEMPLATE;
            manaIcon.giid = GamePredef.GLOBAL_SETTING["pid"];
            hs.value = GamePredef.GLOBAL_SETTING["p1"];
            setStack();
        }

        public function ___ProductPanel_Canvas1_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        public function set descid(_arg_1:IntroText):void
        {
            var _local_2:Object = this._1335252116descid;
            if (_local_2 !== _arg_1)
            {
                this._1335252116descid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "descid", _local_2, _arg_1));
            };
        }

        override public function set visible(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                _core.player.walkable = false;
            }
            else
            {
                if (_core.player)
                {
                    _core.player.setConditionWalkable();
                };
                if (this.visible)
                {
                    _core.remote.onProductCancel();
                };
                npcId = -1;
                stop();
                if (handler)
                {
                    clearTimeout(handler);
                    handler = -1;
                };
            };
            super.visible = _arg_1;
        }

        public function set itemNum(_arg_1:Label):void
        {
            var _local_2:Object = this._2116189043itemNum;
            if (_local_2 !== _arg_1)
            {
                this._2116189043itemNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemNum", _local_2, _arg_1));
            };
        }

        private function _ProductPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PRODUCTPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ProductPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_ProductPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_ITEM_TEMPLATE);
            }, function (_arg_1:int):void
            {
                itemIcon.type = _arg_1;
            }, "itemIcon.type");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PRODUCTPANEL_S[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                info.text = _arg_1;
            }, "info.text");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PRODUCTPANEL_S[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                manaIcon.text = _arg_1;
            }, "manaIcon.text");
            result[3] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_ITEM_TEMPLATE);
            }, function (_arg_1:int):void
            {
                manaIcon.type = _arg_1;
            }, "manaIcon.type");
            result[4] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                manaIcon.slotType = _arg_1;
            }, "manaIcon.slotType");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PRODUCTPANEL_S[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                gloveIcon.text = _arg_1;
            }, "gloveIcon.text");
            result[6] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_EQUIPT_INSTANCE);
            }, function (_arg_1:int):void
            {
                gloveIcon.type = _arg_1;
            }, "gloveIcon.type");
            result[7] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUIP);
            }, function (_arg_1:int):void
            {
                gloveIcon.slotType = _arg_1;
            }, "gloveIcon.slotType");
            result[8] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([13]);
            }, function (_arg_1:Array):void
            {
                gloveIcon.acceptPos = _arg_1;
            }, "gloveIcon.acceptPos");
            result[9] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                gloveIcon.acceptType = _arg_1;
            }, "gloveIcon.acceptType");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.PRODUCTPANEL_S[7] + num);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                itemNum.text = _arg_1;
            }, "itemNum.text");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.PRODUCTPANEL_S[8] + left);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ProductPanel_Label3.text = _arg_1;
            }, "_ProductPanel_Label3.text");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PRODUCTPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ProductPanel_BasicGlowButton1.label = _arg_1;
            }, "_ProductPanel_BasicGlowButton1.label");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PRODUCTPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ProductPanel_BasicTxtButton1.label = _arg_1;
            }, "_ProductPanel_BasicTxtButton1.label");
            result[14] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _ProductPanel_Label4.filters = _arg_1;
            }, "_ProductPanel_Label4.filters");
            result[15] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _ProductPanel_Label5.filters = _arg_1;
            }, "_ProductPanel_Label5.filters");
            result[16] = binding;
            return (result);
        }

        public function set gloveIcon(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._963188850gloveIcon;
            if (_local_2 !== _arg_1)
            {
                this._963188850gloveIcon = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gloveIcon", _local_2, _arg_1));
            };
        }

        public function onUpdateGloveEquip(_arg_1:int, _arg_2:Number):void
        {
            if (_arg_1 == 1)
            {
                _core.updateSettingNow("glid", _arg_2);
                if (((this.gloveIcon) && (_core.player.state == GamePredef.ST_PRODUCT)))
                {
                    gloveIcon.giid = _arg_2;
                    produceReady();
                };
            }
            else
            {
                if (_arg_1 == 2)
                {
                    _core.updateSettingNow("glid", 0);
                    stop();
                    _core.remote.onProductCancel();
                };
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

