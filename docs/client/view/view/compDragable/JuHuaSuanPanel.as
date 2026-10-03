// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.JuHuaSuanPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.containers.VBox;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.Button;
    import mx.controls.Image;
    import mx.controls.Alert;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.resource.ResManager;
    import mx.events.FlexEvent;
    import com.qeedoo.ui.utils.ToolKit;
    import mx.binding.Binding;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import com.qeedoo.game.view.ViewManager;
    import flash.net.Responder;
    import com.adobe.crypto.MD5;
    import mx.events.CloseEvent;
    import mx.managers.PopUpManager;
    import mx.core.IUITextField;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.view.comp.JuHuaSuanOneCanvas;
    import com.qeedoo.game.utils.TimeUtil;
    import com.qeedoo.game.data.GameData;
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

    public class JuHuaSuanPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _177693201infoLab0:Label;
        private var _177693202infoLab1:Label;
        private var _3756vb:VBox;
        public var _JuHuaSuanPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _97884btn:Button;
        private var _isRenRen:Boolean = false;
        public var _JuHuaSuanPanel_Image2:Image;
        public var _JuHuaSuanPanel_Image3:Image;
        public var _JuHuaSuanPanel_Image1:Image;
        private var _alert:Alert;
        private var _3242771item:ItemSlot;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":672,
                    "height":445,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_JuHuaSuanPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"RoundedGradientBorder",
                                "label":"Hornor",
                                "y":34,
                                "width":662,
                                "height":406,
                                "x":5,
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_JuHuaSuanPanel_Image1",
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
                                            "x":2,
                                            "y":5,
                                            "width":245,
                                            "height":396,
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":VBox,
                                                "id":"vb",
                                                "stylesFactory":function ():void
                                                {
                                                    this.backgroundAlpha = 0;
                                                    this.top = "5";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "horizontalScrollPolicy":"off"
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_JuHuaSuanPanel_Image2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":314.5,
                                            "y":330,
                                            "width":54,
                                            "height":54
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_JuHuaSuanPanel_Image3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":322,
                                            "y":336,
                                            "width":38,
                                            "height":38
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"item",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":323.5,
                                            "y":338,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btn",
                                    "events":{"click":"__btn_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"juhuasuanBtn",
                                            "x":434.5,
                                            "y":333,
                                            "width":188,
                                            "height":49
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"infoLab0",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0x7CFC00;
                                        this.fontSize = 12;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":454.5,
                                            "y":271,
                                            "width":266.5,
                                            "height":24
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"infoLab1",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0x7CFC00;
                                        this.fontSize = 12;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":454.5,
                                            "y":251,
                                            "width":266.5,
                                            "height":24
                                        });
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var juhuasuanConf:Object = {};
        private var juhuasuanData:Object = {};
        private var JuHuaSuanOneCanvasObj:Object = {};
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function JuHuaSuanPanel()
        {
            mx_internal::_document = this;
            this.width = 672;
            this.height = 445;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
            this.x = 103;
            this.y = 102;
            this.addEventListener("creationComplete", ___JuHuaSuanPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            JuHuaSuanPanel._watcherSetupUtil = _arg_1;
        }


        public function onbuyJuHuaSuanOneClient(_arg_1:Number, _arg_2:Number, _arg_3:String):void
        {
            if (!juhuasuanData.item1[_arg_1])
            {
                juhuasuanData.item1[_arg_1] = {};
            };
            juhuasuanData.item1[_arg_1]["bt"] = _arg_2;
            juhuasuanData.item1[_arg_1]["ht"] = _arg_3;
            if (JuHuaSuanOneCanvasObj[_arg_1])
            {
                JuHuaSuanOneCanvasObj[_arg_1].setLeftDay2(_arg_2, _arg_3);
            };
            if (checkIsAllBuy())
            {
                btn.enabled = false;
            };
        }

        public function __btn_click(_arg_1:MouseEvent):void
        {
            clickBtn();
        }

        public function showPanel():*
        {
            initView();
            visible = true;
        }

        private function _JuHuaSuanPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.JUHUASUAN_PANEL[0];
            _local_1 = ResManager.getIconUrl(4130220000501);
            _local_1 = ResManager.getResUrl(2080130102018);
            _local_1 = ResManager.getIconUrl(4130220000502);
        }

        public function ___JuHuaSuanPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        [Bindable(event="propertyChange")]
        public function get infoLab1():Label
        {
            return (this._177693202infoLab1);
        }

        [Bindable(event="propertyChange")]
        public function get item():ItemSlot
        {
            return (this._3242771item);
        }

        private function checkIsAllBuy():Boolean
        {
            var _local_2:*;
            var _local_1:Object = juhuasuanConf.iInfo;
            for (_local_2 in _local_1)
            {
                if (((_local_1[_local_2]) && ((!(_local_1[_local_2].isAll)) || (ToolKit.isEqual(_local_1[_local_2].isAll, 0)))))
                {
                    if (!juhuasuanData.item1[_local_1[_local_2].iid])
                    {
                        return (false);
                    };
                };
            };
            return (true);
        }

        private function _JuHuaSuanPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.JUHUASUAN_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _JuHuaSuanPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_JuHuaSuanPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000501));
            }, function (_arg_1:Object):void
            {
                _JuHuaSuanPanel_Image1.source = _arg_1;
            }, "_JuHuaSuanPanel_Image1.source");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getResUrl(2080130102018));
            }, function (_arg_1:Object):void
            {
                _JuHuaSuanPanel_Image2.source = _arg_1;
            }, "_JuHuaSuanPanel_Image2.source");
            result[2] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000502));
            }, function (_arg_1:Object):void
            {
                _JuHuaSuanPanel_Image3.source = _arg_1;
            }, "_JuHuaSuanPanel_Image3.source");
            result[3] = binding;
            return (result);
        }

        public function set infoLab1(_arg_1:Label):void
        {
            var _local_2:Object = this._177693202infoLab1;
            if (_local_2 !== _arg_1)
            {
                this._177693202infoLab1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "infoLab1", _local_2, _arg_1));
            };
        }

        public function set item(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3242771item;
            if (_local_2 !== _arg_1)
            {
                this._3242771item = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:JuHuaSuanPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _JuHuaSuanPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_JuHuaSuanPanelWatcherSetupUtil");
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

        public function setGoldLock(_arg_1:Boolean):void
        {
            var _local_2:BagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
            var _local_3:Boolean = _local_2.goldLockFlag;
            if (((!(_local_3 == _arg_1)) && (_local_2)))
            {
                _local_2.goldLockFlag = _arg_1;
            };
        }

        private function clickBtn():void
        {
            var i:* = undefined;
            var handler:Function;
            var gfunc:Function;
            var bagPanel:BagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
            var goldLockFlag:Boolean = bagPanel.goldLockFlag;
            if (((goldLockFlag) || (!(bagPanel))))
            {
                _core.sysMsg(Language.JUHUASUAN_PANEL[15]);
                gfunc = function (_arg_1:String):void
                {
                    _core.remote.call("unlockMoney", new Responder(doUnlockMoneyGold), MD5.hash(_arg_1));
                };
                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], gfunc);
                return;
            };
            var obj:Object = getLeftJuHuaSuan();
            if (!obj)
            {
                return;
            };
            var totalPt:Number = 0;
            for (i in obj)
            {
                totalPt = ToolKit.add(totalPt, obj[i]);
            };
            handler = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("buyJuHuaSuanAll", null);
                };
            };
            if (_alert)
            {
                PopUpManager.removePopUp(_alert);
                _alert = null;
            };
            var str:String = Language.JUHUASUAN_PANEL[8].replace("{point}", totalPt);
            if (_isRenRen)
            {
                str = Language.JUHUASUAN_PANEL[8].replace("{point}", Math.floor((totalPt / 10))).replace(Language.JUHUASUAN_PANEL[13], Language.JUHUASUAN_PANEL[12]);
            };
            _alert = Alert.show(str, null, (Alert.YES | Alert.NO), null, handler);
            var tf:IUITextField = _alert.mx_internal::alertForm.mx_internal::textField;
            tf.htmlText = str;
            tf.filters = GamePredef.FILTER_TEXT1;
        }

        [Bindable(event="propertyChange")]
        public function get vb():VBox
        {
            return (this._3756vb);
        }

        [Bindable(event="propertyChange")]
        public function get infoLab0():Label
        {
            return (this._177693201infoLab0);
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

        public function set infoLab0(_arg_1:Label):void
        {
            var _local_2:Object = this._177693201infoLab0;
            if (_local_2 !== _arg_1)
            {
                this._177693201infoLab0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "infoLab0", _local_2, _arg_1));
            };
        }

        private function onInitJuHuaSuanData(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:*;
            var _local_4:JuHuaSuanOneCanvas;
            var _local_5:Number;
            var _local_6:String;
            if (_arg_1)
            {
                juhuasuanConf = _arg_1.jhsConf;
                juhuasuanData = _arg_1.jhsData;
                if (((_arg_1.isRR) && (ToolKit.isEqual(_arg_1.isRR, 2))))
                {
                    _isRenRen = true;
                }
                else
                {
                    _isRenRen = false;
                };
                infoLab0.text = Language.JUHUASUAN_PANEL[11].replace("{time}", TimeUtil.dateTimeToString(new Date(juhuasuanConf.close)));
                infoLab1.text = Language.JUHUASUAN_PANEL[10].replace("{time}", TimeUtil.dateTimeToString(new Date(juhuasuanConf.end)));
                JuHuaSuanOneCanvasObj = {};
                _local_2 = juhuasuanConf.iInfo;
                vb.removeAllChildren();
                for (_local_3 in _local_2)
                {
                    if (((_local_2[_local_3]) && ((!(_local_2[_local_3].isAll)) || (ToolKit.isEqual(_local_2[_local_3].isAll, 0)))))
                    {
                        _local_4 = new JuHuaSuanOneCanvas();
                        _local_4.isRR = _isRenRen;
                        _local_4.Point = _local_2[_local_3].pt;
                        _local_4.ItemData = _local_2[_local_3].iid;
                        _local_4.Lab = _local_2[_local_3].info;
                        _arg_1 = juhuasuanData.item1[_local_2[_local_3].iid];
                        if (_arg_1)
                        {
                            _local_5 = ((_arg_1["bt"]) ? _arg_1["bt"] : 0);
                            _local_6 = ((_arg_1["ht"]) ? _arg_1["ht"] : "0");
                            _local_4.setLeftDay(_local_2[_local_3].day, _local_5, _local_6);
                        }
                        else
                        {
                            _local_4.setLeftDay(_local_2[_local_3].day, 0, "0");
                        };
                        JuHuaSuanOneCanvasObj[_local_2[_local_3].iid] = _local_4;
                        vb.addChild(_local_4);
                    }
                    else
                    {
                        if (((_local_2[_local_3]) && (ToolKit.isEqual(_local_2[_local_3].isAll, 1))))
                        {
                            this["item"].type = GamePredef.TBL_ITEM_TEMPLATE;
                            this["item"].giid = _local_2[_local_3].iid;
                            this["item"].slotData = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_local_2[_local_3].iid];
                        };
                    };
                };
                if (checkIsAllBuy())
                {
                    btn.enabled = false;
                }
                else
                {
                    btn.enabled = true;
                };
            };
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            _core.remote.call("initJuHuaSuanData", new Responder(onInitJuHuaSuanData));
        }

        private function doUnlockMoneyGold(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                setGoldLock(false);
            };
        }

        public function getLeftJuHuaSuan():Object
        {
            var _local_3:*;
            var _local_1:Object = {};
            var _local_2:Boolean;
            for (_local_3 in juhuasuanConf.iInfo)
            {
                if ((((ToolKit.isEqual(juhuasuanConf.iInfo[_local_3].isAll, 0)) || (!(juhuasuanConf.iInfo[_local_3].isAll))) && (!(juhuasuanData.item1[juhuasuanConf.iInfo[_local_3].iid]))))
                {
                    _local_1[juhuasuanConf.iInfo[_local_3].iid] = juhuasuanConf.iInfo[_local_3].pt;
                    _local_2 = true;
                };
            };
            if (_local_2)
            {
                return (_local_1);
            };
            return (null);
        }

        [Bindable(event="propertyChange")]
        public function get btn():Button
        {
            return (this._97884btn);
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

        public function onbuyJuHuaSuanAllClient(_arg_1:Object):void
        {
            var _local_2:*;
            for (_local_2 in _arg_1)
            {
                onbuyJuHuaSuanOneClient(_local_2, _arg_1[_local_2]["bt"], _arg_1[_local_2]["ht"]);
            };
            btn.enabled = false;
        }


    }
}//package com.qeedoo.ui.view.compDragable

