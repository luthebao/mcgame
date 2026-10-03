// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.TipTalent

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.core.IToolTip;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import com.qeedoo.game.data.DataManager;
    import com.qeedoo.game.system.Core;
    import mx.controls.Button;
    import mx.controls.Text;
    import mx.controls.Image;
    import com.qeedoo.game.vo.ToolTipVO;
    import mx.containers.VBox;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.ResizeEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.utils.ToolKit;
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

    public class TipTalent extends BasicToolTip implements IBindingClient, IToolTip 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _2012328149tipName1:Label;
        private var dm:DataManager;
        private var _core:Core;
        private var _2067263007showBtn:Button;
        private var _106934601price:Text;
        private var _2012328150tipName0:Label;
        private var _95474626desc3:Text;
        private var _738251546iconImg0:Image;
        private var _3769vo:ToolTipVO;
        public var _TipTalent_Text1:Text;
        public var _TipTalent_Text2:Text;
        private var _557573430tipContainer0:VBox;
        private var _431118970reqLevel:Text;
        private var _1306552954nextReqStr:Text;
        private var _3079825desc:Text;
        private var obj:Object;
        private var _1848897060nextReqDesc:Text;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":BasicToolTip,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":244,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":VBox,
                        "id":"tipContainer0",
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
                                "width":240,
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "creationPolicy":"all",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":57,
                                            "width":231,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"tipName0",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":45,
                                                        "y":23,
                                                        "text":"完美的什么装备名字[金]"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"tipName1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":45,
                                                        "y":43,
                                                        "text":"完美的什么装备名字[金]"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"iconImg0",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":15,
                                                        "width":32,
                                                        "height":32
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"showBtn",
                                                "events":{"click":"__showBtn_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "5";
                                                    this.top = "5";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "visible":false,
                                                        "styleName":"BtnToolTipClose",
                                                        "width":15,
                                                        "height":15
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_TipTalent_Text1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"勋章属性"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_TipTalent_Text2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"勋章属性"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"nextReqStr",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"可激活回路"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"nextReqDesc",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"可激活回路"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"desc3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"可激活回路"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"reqLevel",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"装备位置: 主手"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"desc",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"等级需求: 123"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"price",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"神器等级: 123"});
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TipTalent()
        {
            mx_internal::_document = this;
            this.styleName = "CanvasToolTip";
            this.width = 244;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
            this.addEventListener("resize", ___TipTalent_BasicToolTip1_resize);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TipTalent._watcherSetupUtil = _arg_1;
        }


        public function set desc3(_arg_1:Text):void
        {
            var _local_2:Object = this._95474626desc3;
            if (_local_2 !== _arg_1)
            {
                this._95474626desc3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "desc3", _local_2, _arg_1));
            };
        }

        public function __showBtn_click(_arg_1:MouseEvent):void
        {
            visible = false;
        }

        override public function initialize():void
        {
            var target:TipTalent;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TipTalent_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_TipTalentWatcherSetupUtil");
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
        public function get desc():Text
        {
            return (this._3079825desc);
        }

        public function set nextReqStr(_arg_1:Text):void
        {
            var _local_2:Object = this._1306552954nextReqStr;
            if (_local_2 !== _arg_1)
            {
                this._1306552954nextReqStr = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextReqStr", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get nextReqStr():Text
        {
            return (this._1306552954nextReqStr);
        }

        [Bindable(event="propertyChange")]
        public function get reqLevel():Text
        {
            return (this._431118970reqLevel);
        }

        [Bindable(event="propertyChange")]
        public function get showBtn():Button
        {
            return (this._2067263007showBtn);
        }

        public function set object(_arg_1:Object):void
        {
            _core = Core.getInstance();
            dm = DataManager.getInstance();
            obj = _arg_1;
            if (!_arg_1.temp)
            {
                return;
            };
            setCommon(_arg_1);
            showBtn.visible = true;
        }

        public function set price(_arg_1:Text):void
        {
            var _local_2:Object = this._106934601price;
            if (_local_2 !== _arg_1)
            {
                this._106934601price = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "price", _local_2, _arg_1));
            };
        }

        public function set tipContainer0(_arg_1:VBox):void
        {
            var _local_2:Object = this._557573430tipContainer0;
            if (_local_2 !== _arg_1)
            {
                this._557573430tipContainer0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tipContainer0", _local_2, _arg_1));
            };
        }

        public function set desc(_arg_1:Text):void
        {
            var _local_2:Object = this._3079825desc;
            if (_local_2 !== _arg_1)
            {
                this._3079825desc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "desc", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tipName0():Label
        {
            return (this._2012328150tipName0);
        }

        public function ___TipTalent_BasicToolTip1_resize(_arg_1:ResizeEvent):void
        {
            setPos();
        }

        private function _TipTalent_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = vo.name;
            _local_1 = vo.level;
            _local_1 = Language.TALENT_TOOLTIP_S[1];
            _local_1 = vo.bProp1;
            _local_1 = Language.TALENT_TOOLTIP_S[2];
            _local_1 = vo.bProp2;
            _local_1 = Language.TALENT_TOOLTIP_S[3];
            _local_1 = vo.reqLevel;
            _local_1 = vo.description;
            _local_1 = vo.priceType;
        }

        public function set nextReqDesc(_arg_1:Text):void
        {
            var _local_2:Object = this._1848897060nextReqDesc;
            if (_local_2 !== _arg_1)
            {
                this._1848897060nextReqDesc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextReqDesc", _local_2, _arg_1));
            };
        }

        public function set reqLevel(_arg_1:Text):void
        {
            var _local_2:Object = this._431118970reqLevel;
            if (_local_2 !== _arg_1)
            {
                this._431118970reqLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "reqLevel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tipName1():Label
        {
            return (this._2012328149tipName1);
        }

        public function set showBtn(_arg_1:Button):void
        {
            var _local_2:Object = this._2067263007showBtn;
            if (_local_2 !== _arg_1)
            {
                this._2067263007showBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get vo():ToolTipVO
        {
            return (this._3769vo);
        }

        [Bindable(event="propertyChange")]
        public function get desc3():Text
        {
            return (this._95474626desc3);
        }

        [Bindable(event="propertyChange")]
        public function get price():Text
        {
            return (this._106934601price);
        }

        [Bindable(event="propertyChange")]
        public function get tipContainer0():VBox
        {
            return (this._557573430tipContainer0);
        }

        public function set tipName0(_arg_1:Label):void
        {
            var _local_2:Object = this._2012328150tipName0;
            if (_local_2 !== _arg_1)
            {
                this._2012328150tipName0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tipName0", _local_2, _arg_1));
            };
        }

        public function set tipName1(_arg_1:Label):void
        {
            var _local_2:Object = this._2012328149tipName1;
            if (_local_2 !== _arg_1)
            {
                this._2012328149tipName1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tipName1", _local_2, _arg_1));
            };
        }

        public function set iconImg0(_arg_1:Image):void
        {
            var _local_2:Object = this._738251546iconImg0;
            if (_local_2 !== _arg_1)
            {
                this._738251546iconImg0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconImg0", _local_2, _arg_1));
            };
        }

        private function _TipTalent_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.name;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tipName0.htmlText = _arg_1;
            }, "tipName0.htmlText");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.level;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tipName1.htmlText = _arg_1;
            }, "tipName1.htmlText");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TALENT_TOOLTIP_S[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipTalent_Text1.htmlText = _arg_1;
            }, "_TipTalent_Text1.htmlText");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.bProp1;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipTalent_Text2.htmlText = _arg_1;
            }, "_TipTalent_Text2.htmlText");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TALENT_TOOLTIP_S[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                nextReqStr.htmlText = _arg_1;
            }, "nextReqStr.htmlText");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.bProp2;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                nextReqDesc.htmlText = _arg_1;
            }, "nextReqDesc.htmlText");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TALENT_TOOLTIP_S[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                desc3.htmlText = _arg_1;
            }, "desc3.htmlText");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.reqLevel;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                reqLevel.htmlText = _arg_1;
            }, "reqLevel.htmlText");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.description;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                desc.htmlText = _arg_1;
            }, "desc.htmlText");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.priceType;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                price.htmlText = _arg_1;
            }, "price.htmlText");
            result[9] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get nextReqDesc():Text
        {
            return (this._1848897060nextReqDesc);
        }

        [Bindable(event="propertyChange")]
        public function get iconImg0():Image
        {
            return (this._738251546iconImg0);
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

        private function setCommon(_arg_1:Object):void
        {
            var _local_3:Object;
            vo = new ToolTipVO();
            vo.name = (((("<font color='" + GamePredef.MSG_ITEM_COLOR[Math.floor((_arg_1.temp.sid / 10000))]) + "'>") + _arg_1.temp.name) + "</font>");
            vo.level = (("<font color='#ABABAB'>" + Language.TALENT_TOOLTIP_S[0].replace("{lv}", _arg_1.temp.lv)) + "</font>");
            var _local_2:Boolean;
            if ((((Math.floor((_arg_1.temp.sid / 10000)) == 10) || (Math.floor((_arg_1.temp.sid / 10000)) == 11)) && ((!(_arg_1.temp.exp)) || (ToolKit.isEqual(_arg_1.temp.exp, 0)))))
            {
                _local_2 = true;
                iconImg0.visible = false;
                tipName0.x = 0;
                tipName1.x = 0;
            }
            else
            {
                iconImg0.source = ResManager.getIconUrl(_arg_1.temp.iconCode);
                iconImg0.visible = true;
                tipName0.x = 45;
                tipName1.x = 45;
            };
            vo.bProp1 = (("<font color='#7CCD7C'>" + _arg_1.temp.desc) + "</font>");
            reqLevel.visible = true;
            price.visible = true;
            desc.visible = false;
            desc3.visible = true;
            if (_arg_1.temp.lv == 5)
            {
                vo.bProp2 = (("<font color='#7CCD7C'>" + Language.TALENT_TOOLTIP_S[9]) + "</font>");
                reqLevel.visible = false;
                price.visible = false;
                desc3.visible = false;
            };
            for each (_local_3 in _core.data.gameDataIndex[GamePredef.TBL_PET_TALENT][_arg_1.temp.basicTid])
            {
                if (((_local_3) && (ToolKit.isEqual(ToolKit.add(_arg_1.temp.lv, 1), _local_3.lv))))
                {
                    nextReqDesc.htmlText = (("<font color='#7CCD7C'>" + _local_3.desc) + "</font>");
                    reqLevel.htmlText = Language.TALENT_TOOLTIP_S[4].replace("{num}", _local_3.rlv);
                    if (ToolKit.isBigThan(_local_3.rlv, _core.player.level))
                    {
                        reqLevel.htmlText = (("<font color='#FF0000'>" + Language.TALENT_TOOLTIP_S[4].replace("{num}", _local_3.rlv)) + "</font>");
                    };
                    price.visible = true;
                    price.htmlText = Language.TALENT_TOOLTIP_S[5].replace("{num}", _local_3.upExp);
                    if (ToolKit.isEqual(_local_3.upExp, 0))
                    {
                        price.visible = false;
                    };
                    if (ToolKit.isBigThan(_local_3.upExp, _core.player.pvePoint))
                    {
                        price.htmlText = Language.TALENT_TOOLTIP_S[5].replace("{num}", _local_3.upExp);
                    };
                };
            };
            if (((_local_2) && (_arg_1.temp.lv == 0)))
            {
                desc.visible = true;
                vo.description = Language.TALENT_TOOLTIP_S[7];
                if (Math.floor((_arg_1.temp.sid / 10000)) == 11)
                {
                    vo.description = Language.TALENT_TOOLTIP_S[8];
                };
            };
        }


    }
}//package com.qeedoo.ui.view.comp

