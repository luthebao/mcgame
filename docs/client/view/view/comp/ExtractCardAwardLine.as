// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.ExtractCardAwardLine

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import flash.events.MouseEvent;
    import mx.events.FlexEvent;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.ui.view.compDragable.ExtractCardActivity;
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

    public class ExtractCardAwardLine extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _55432362leftStr:Label;
        public var lvl:int = -1;
        private var _obj:Object = null;
        private var _455921717getAwardBtn:BasicDelayButton;
        private var _691653267protectSlot:ItemSlot;
        private var _1177331774itemName:Label;
        private var tips:String = "";
        private var awardId:int = 0;
        public var awardNum:int = 1;
        private var charactors:Object = null;
        public var leftNum:int = -1;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":200,
                    "height":100,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"protectSlot",
                        "stylesFactory":function ():void
                        {
                            this.left = "20";
                            this.verticalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"movable":false});
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"itemName",
                        "stylesFactory":function ():void
                        {
                            this.verticalCenter = "0";
                            this.left = "60";
                            this.textAlign = "left";
                            this.color = 0xFFFF00;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"width":200});
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"leftStr",
                        "stylesFactory":function ():void
                        {
                            this.verticalCenter = "20";
                            this.left = "60";
                            this.textAlign = "left";
                            this.color = 0xFFFF00;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"width":200});
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicDelayButton,
                        "id":"getAwardBtn",
                        "events":{"click":"__getAwardBtn_click"},
                        "stylesFactory":function ():void
                        {
                            this.left = "20";
                            this.bottom = "5";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnNormalBlue",
                                "visible":true,
                                "width":35,
                                "height":20
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

        public function ExtractCardAwardLine()
        {
            mx_internal::_document = this;
            this.width = 200;
            this.height = 100;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ExtractCardAwardLine._watcherSetupUtil = _arg_1;
        }


        public function refreshNumber(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:Object;
            if (!_arg_1)
            {
                return;
            };
            for (_local_2 in _arg_1)
            {
                _local_3 = _arg_1[_local_2];
                if ((((_local_3) && (_obj)) && (_local_3.awardId == _obj.awardId)))
                {
                    refresh(_local_3);
                    return;
                };
            };
        }

        override public function initialize():void
        {
            var target:ExtractCardAwardLine;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ExtractCardAwardLine_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_ExtractCardAwardLineWatcherSetupUtil");
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

        private function _ExtractCardAwardLine_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                protectSlot.slotType = _arg_1;
            }, "protectSlot.slotType");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXTRACT_CARD_PANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                getAwardBtn.label = _arg_1;
            }, "getAwardBtn.label");
            result[1] = binding;
            return (result);
        }

        private function _ExtractCardAwardLine_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Language.EXTRACT_CARD_PANEL_U[8];
        }

        [Bindable(event="propertyChange")]
        public function get protectSlot():ItemSlot
        {
            return (this._691653267protectSlot);
        }

        public function init():void
        {
        }

        public function __getAwardBtn_click(_arg_1:MouseEvent):void
        {
            getAward();
        }

        private function getAward():void
        {
            if (_obj)
            {
                _core.remote.call("extractCardActivityGetAward", null, lvl, _obj.awardId);
            };
        }

        [Bindable(event="propertyChange")]
        public function get leftStr():Label
        {
            return (this._55432362leftStr);
        }

        [Bindable(event="propertyChange")]
        public function get getAwardBtn():BasicDelayButton
        {
            return (this._455921717getAwardBtn);
        }

        [Bindable(event="propertyChange")]
        public function get itemName():Label
        {
            return (this._1177331774itemName);
        }

        public function completeHandler(_arg_1:FlexEvent):void
        {
            _arg_1.currentTarget.removeEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
            refresh(_obj);
        }

        public function set leftStr(_arg_1:Label):void
        {
            var _local_2:Object = this._55432362leftStr;
            if (_local_2 !== _arg_1)
            {
                this._55432362leftStr = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "leftStr", _local_2, _arg_1));
            };
        }

        public function refresh(_arg_1:Object):void
        {
            _obj = _arg_1;
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            if (!_arg_1)
            {
                return;
            };
            tips = _arg_1.tips;
            awardId = _arg_1.award;
            awardNum = _arg_1.awardNum;
            if (int(_arg_1.limit) == 0)
            {
                leftNum = -1;
            }
            else
            {
                if (((!(_arg_1.date)) || (!(ExtractCardActivity.EXTRACT_DATE == _arg_1.date))))
                {
                    leftNum = int(_arg_1.limit);
                }
                else
                {
                    if (_arg_1.dbuy)
                    {
                        leftNum = (int(_arg_1.limit) - int(_arg_1.dbuy));
                    }
                    else
                    {
                        leftNum = int(_arg_1.limit);
                    };
                    if (leftNum < 0)
                    {
                        leftNum = 0;
                    };
                };
            };
            charactors = _arg_1;
            refreshProtect();
        }

        public function set protectSlot(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._691653267protectSlot;
            if (_local_2 !== _arg_1)
            {
                this._691653267protectSlot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "protectSlot", _local_2, _arg_1));
            };
        }

        public function set getAwardBtn(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._455921717getAwardBtn;
            if (_local_2 !== _arg_1)
            {
                this._455921717getAwardBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "getAwardBtn", _local_2, _arg_1));
            };
        }

        private function refreshProtect():void
        {
            this["protectSlot"].type = GamePredef.TBL_ITEM_TEMPLATE;
            this["protectSlot"].giid = awardId;
            this["protectSlot"].enabled = true;
            this["protectSlot"].acceptable = false;
            getAwardBtn.toolTip = tips;
            var _local_1:Object = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][awardId];
            if (_local_1)
            {
                itemName.text = ((_local_1.name + "*") + awardNum);
                if (leftNum == -1)
                {
                    leftStr.text = (Language.EXTRACT_CARD_PANEL_U[15] + Language.EXTRACT_CARD_PANEL_U[16]);
                }
                else
                {
                    if (leftNum == 0)
                    {
                        leftStr.text = (Language.EXTRACT_CARD_PANEL_U[15] + Language.EXTRACT_CARD_PANEL_U[17]);
                    }
                    else
                    {
                        leftStr.text = (Language.EXTRACT_CARD_PANEL_U[15] + leftNum);
                    };
                };
            };
        }

        public function set itemName(_arg_1:Label):void
        {
            var _local_2:Object = this._1177331774itemName;
            if (_local_2 !== _arg_1)
            {
                this._1177331774itemName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemName", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.comp

