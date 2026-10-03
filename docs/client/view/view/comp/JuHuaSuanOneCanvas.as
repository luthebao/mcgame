// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.JuHuaSuanOneCanvas

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.controls.Button;
    import mx.controls.Image;
    import mx.controls.Alert;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.FlexEvent;
    import com.qeedoo.ui.view.compDragable.BagPanel;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.config.Language;
    import flash.net.Responder;
    import com.adobe.crypto.MD5;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.utils.TimeUtil;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.predef.GamePredef;
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

    public class JuHuaSuanOneCanvas extends SimpleCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _isHad:Number;
        private var _iid:Number;
        private var _106966249ptLab:Label;
        private var _55417365leftDay:Label;
        private var _pt:Number;
        private var _97884btn:Button;
        private var _isRenRen:Boolean;
        private var _ht:String;
        public var _JuHuaSuanOneCanvas_Image1:Image;
        private var _1945394687infoLab:Label;
        private var _lab:String;
        private var _day:Number;
        private var _alert:Alert;
        private var _3242771item:ItemSlot;
        private var _bt:Number;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":220,
                    "height":95,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"_JuHuaSuanOneCanvas_Image1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":25.5,
                                "y":23,
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
                                "x":27.5,
                                "y":25,
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
                                "styleName":"HorizontalTab",
                                "x":167,
                                "y":40,
                                "width":43,
                                "height":21.75
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"infoLab",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":69.5,
                                "y":18.75,
                                "width":140.5,
                                "height":22
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"ptLab",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":69.5,
                                "y":41,
                                "width":89.5,
                                "height":22,
                                "text":"20点"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"leftDay",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":140.5,
                                "y":67,
                                "width":69.5,
                                "height":22,
                                "text":"剩余:30天"
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

        public function JuHuaSuanOneCanvas()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.backgroundAlpha = 0.3;
            };
            this.width = 220;
            this.height = 95;
            this.styleName = "RoundedGradientBorder";
            this.addEventListener("creationComplete", ___JuHuaSuanOneCanvas_SimpleCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            JuHuaSuanOneCanvas._watcherSetupUtil = _arg_1;
        }


        public function __btn_click(_arg_1:MouseEvent):void
        {
            clickBtn();
        }

        public function set infoLab(_arg_1:Label):void
        {
            var _local_2:Object = this._1945394687infoLab;
            if (_local_2 !== _arg_1)
            {
                this._1945394687infoLab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "infoLab", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:JuHuaSuanOneCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _JuHuaSuanOneCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_JuHuaSuanOneCanvasWatcherSetupUtil");
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

        public function ___JuHuaSuanOneCanvas_SimpleCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initData();
        }

        [Bindable(event="propertyChange")]
        public function get leftDay():Label
        {
            return (this._55417365leftDay);
        }

        [Bindable(event="propertyChange")]
        public function get item():ItemSlot
        {
            return (this._3242771item);
        }

        public function set leftDay(_arg_1:Label):void
        {
            var _local_2:Object = this._55417365leftDay;
            if (_local_2 !== _arg_1)
            {
                this._55417365leftDay = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "leftDay", _local_2, _arg_1));
            };
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
            var bagPanel:BagPanel;
            var goldLockFlag:Boolean;
            var str:String;
            var view:Object;
            var buyPanel:* = undefined;
            var gfunc:Function;
            var obj:Object;
            var totalPt:Number;
            var i:* = undefined;
            if (!_isHad)
            {
                return;
            };
            if (_isHad == 1)
            {
                bagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
                goldLockFlag = bagPanel.goldLockFlag;
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
                str = "";
                if (_isRenRen)
                {
                    str = (str + Language.JUHUASUAN_PANEL[6].replace("{point}", Math.floor((_pt / 10))).replace("{name}", _lab).replace("{day}", _day).replace(Language.JUHUASUAN_PANEL[13], Language.JUHUASUAN_PANEL[12]));
                }
                else
                {
                    str = (str + Language.JUHUASUAN_PANEL[6].replace("{point}", _pt).replace("{name}", _lab).replace("{day}", _day));
                };
                view = _core.view.getUI(ViewManager.PANEL_JUHUASUAN);
                if (view)
                {
                    obj = view.getLeftJuHuaSuan();
                    if (obj)
                    {
                        totalPt = 0;
                        for (i in obj)
                        {
                            totalPt = ToolKit.add(totalPt, obj[i]);
                        };
                        if (((!(totalPt)) || (!(ToolKit.isEqual(totalPt, 0)))))
                        {
                            if (ToolKit.isSmallOrEqual(totalPt, 0))
                            {
                                str = (str + Language.JUHUASUAN_PANEL[14]);
                            }
                            else
                            {
                                if (_isRenRen)
                                {
                                    str = (str + Language.JUHUASUAN_PANEL[9].replace("{point}", Math.floor((totalPt / 10))).replace(Language.JUHUASUAN_PANEL[13], Language.JUHUASUAN_PANEL[12]));
                                }
                                else
                                {
                                    str = (str + Language.JUHUASUAN_PANEL[9].replace("{point}", totalPt));
                                };
                            };
                        };
                    };
                };
                buyPanel = _core.view.getUI(ViewManager.PANEL_JUHUASUAN_ALERT);
                if (buyPanel)
                {
                    buyPanel.iid = _iid;
                    buyPanel.str = str;
                    buyPanel.showPanel();
                };
            }
            else
            {
                if (_isHad == 2)
                {
                    _core.remote.call("getJuHuaSuanOne", null, _iid);
                };
            };
        }

        private function getServerTime():Number
        {
            return ((new Date().getTime() + _core.timeLag) + TimeUtil.timeOSOffSet);
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

        public function set item(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3242771item;
            if (_local_2 !== _arg_1)
            {
                this._3242771item = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item", _local_2, _arg_1));
            };
        }

        public function setLeftDay2(_arg_1:Number, _arg_2:String):void
        {
            setLeftDay(_day, _arg_1, _arg_2);
        }

        private function doUnlockMoneyGold(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                setGoldLock(false);
            };
        }

        public function setLeftDay(_arg_1:Number, _arg_2:Number, _arg_3:String):void
        {
            var _local_4:Number;
            var _local_5:*;
            var _local_6:String;
            _day = _arg_1;
            _bt = _arg_2;
            _ht = _arg_3;
            if (initialized)
            {
                btn.enabled = true;
                if (!_arg_2)
                {
                    btn.label = Language.JUHUASUAN_PANEL[3];
                    leftDay.text = Language.JUHUASUAN_PANEL[2].replace("{day}", _arg_1);
                    _isHad = 1;
                    return;
                };
                _local_4 = Math.floor((ToolKit.minus(getServerTime(), _arg_2) / ((24 * 60) * 60000)));
                _local_5 = ((ToolKit.minus(_arg_1, _local_4) >= 0) ? ToolKit.minus(_arg_1, _local_4) : 0);
                leftDay.text = Language.JUHUASUAN_PANEL[2].replace("{day}", _local_5);
                _isHad = 2;
                btn.label = Language.JUHUASUAN_PANEL[4];
                _local_6 = TimeUtil.getTimeStr4("day", getServerTime());
                if (((_arg_3) && (_arg_3 == _local_6)))
                {
                    btn.label = Language.JUHUASUAN_PANEL[5];
                    _isHad = 3;
                    btn.enabled = false;
                };
            };
        }

        public function set isRR(_arg_1:Boolean):void
        {
            _isRenRen = _arg_1;
        }

        private function initData():void
        {
            if (_isRenRen)
            {
                this.isRR = _isRenRen;
            };
            if (_pt)
            {
                this.Point = _pt;
            };
            if (_lab)
            {
                this.Lab = _lab;
            };
            if (_iid)
            {
                this.ItemData = _iid;
            };
            if (_day)
            {
                this.setLeftDay(_day, _bt, _ht);
            };
            this.x = 8;
        }

        [Bindable(event="propertyChange")]
        public function get btn():Button
        {
            return (this._97884btn);
        }

        public function set Lab(_arg_1:String):void
        {
            _lab = _arg_1;
            if (initialized)
            {
                infoLab.htmlText = _arg_1;
            };
        }

        public function set ptLab(_arg_1:Label):void
        {
            var _local_2:Object = this._106966249ptLab;
            if (_local_2 !== _arg_1)
            {
                this._106966249ptLab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ptLab", _local_2, _arg_1));
            };
        }

        public function set Point(_arg_1:Number):void
        {
            _pt = _arg_1;
            if (initialized)
            {
                if (_isRenRen)
                {
                    ptLab.text = Language.JUHUASUAN_PANEL[1].replace("{num}", Math.floor((_pt / 10))).replace(Language.JUHUASUAN_PANEL[13], Language.JUHUASUAN_PANEL[12]);
                }
                else
                {
                    ptLab.text = Language.JUHUASUAN_PANEL[1].replace("{num}", _pt);
                };
            };
        }

        public function get Point():Number
        {
            return (_pt);
        }

        private function _JuHuaSuanOneCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = ResManager.getIconUrl(4130220000502);
        }

        private function _JuHuaSuanOneCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000502));
            }, function (_arg_1:Object):void
            {
                _JuHuaSuanOneCanvas_Image1.source = _arg_1;
            }, "_JuHuaSuanOneCanvas_Image1.source");
            result[0] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get ptLab():Label
        {
            return (this._106966249ptLab);
        }

        public function set ItemData(_arg_1:Number):void
        {
            _iid = _arg_1;
            if (initialized)
            {
                item.type = GamePredef.TBL_ITEM_TEMPLATE;
                item.giid = _arg_1;
                item.slotData = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_arg_1];
            };
        }

        [Bindable(event="propertyChange")]
        public function get infoLab():Label
        {
            return (this._1945394687infoLab);
        }


    }
}//package com.qeedoo.ui.view.comp

