// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.StoneToGoldActPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import mx.containers.Canvas;
    import mx.controls.Label;
    import mx.controls.LinkButton;
    import mx.controls.Alert;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.Button;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import mx.managers.PopUpManager;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.ui.resource.ResManager;
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

    public class StoneToGoldActPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _StoneToGoldActPanel_Image1:Image;
        private var itemRuleStr:String = "";
        private var _1524564555itemCanvas:Canvas;
        private var _1110417474label2:Label;
        public var _StoneToGoldActPanel_LinkButton1:LinkButton;
        private var _helpAlert:Alert;
        private var _2001055442numPay0:Image;
        private var _2001055441numPay1:Image;
        public var _StoneToGoldActPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1874406054imgLuckyBox:Image;
        private var _566106333btnGetAward:Button;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":450,
                    "height":250,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_StoneToGoldActPanel_BasicTitleCanvas1",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 14;
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"_StoneToGoldActPanel_Image1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":6,
                                "y":33,
                                "width":440,
                                "height":212
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":LinkButton,
                        "id":"_StoneToGoldActPanel_LinkButton1",
                        "events":{"click":"___StoneToGoldActPanel_LinkButton1_click"},
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "right";
                            this.color = 0xFFD700;
                            this.textDecoration = "underline";
                            this.fontSize = 12;
                            this.fontWeight = "normal";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":75,
                                "height":20,
                                "x":350,
                                "y":32,
                                "label":"玩法说明"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"numPay0",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":117,
                                "y":59,
                                "width":21,
                                "height":27
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"numPay1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":138,
                                "y":59,
                                "width":21,
                                "height":27
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"itemCanvas",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":25,
                                "y":89,
                                "width":180,
                                "height":100,
                                "styleName":"CanvasBorder"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":246,
                                "y":89,
                                "width":180,
                                "height":100,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"imgLuckyBox",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0,
                                            "y":0,
                                            "width":180,
                                            "height":100
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"label2",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFD700;
                            this.fontSize = 12;
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":175,
                                "y":187,
                                "width":100
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"btnGetAward",
                        "events":{"click":"__btnGetAward_click"},
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"stoneToGoldBtn",
                                "x":175,
                                "y":204,
                                "width":100,
                                "height":40
                            });
                        }
                    })]
                });
            }
        });
        private var StoneToGoldActConf:Object = {};
        private var StoneToGoldActData:Object = {};
        private var _core:Core = Core.getInstance();
        private var iidObj:Object = {};
        private var numberArr:Array = [4130220000942, 4130220000943, 4130220000944, 4130220000945, 4130220000946, 4130220000947, 4130220000948, 4130220000949, 4130220000950, 4130220000951];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function StoneToGoldActPanel()
        {
            mx_internal::_document = this;
            this.width = 450;
            this.height = 250;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
            this.x = 103;
            this.y = 102;
            this.addEventListener("creationComplete", ___StoneToGoldActPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            StoneToGoldActPanel._watcherSetupUtil = _arg_1;
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

        public function showPanel():*
        {
            initView();
            visible = true;
        }

        public function __btnGetAward_click(_arg_1:MouseEvent):void
        {
            getAward();
        }

        private function helpInfo():void
        {
            if (_helpAlert)
            {
                PopUpManager.removePopUp(_helpAlert);
                _helpAlert = null;
            };
            var _local_1:String = Language.STONETOGOLDACT[2].toString().replace("{money}", StoneToGoldActConf.needMoney).replace("{itemstr}", itemRuleStr).replace("{num}", StoneToGoldActConf.allNumbers);
            _helpAlert = Alert.show(_local_1, "", Alert.YES);
        }

        override public function initialize():void
        {
            var target:StoneToGoldActPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _StoneToGoldActPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_StoneToGoldActPanelWatcherSetupUtil");
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

        public function set itemCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1524564555itemCanvas;
            if (_local_2 !== _arg_1)
            {
                this._1524564555itemCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemCanvas", _local_2, _arg_1));
            };
        }

        private function getAward():void
        {
            _core.remote.call("getStoneToGoldAward", null);
        }

        private function newOneSolt(_arg_1:Number, _arg_2:Number):void
        {
            var _local_3:ItemSlot = new ItemSlot();
            _local_3.x = _arg_2;
            _local_3.y = 48;
            _local_3.type = GamePredef.TBL_ITEM_TEMPLATE;
            _local_3.giid = iidObj[_arg_1];
            _local_3.slotData = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][iidObj[_arg_1]];
            itemCanvas.addChild(_local_3);
        }

        [Bindable(event="propertyChange")]
        public function get numPay1():Image
        {
            return (this._2001055441numPay1);
        }

        [Bindable(event="propertyChange")]
        public function get imgLuckyBox():Image
        {
            return (this._1874406054imgLuckyBox);
        }

        public function refreshStoneToGoldActData(_arg_1:Object):void
        {
            var _local_7:*;
            if (!_arg_1)
            {
                return;
            };
            StoneToGoldActConf = _arg_1["conf"];
            var _local_2:Number = StoneToGoldActConf.needMoney;
            var _local_3:Number = Math.floor((_local_2 / 10));
            var _local_4:Number = (_local_2 % 10);
            numPay0.source = ResManager.getIconUrl(numberArr[_local_3]);
            numPay1.source = ResManager.getIconUrl(numberArr[_local_4]);
            label2.htmlText = Language.STONETOGOLDACT[3].replace("{num}", StoneToGoldActConf.leftNum.num);
            imgLuckyBox.toolTip = Language.STONETOGOLDACT[4];
            var _local_5:Number = _arg_1["btnFlag"];
            if (_local_5 == 0)
            {
                btnGetAward.enabled = false;
            }
            else
            {
                btnGetAward.enabled = true;
            };
            var _local_6:Number = 0;
            itemRuleStr = "";
            for (_local_7 in StoneToGoldActConf.iInfo)
            {
                if (StoneToGoldActConf.iInfo[_local_7].inc == 1)
                {
                    _local_6++;
                    iidObj[_local_6] = StoneToGoldActConf.iInfo[_local_7].iid;
                    itemRuleStr = (itemRuleStr + (((GameData.d[GamePredef.TBL_ITEM_TEMPLATE][StoneToGoldActConf.iInfo[_local_7].iid].name + "*") + StoneToGoldActConf.iInfo[_local_7].number) + "、"));
                    if (_local_6 >= 3) break;
                };
            };
            itemRuleStr = itemRuleStr.substr(0, (itemRuleStr.length - 1));
            initItemCanvas(_local_6);
        }

        [Bindable(event="propertyChange")]
        public function get numPay0():Image
        {
            return (this._2001055442numPay0);
        }

        [Bindable(event="propertyChange")]
        public function get label2():Label
        {
            return (this._1110417474label2);
        }

        public function ___StoneToGoldActPanel_LinkButton1_click(_arg_1:MouseEvent):void
        {
            helpInfo();
        }

        private function _StoneToGoldActPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.STONETOGOLDACT[0];
            _local_1 = ResManager.getIconUrl(4130220000954);
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = ResManager.getIconUrl(4130220000953);
        }

        [Bindable(event="propertyChange")]
        public function get itemCanvas():Canvas
        {
            return (this._1524564555itemCanvas);
        }

        public function set btnGetAward(_arg_1:Button):void
        {
            var _local_2:Object = this._566106333btnGetAward;
            if (_local_2 !== _arg_1)
            {
                this._566106333btnGetAward = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnGetAward", _local_2, _arg_1));
            };
        }

        public function set imgLuckyBox(_arg_1:Image):void
        {
            var _local_2:Object = this._1874406054imgLuckyBox;
            if (_local_2 !== _arg_1)
            {
                this._1874406054imgLuckyBox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgLuckyBox", _local_2, _arg_1));
            };
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            _core.remote.call("initStoneToGoldActData", null);
        }

        public function set numPay1(_arg_1:Image):void
        {
            var _local_2:Object = this._2001055441numPay1;
            if (_local_2 !== _arg_1)
            {
                this._2001055441numPay1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numPay1", _local_2, _arg_1));
            };
        }

        private function _StoneToGoldActPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.STONETOGOLDACT[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _StoneToGoldActPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_StoneToGoldActPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000954));
            }, function (_arg_1:Object):void
            {
                _StoneToGoldActPanel_Image1.source = _arg_1;
            }, "_StoneToGoldActPanel_Image1.source");
            result[1] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _StoneToGoldActPanel_LinkButton1.setStyle("overSkin", _arg_1);
            }, "_StoneToGoldActPanel_LinkButton1.overSkin");
            result[2] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _StoneToGoldActPanel_LinkButton1.setStyle("upSkin", _arg_1);
            }, "_StoneToGoldActPanel_LinkButton1.upSkin");
            result[3] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _StoneToGoldActPanel_LinkButton1.setStyle("downSkin", _arg_1);
            }, "_StoneToGoldActPanel_LinkButton1.downSkin");
            result[4] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000953));
            }, function (_arg_1:Object):void
            {
                imgLuckyBox.source = _arg_1;
            }, "imgLuckyBox.source");
            result[5] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get btnGetAward():Button
        {
            return (this._566106333btnGetAward);
        }

        public function set numPay0(_arg_1:Image):void
        {
            var _local_2:Object = this._2001055442numPay0;
            if (_local_2 !== _arg_1)
            {
                this._2001055442numPay0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numPay0", _local_2, _arg_1));
            };
        }

        public function ___StoneToGoldActPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        private function initItemCanvas(_arg_1:Number):void
        {
            var _local_2:Image;
            itemCanvas.removeAllChildren();
            _local_2 = new Image();
            _local_2.x = 0;
            _local_2.y = 0;
            _local_2.width = 180;
            _local_2.height = 100;
            _local_2.source = ResManager.getIconUrl(4130220000952);
            itemCanvas.addChild(_local_2);
            if (_arg_1 == 1)
            {
                newOneSolt(1, 75);
            }
            else
            {
                if (_arg_1 == 2)
                {
                    newOneSolt(1, 45);
                    newOneSolt(2, 105);
                }
                else
                {
                    if (_arg_1 == 3)
                    {
                        newOneSolt(1, 15);
                        newOneSolt(2, 75);
                        newOneSolt(3, 135);
                    };
                };
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

