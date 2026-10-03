// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.TipStarReq

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.core.IToolTip;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Text;
    import mx.core.UIComponentDescriptor;
    import mx.containers.VBox;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.ResizeEvent;
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

    public class TipStarReq extends BasicToolTip implements IBindingClient, IToolTip 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1288349932txt_starName:Text;
        private var _429905214reqMoney:String;
        private var _458435979txt_reqLevel:Text;
        private var _1094713483reqTime:String;
        private var _1315666941starName:String;
        private var _153113279txt_reqStar:Text;
        private var _165871276reqStarLevel:String;
        private var _457222223txt_reqMoney:Text;
        private var _431118970reqLevel:String;
        private var _1834909674effDesc:String;
        private var _153093700txt_reqTime:Text;
        private var _483072605nextEffDesc:String;
        private var _934531937reqExp:String;
        private var _599242019txt_nextEff:Text;
        private var _2135048057txt_effct:Text;
        private var _878185905txt_req:Text;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":BasicToolTip,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":VBox,
                        "stylesFactory":function ():void
                        {
                            this.verticalGap = 0;
                            this.paddingLeft = 5;
                            this.paddingRight = 5;
                            this.paddingTop = 5;
                            this.paddingBottom = 5;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":0,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"txt_starName",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 16407301;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"白羊座"});
                                    }
                                }), new UIComponentDescriptor({"type":Text}), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"txt_effct",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"星座效果"});
                                    }
                                }), new UIComponentDescriptor({"type":Text}), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"txt_req"
                                }), new UIComponentDescriptor({"type":Text}), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"txt_nextEff",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"下级效果"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"txt_reqStar",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"需求星座等级"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"txt_reqLevel",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"需求人物等级"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"txt_reqMoney",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"需求升级银子"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"txt_reqTime",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"需求升级时间"});
                                    }
                                })]
                            });
                        }
                    })]});
            }
        });
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TipStarReq()
        {
            mx_internal::_document = this;
            this.styleName = "CanvasToolTip";
            this.addEventListener("resize", ___TipStarReq_BasicToolTip1_resize);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TipStarReq._watcherSetupUtil = _arg_1;
        }


        public function set txt_reqStar(_arg_1:Text):void
        {
            var _local_2:Object = this._153113279txt_reqStar;
            if (_local_2 !== _arg_1)
            {
                this._153113279txt_reqStar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txt_reqStar", _local_2, _arg_1));
            };
        }

        private function set reqMoney(_arg_1:String):void
        {
            var _local_2:Object = this._429905214reqMoney;
            if (_local_2 !== _arg_1)
            {
                this._429905214reqMoney = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "reqMoney", _local_2, _arg_1));
            };
        }

        public function set object(_arg_1:Object):void
        {
            var _local_4:*;
            var _local_5:Object;
            if (!_arg_1)
            {
                return;
            };
            starName = (_arg_1.name + Language.STAR_REQ_TIP_U[5].toString().replace("{num}", _arg_1.level));
            reqStarLevel = ((Language.STAR_REQ_TIP_U[0] + "：") + _arg_1.reqStarLevel);
            reqExp = ((Language.STAR_REQ_TIP_U[1] + "：") + _arg_1.reqExp);
            reqLevel = ((Language.STAR_REQ_TIP_U[2] + "：") + _arg_1.reqLevel);
            reqMoney = ((Language.STAR_REQ_TIP_U[3] + "：") + _arg_1.reqMoney);
            effDesc = (Language.CHARACTORPANEL_U[51] + Language.CHARACTORPANEL_U[57].toString().replace("{prop}", GamePredef.STAR_PROP_DIC[_arg_1.type]).replace("{value}", _arg_1.addValue1));
            nextEffDesc = (Language.CHARACTORPANEL_U[51] + Language.CHARACTORPANEL_U[57].toString().replace("{prop}", GamePredef.STAR_PROP_DIC[_arg_1.type]).replace("{value}", _arg_1.addValue2));
            if (((_arg_1.type == 8) || (_arg_1.type == 11)))
            {
                effDesc = (effDesc + "%");
                nextEffDesc = (nextEffDesc + "%");
            };
            reqTime = ((Language.STAR_REQ_TIP_U[6] + "：") + _arg_1.reqTime);
            var _local_2:Number = 0;
            var _local_3:Object = _core.player.starsData;
            for each (_local_4 in _local_3)
            {
                _local_5 = GameData.d[GamePredef.TBL_STARS_TEMPLATE][_local_4.tid];
                if (_local_5)
                {
                    _local_2 = (_local_2 + parseInt(_local_5.level));
                };
            };
            if (_local_2 < _arg_1.reqStarLevel)
            {
                txt_reqStar.setStyle("color", "#f90303");
            }
            else
            {
                txt_reqStar.setStyle("color", "#e3f236");
            };
            if (_core.player.level < _arg_1.reqLevel)
            {
                txt_reqLevel.setStyle("color", "#f90303");
            }
            else
            {
                txt_reqLevel.setStyle("color", "#e3f236");
            };
            if ((((_core.player.money < Number(_arg_1.reqMoney)) && (2 == GamePredef.GLOBAL_SETTING.defaultMoney)) || ((_core.player.moneyBind < Number(_arg_1.reqMoney)) && (1 == GamePredef.GLOBAL_SETTING.defaultMoney))))
            {
                txt_reqMoney.setStyle("color", "#f90303");
            }
            else
            {
                txt_reqMoney.setStyle("color", "#e3f236");
            };
            txt_nextEff.setStyle("color", "#e3f236");
            txt_req.setStyle("color", "#e3f236");
            txt_reqTime.setStyle("color", "#e3f236");
        }

        [Bindable(event="propertyChange")]
        private function get reqLevel():String
        {
            return (this._431118970reqLevel);
        }

        [Bindable(event="propertyChange")]
        public function get txt_effct():Text
        {
            return (this._2135048057txt_effct);
        }

        [Bindable(event="propertyChange")]
        private function get reqTime():String
        {
            return (this._1094713483reqTime);
        }

        public function set txt_effct(_arg_1:Text):void
        {
            var _local_2:Object = this._2135048057txt_effct;
            if (_local_2 !== _arg_1)
            {
                this._2135048057txt_effct = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txt_effct", _local_2, _arg_1));
            };
        }

        private function set reqLevel(_arg_1:String):void
        {
            var _local_2:Object = this._431118970reqLevel;
            if (_local_2 !== _arg_1)
            {
                this._431118970reqLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "reqLevel", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:TipStarReq;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TipStarReq_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_TipStarReqWatcherSetupUtil");
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
        private function get effDesc():String
        {
            return (this._1834909674effDesc);
        }

        public function set txt_req(_arg_1:Text):void
        {
            var _local_2:Object = this._878185905txt_req;
            if (_local_2 !== _arg_1)
            {
                this._878185905txt_req = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txt_req", _local_2, _arg_1));
            };
        }

        private function _TipStarReq_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = starName;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                txt_starName.htmlText = _arg_1;
            }, "txt_starName.htmlText");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = effDesc;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                txt_effct.htmlText = _arg_1;
            }, "txt_effct.htmlText");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.STAR_REQ_TIP_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                txt_req.htmlText = _arg_1;
            }, "txt_req.htmlText");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = nextEffDesc;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                txt_nextEff.htmlText = _arg_1;
            }, "txt_nextEff.htmlText");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = reqStarLevel;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                txt_reqStar.htmlText = _arg_1;
            }, "txt_reqStar.htmlText");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = reqLevel;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                txt_reqLevel.htmlText = _arg_1;
            }, "txt_reqLevel.htmlText");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = reqMoney;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                txt_reqMoney.htmlText = _arg_1;
            }, "txt_reqMoney.htmlText");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = reqTime;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                txt_reqTime.htmlText = _arg_1;
            }, "txt_reqTime.htmlText");
            result[7] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get txt_nextEff():Text
        {
            return (this._599242019txt_nextEff);
        }

        private function set reqTime(_arg_1:String):void
        {
            var _local_2:Object = this._1094713483reqTime;
            if (_local_2 !== _arg_1)
            {
                this._1094713483reqTime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "reqTime", _local_2, _arg_1));
            };
        }

        private function set reqStarLevel(_arg_1:String):void
        {
            var _local_2:Object = this._165871276reqStarLevel;
            if (_local_2 !== _arg_1)
            {
                this._165871276reqStarLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "reqStarLevel", _local_2, _arg_1));
            };
        }

        public function ___TipStarReq_BasicToolTip1_resize(_arg_1:ResizeEvent):void
        {
            setPos();
        }

        [Bindable(event="propertyChange")]
        private function get reqExp():String
        {
            return (this._934531937reqExp);
        }

        [Bindable(event="propertyChange")]
        public function get txt_reqMoney():Text
        {
            return (this._457222223txt_reqMoney);
        }

        [Bindable(event="propertyChange")]
        private function get nextEffDesc():String
        {
            return (this._483072605nextEffDesc);
        }

        [Bindable(event="propertyChange")]
        private function get starName():String
        {
            return (this._1315666941starName);
        }

        private function set effDesc(_arg_1:String):void
        {
            var _local_2:Object = this._1834909674effDesc;
            if (_local_2 !== _arg_1)
            {
                this._1834909674effDesc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "effDesc", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get txt_reqStar():Text
        {
            return (this._153113279txt_reqStar);
        }

        [Bindable(event="propertyChange")]
        private function get reqMoney():String
        {
            return (this._429905214reqMoney);
        }

        [Bindable(event="propertyChange")]
        public function get txt_reqTime():Text
        {
            return (this._153093700txt_reqTime);
        }

        private function set reqExp(_arg_1:String):void
        {
            var _local_2:Object = this._934531937reqExp;
            if (_local_2 !== _arg_1)
            {
                this._934531937reqExp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "reqExp", _local_2, _arg_1));
            };
        }

        public function set txt_nextEff(_arg_1:Text):void
        {
            var _local_2:Object = this._599242019txt_nextEff;
            if (_local_2 !== _arg_1)
            {
                this._599242019txt_nextEff = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txt_nextEff", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get txt_req():Text
        {
            return (this._878185905txt_req);
        }

        [Bindable(event="propertyChange")]
        private function get reqStarLevel():String
        {
            return (this._165871276reqStarLevel);
        }

        private function set nextEffDesc(_arg_1:String):void
        {
            var _local_2:Object = this._483072605nextEffDesc;
            if (_local_2 !== _arg_1)
            {
                this._483072605nextEffDesc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextEffDesc", _local_2, _arg_1));
            };
        }

        public function set txt_starName(_arg_1:Text):void
        {
            var _local_2:Object = this._1288349932txt_starName;
            if (_local_2 !== _arg_1)
            {
                this._1288349932txt_starName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txt_starName", _local_2, _arg_1));
            };
        }

        public function set txt_reqMoney(_arg_1:Text):void
        {
            var _local_2:Object = this._457222223txt_reqMoney;
            if (_local_2 !== _arg_1)
            {
                this._457222223txt_reqMoney = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txt_reqMoney", _local_2, _arg_1));
            };
        }

        private function _TipStarReq_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = starName;
            _local_1 = effDesc;
            _local_1 = Language.STAR_REQ_TIP_U[4];
            _local_1 = nextEffDesc;
            _local_1 = reqStarLevel;
            _local_1 = reqLevel;
            _local_1 = reqMoney;
            _local_1 = reqTime;
        }

        public function set txt_reqLevel(_arg_1:Text):void
        {
            var _local_2:Object = this._458435979txt_reqLevel;
            if (_local_2 !== _arg_1)
            {
                this._458435979txt_reqLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txt_reqLevel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get txt_reqLevel():Text
        {
            return (this._458435979txt_reqLevel);
        }

        public function set txt_reqTime(_arg_1:Text):void
        {
            var _local_2:Object = this._153093700txt_reqTime;
            if (_local_2 !== _arg_1)
            {
                this._153093700txt_reqTime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txt_reqTime", _local_2, _arg_1));
            };
        }

        private function set starName(_arg_1:String):void
        {
            var _local_2:Object = this._1315666941starName;
            if (_local_2 !== _arg_1)
            {
                this._1315666941starName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starName", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get txt_starName():Text
        {
            return (this._1288349932txt_starName);
        }

        override public function show(_arg_1:Object=null):void
        {
            setPos();
            this.visible = true;
        }


    }
}//package com.qeedoo.ui.view.comp

