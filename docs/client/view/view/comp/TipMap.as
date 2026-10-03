// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.TipMap

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.Canvas;
    import mx.controls.Label;
    import mx.controls.Text;
    import mx.controls.Button;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.vo.ToolTipVO;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
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

    public class TipMap extends BasicToolTip implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _277763378creCanvas:Canvas;
        public var _TipMap_Label2:Label;
        public var _TipMap_Text1:Text;
        public var _TipMap_TipMapSlot1:TipMapSlot;
        public var _TipMap_TipMapSlot2:TipMapSlot;
        public var _TipMap_TipMapSlot3:TipMapSlot;
        public var _TipMap_TipMapSlot4:TipMapSlot;
        public var _TipMap_Button1:Button;
        public var _TipMap_Label1:Label;
        public var _TipMap_Label3:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":BasicToolTip,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":235,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Label,
                        "id":"_TipMap_Label1",
                        "stylesFactory":function ():void
                        {
                            this.color = 12515583;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":6,
                                "text":"地图名称"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Text,
                        "id":"_TipMap_Text1",
                        "stylesFactory":function ():void
                        {
                            this.color = 16772789;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":43,
                                "text":"地图说明",
                                "width":206,
                                "height":66
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"_TipMap_Button1",
                        "events":{"click":"___TipMap_Button1_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "5";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":5,
                                "styleName":"BtnToolTipClose",
                                "width":15,
                                "height":15
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_TipMap_Label2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":23,
                                "text":"等级:"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_TipMap_Label3",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "right";
                            this.color = 3912446;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":108,
                                "y":23,
                                "text":"类型:安全",
                                "width":52
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"creCanvas",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":100,
                                "width":228,
                                "height":53,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":TipMapSlot,
                                    "id":"_TipMap_TipMapSlot1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":3,
                                            "y":0,
                                            "width":50,
                                            "height":50,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":TipMapSlot,
                                    "id":"_TipMap_TipMapSlot2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":60,
                                            "y":0,
                                            "width":50,
                                            "height":50,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":TipMapSlot,
                                    "id":"_TipMap_TipMapSlot3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":118,
                                            "y":0,
                                            "width":50,
                                            "height":50,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":TipMapSlot,
                                    "id":"_TipMap_TipMapSlot4",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":174,
                                            "y":0,
                                            "width":50,
                                            "height":50,
                                            "movable":false
                                        });
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        private var _3769vo:ToolTipVO = new ToolTipVO();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TipMap()
        {
            mx_internal::_document = this;
            this.width = 235;
            this.styleName = "CanvasToolTip";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TipMap._watcherSetupUtil = _arg_1;
        }


        private function set vo(_arg_1:ToolTipVO):void
        {
            var _local_2:Object = this._3769vo;
            if (_local_2 !== _arg_1)
            {
                this._3769vo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vo", _local_2, _arg_1));
            };
        }

        private function _TipMap_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = vo.name;
            _local_1 = vo.description;
            _local_1 = vo.btnVisible;
            _local_1 = Language.TIPMAP_S[2].toString().replace("{level}", vo.level);
            _local_1 = vo.type;
            _local_1 = vo.costVisible;
            _local_1 = vo.costVisible;
            _local_1 = GamePredef.TBL_CREATURE;
            _local_1 = vo.cre1;
            _local_1 = GamePredef.TBL_CREATURE;
            _local_1 = vo.cre2;
            _local_1 = GamePredef.TBL_CREATURE;
            _local_1 = vo.cre3;
            _local_1 = GamePredef.TBL_CREATURE;
            _local_1 = vo.cre4;
        }

        public function ___TipMap_Button1_click(_arg_1:MouseEvent):void
        {
            visible = false;
        }

        override public function initialize():void
        {
            var target:TipMap;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TipMap_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_TipMapWatcherSetupUtil");
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

        public function set creCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object = this._277763378creCanvas;
            if (_local_2 !== _arg_1)
            {
                this._277763378creCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "creCanvas", _local_2, _arg_1));
            };
        }

        public function showMap(_arg_1:int=-1):void
        {
            var _local_4:Object;
            var _local_5:Boolean;
            var _local_6:int;
            var _local_2:Object = GameData.d[GamePredef.TBL_MAP][_arg_1];
            super.show(_local_2);
            vo.name = _local_2.name;
            vo.description = _local_2.info;
            vo.level = _local_2.level;
            vo.type = ((_local_2.safeFlag > 0) ? Language.TIPMAP_S[0] : Language.TIPMAP_S[1]);
            vo.costVisible = (!(Boolean((_local_2.safeFlag > 0))));
            vo.btnVisible = true;
            var _local_3:int = 1;
            for (_local_4 in GameData.d[GamePredef.TBL_MAP_CREATURE])
            {
                if ((((GameData.d[GamePredef.TBL_MAP_CREATURE][_local_4]) && (GameData.d[GamePredef.TBL_MAP_CREATURE][_local_4].mid == _arg_1)) && (GameData.d[GamePredef.TBL_MAP_CREATURE][_local_4].bossFlag == 0)))
                {
                    _local_5 = true;
                    _local_6 = 1;
                    while (_local_6 < _local_3)
                    {
                        if (((vo[("cre" + _local_6)]) && (vo[("cre" + _local_6)] == Number(GameData.d[GamePredef.TBL_MAP_CREATURE][_local_4].cid))))
                        {
                            _local_5 = false;
                            break;
                        };
                        _local_6++;
                    };
                    if (_local_5)
                    {
                        vo[("cre" + _local_3)] = Number(GameData.d[GamePredef.TBL_MAP_CREATURE][_local_4].cid);
                        _local_3++;
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get creCanvas():Canvas
        {
            return (this._277763378creCanvas);
        }

        private function _TipMap_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.name;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipMap_Label1.htmlText = _arg_1;
            }, "_TipMap_Label1.htmlText");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.description;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipMap_Text1.htmlText = _arg_1;
            }, "_TipMap_Text1.htmlText");
            result[1] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (vo.btnVisible);
            }, function (_arg_1:Boolean):void
            {
                _TipMap_Button1.visible = _arg_1;
            }, "_TipMap_Button1.visible");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPMAP_S[2].toString().replace("{level}", vo.level);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipMap_Label2.htmlText = _arg_1;
            }, "_TipMap_Label2.htmlText");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.type;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipMap_Label3.htmlText = _arg_1;
            }, "_TipMap_Label3.htmlText");
            result[4] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (vo.costVisible);
            }, function (_arg_1:Boolean):void
            {
                creCanvas.visible = _arg_1;
            }, "creCanvas.visible");
            result[5] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (vo.costVisible);
            }, function (_arg_1:Boolean):void
            {
                creCanvas.includeInLayout = _arg_1;
            }, "creCanvas.includeInLayout");
            result[6] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_CREATURE);
            }, function (_arg_1:int):void
            {
                _TipMap_TipMapSlot1.type = _arg_1;
            }, "_TipMap_TipMapSlot1.type");
            result[7] = binding;
            binding = new Binding(this, function ():Number
            {
                return (vo.cre1);
            }, function (_arg_1:Number):void
            {
                _TipMap_TipMapSlot1.giid = _arg_1;
            }, "_TipMap_TipMapSlot1.giid");
            result[8] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_CREATURE);
            }, function (_arg_1:int):void
            {
                _TipMap_TipMapSlot2.type = _arg_1;
            }, "_TipMap_TipMapSlot2.type");
            result[9] = binding;
            binding = new Binding(this, function ():Number
            {
                return (vo.cre2);
            }, function (_arg_1:Number):void
            {
                _TipMap_TipMapSlot2.giid = _arg_1;
            }, "_TipMap_TipMapSlot2.giid");
            result[10] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_CREATURE);
            }, function (_arg_1:int):void
            {
                _TipMap_TipMapSlot3.type = _arg_1;
            }, "_TipMap_TipMapSlot3.type");
            result[11] = binding;
            binding = new Binding(this, function ():Number
            {
                return (vo.cre3);
            }, function (_arg_1:Number):void
            {
                _TipMap_TipMapSlot3.giid = _arg_1;
            }, "_TipMap_TipMapSlot3.giid");
            result[12] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_CREATURE);
            }, function (_arg_1:int):void
            {
                _TipMap_TipMapSlot4.type = _arg_1;
            }, "_TipMap_TipMapSlot4.type");
            result[13] = binding;
            binding = new Binding(this, function ():Number
            {
                return (vo.cre4);
            }, function (_arg_1:Number):void
            {
                _TipMap_TipMapSlot4.giid = _arg_1;
            }, "_TipMap_TipMapSlot4.giid");
            result[14] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        private function get vo():ToolTipVO
        {
            return (this._3769vo);
        }


    }
}//package com.qeedoo.ui.view.comp

