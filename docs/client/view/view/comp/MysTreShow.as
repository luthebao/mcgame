// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.MysTreShow

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import com.qeedoo.game.config.Language;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.containers.HBox;
    import mx.core.UIComponentDescriptor;
    import mx.controls.HRule;
    import com.qeedoo.game.data.DataManager;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
    import flash.net.Responder;
    import com.qeedoo.ui.utils.ToolKit;
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

    public class MysTreShow extends Canvas implements IBindingClient 
    {

        public static const KIND_NAME:Object = {
            "1":Language.DECORATE_PANEL[115][0],
            "2":Language.DECORATE_PANEL[115][1],
            "3":Language.DECORATE_PANEL[115][2],
            "4":Language.DECORATE_PANEL[115][3],
            "5":Language.DECORATE_PANEL[115][4],
            "6":Language.DECORATE_PANEL[115][5],
            "7":Language.DECORATE_PANEL[115][6],
            "8":Language.DECORATE_PANEL[115][7],
            "9":Language.DECORATE_PANEL[115][8],
            "10":Language.DECORATE_PANEL[115][9],
            "11":Language.DECORATE_PANEL[115][10]
        };
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const MYS_TRE_RESICRI:uint = 31;
        private const MYS_TRE_MATTACK:uint = 5;
        private const MYS_TRE_MAG_RED:uint = 60;
        private const MYS_TRE_ATTACK:uint = 4;
        private const MYS_TRE_HIT:uint = 8;
        private const MYS_TRE_DEBUFF:uint = 32;
        private const MYS_TRE_RESIDEBUFF:uint = 58;
        private const MYS_TRE_PHY_RED:uint = 59;
        private const MYS_TRE_SPEED:uint = 11;
        private const MYS_TRE_HP:uint = 1;
        private const MYS_TRE_DODGE:uint = 9;
        private const MYS_TRE_CRI:uint = 13;
        private const MYS_TRE_MAG_HURT:uint = 63;
        private const MYS_TRE_PHY_HURT:uint = 62;
        private var _710658082kindDes:Label;
        public var _MysTreShow_Label3:Label;
        public var _MysTreShow_Label4:Label;
        private var _1815439218mysTreDis:MysTreDisplay;
        private var _555270081kindName:Label;
        private var _91026547_kind:Number;
        private var _1800607650propContainer:HBox;
        private var _1001078227progress:Property;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":380,
                    "height":315,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Label,
                        "id":"kindName",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 14;
                            this.color = 0xFFFF00;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":7,
                                "x":9
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"kindDes",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":11,
                                "x":74
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":HRule,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":350,
                                "height":3,
                                "y":33,
                                "x":10
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_MysTreShow_Label3",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.color = 0xFFFF00;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":38,
                                "x":9
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Property,
                        "id":"progress",
                        "stylesFactory":function ():void
                        {
                            this.left = "65";
                            this.top = "43";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "height":13,
                                "width":305,
                                "styleName":"ProgressExp"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_MysTreShow_Label4",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.color = 0xFFFF00;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":66,
                                "x":10
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":HBox,
                        "id":"propContainer",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.color = 0xFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":86,
                                "x":10
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":MysTreDisplay,
                        "id":"mysTreDis",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":6,
                                "y":101
                            });
                        }
                    })]
                });
            }
        });
        private var _dm:DataManager = DataManager.getInstance();
        private var _core:Core = Core.getInstance();
        private const KIND_DES:Object = {
            "1":Language.DECORATE_PANEL[116][0],
            "2":Language.DECORATE_PANEL[116][1],
            "3":Language.DECORATE_PANEL[116][2],
            "4":Language.DECORATE_PANEL[116][3],
            "5":Language.DECORATE_PANEL[116][4],
            "6":Language.DECORATE_PANEL[116][5],
            "7":Language.DECORATE_PANEL[116][6],
            "8":Language.DECORATE_PANEL[116][7],
            "9":Language.DECORATE_PANEL[116][8],
            "10":Language.DECORATE_PANEL[116][9],
            "11":Language.DECORATE_PANEL[116][10]
        };
        public var mysTreBuff:Object = {};
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function MysTreShow()
        {
            mx_internal::_document = this;
            this.styleName = "CanvasBorder";
            this.verticalScrollPolicy = "off";
            this.horizontalScrollPolicy = "off";
            this.width = 380;
            this.height = 315;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MysTreShow._watcherSetupUtil = _arg_1;
        }


        private function set _kind(_arg_1:Number):void
        {
            var _local_2:Object = this._91026547_kind;
            if (_local_2 !== _arg_1)
            {
                this._91026547_kind = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_kind", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:MysTreShow;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MysTreShow_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_MysTreShowWatcherSetupUtil");
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

        public function set mysTreDis(_arg_1:MysTreDisplay):void
        {
            var _local_2:Object = this._1815439218mysTreDis;
            if (_local_2 !== _arg_1)
            {
                this._1815439218mysTreDis = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysTreDis", _local_2, _arg_1));
            };
        }

        public function updateView(_arg_1:Object):void
        {
            var _local_3:Object;
            var _local_4:Object;
            var _local_5:Number;
            var _local_6:Object;
            kindName.text = KIND_NAME[_kind];
            kindDes.text = KIND_DES[_kind];
            var _local_2:Number = 0;
            for (_local_3 in _arg_1[_kind])
            {
                _local_2++;
            };
            _local_4 = _dm.gameDataIndex[GamePredef.TBL_MYSTRE][_kind];
            _local_5 = 0;
            for (_local_6 in _local_4)
            {
                _local_5++;
            };
            progress.color = 0;
            progress.v = _local_2;
            progress.m = _local_5;
            progress.label = ((_local_2 + "/") + _local_5);
            mysTreDis.mysTreBookData = _arg_1;
            _core.remote.call("getMysTreBuffByKind", new Responder(updateBuffCanvas), _kind);
        }

        public function initBuffProp():void
        {
            mysTreBuff.hp = 0;
            mysTreBuff.attack = 0;
            mysTreBuff.mAttack = 0;
            mysTreBuff.speed = 0;
            mysTreBuff.hit = 0;
            mysTreBuff.dodge = 0;
            mysTreBuff.debuffSuccRate = 0;
            mysTreBuff.debuffResi = 0;
            mysTreBuff.critical = 0;
            mysTreBuff.resiCritical = 0;
            mysTreBuff.enhPhyHurtPer = 0;
            mysTreBuff.enhMagicHurtPer = 0;
            mysTreBuff.praDef = 0;
            mysTreBuff.praMagDef = 0;
        }

        public function set kindName(_arg_1:Label):void
        {
            var _local_2:Object = this._555270081kindName;
            if (_local_2 !== _arg_1)
            {
                this._555270081kindName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "kindName", _local_2, _arg_1));
            };
        }

        public function set kind(_arg_1:Number):void
        {
            _kind = _arg_1;
        }

        public function updateBuffCanvas(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:Object;
            var _local_5:Label;
            var _local_6:Label;
            initBuffProp();
            if (propContainer.numChildren > 0)
            {
                propContainer.removeAllChildren();
            };
            for (_local_2 in _arg_1)
            {
                _local_4 = _arg_1[_local_2];
                switch (Number(_local_4["t"]))
                {
                    case MYS_TRE_HP:
                        mysTreBuff.hp = ToolKit.add(mysTreBuff.hp, _local_4["propVal"]);
                        break;
                    case MYS_TRE_ATTACK:
                        mysTreBuff.attack = ToolKit.add(mysTreBuff.attack, _local_4["propVal"]);
                        break;
                    case MYS_TRE_MATTACK:
                        mysTreBuff.mAttack = ToolKit.add(mysTreBuff.mAttack, _local_4["propVal"]);
                        break;
                    case MYS_TRE_SPEED:
                        mysTreBuff.speed = ToolKit.add(mysTreBuff.speed, _local_4["propVal"]);
                        break;
                    case MYS_TRE_CRI:
                        mysTreBuff.critical = ToolKit.add(mysTreBuff.critical, _local_4["propVal"]);
                        break;
                    case MYS_TRE_RESICRI:
                        mysTreBuff.resiCritical = ToolKit.add(mysTreBuff.resiCritical, _local_4["propVal"]);
                        break;
                    case MYS_TRE_DEBUFF:
                        mysTreBuff.debuffSuccRate = ToolKit.add(mysTreBuff.debuffSuccRate, _local_4["propVal"]);
                        break;
                    case MYS_TRE_RESIDEBUFF:
                        mysTreBuff.debuffResi = ToolKit.add(mysTreBuff.debuffResi, _local_4["propVal"]);
                        break;
                    case MYS_TRE_HIT:
                        mysTreBuff.hit = ToolKit.add(mysTreBuff.hit, _local_4["propVal"]);
                        break;
                    case MYS_TRE_DODGE:
                        mysTreBuff.dodge = ToolKit.add(mysTreBuff.dodge, _local_4["propVal"]);
                        break;
                    case MYS_TRE_PHY_HURT:
                        mysTreBuff.enhPhyHurtPer = ToolKit.add(mysTreBuff.enhPhyHurtPer, _local_4["propVal"]);
                        break;
                    case MYS_TRE_MAG_HURT:
                        mysTreBuff.enhMagicHurtPer = ToolKit.add(mysTreBuff.enhMagicHurtPer, _local_4["propVal"]);
                        break;
                    case MYS_TRE_PHY_RED:
                        mysTreBuff.praDef = ToolKit.add(mysTreBuff.praDef, _local_4["propVal"]);
                        break;
                    case MYS_TRE_MAG_RED:
                        mysTreBuff.praMagDef = ToolKit.add(mysTreBuff.praMagDef, _local_4["propVal"]);
                        break;
                };
            };
            for (_local_3 in mysTreBuff)
            {
                _local_5 = new Label();
                switch (_local_3)
                {
                    case "hp":
                        _local_5.htmlText = (((((("<font color='#FFFFFF'/>" + Language.TALENT_PANEL_INFOU[0]) + "</font>") + "<font color='#00FFFF'/>") + "+") + mysTreBuff[_local_3]) + "</font>");
                        break;
                    case "attack":
                        _local_5.htmlText = (((((("<font color='#FFFFFF'/>" + Language.TALENT_PANEL_INFOU[4]) + "</font>") + "<font color='#00FFFF'/>") + "+") + mysTreBuff[_local_3]) + "</font>");
                        break;
                    case "mAttack":
                        _local_5.htmlText = (((((("<font color='#FFFFFF'/>" + Language.TALENT_PANEL_INFOU[5]) + "</font>") + "<font color='#00FFFF'/>") + "+") + mysTreBuff[_local_3]) + "</font>");
                        break;
                    case "speed":
                        _local_5.htmlText = (((((("<font color='#FFFFFF'/>" + Language.TALENT_PANEL_INFOU[10]) + "</font>") + "<font color='#00FFFF'/>") + "+") + mysTreBuff[_local_3]) + "</font>");
                        break;
                    case "hit":
                        _local_5.htmlText = (((((("<font color='#FFFFFF'/>" + Language.TALENT_PANEL_INFOU[7]) + "</font>") + "<font color='#00FFFF'/>") + "+") + mysTreBuff[_local_3]) + "</font>");
                        break;
                    case "dodge":
                        _local_5.htmlText = (((((("<font color='#FFFFFF'/>" + Language.TALENT_PANEL_INFOU[6]) + "</font>") + "<font color='#00FFFF'/>") + "+") + mysTreBuff[_local_3]) + "</font>");
                        break;
                    case "debuffResi":
                        _local_5.htmlText = (((((("<font color='#FFFFFF'/>" + Language.TALENT_PANEL_INFOU[13]) + "</font>") + "<font color='#00FFFF'/>") + "+") + mysTreBuff[_local_3]) + "</font>");
                        break;
                    case "debuffSuccRate":
                        _local_5.htmlText = (((((("<font color='#FFFFFF'/>" + Language.TALENT_PANEL_INFOU[14]) + "</font>") + "<font color='#00FFFF'/>") + "+") + mysTreBuff[_local_3]) + "</font>");
                        break;
                    case "critical":
                        _local_5.htmlText = (((((("<font color='#FFFFFF'/>" + Language.TALENT_PANEL_INFOU[8]) + "</font>") + "<font color='#00FFFF'/>") + "+") + mysTreBuff[_local_3]) + "</font>");
                        break;
                    case "resiCritical":
                        _local_5.htmlText = (((((("<font color='#FFFFFF'/>" + Language.TALENT_PANEL_INFOU[9]) + "</font>") + "<font color='#00FFFF'/>") + "+") + mysTreBuff[_local_3]) + "</font>");
                        break;
                    case "enhPhyHurtPer":
                        _local_5.htmlText = (((((("<font color='#FFFFFF'/>" + Language.TALENT_PANEL_INFOU[17]) + "</font>") + "<font color='#00FFFF'/>") + "+") + mysTreBuff[_local_3]) + "</font>");
                        break;
                    case "enhMagicHurtPer":
                        _local_5.htmlText = (((((("<font color='#FFFFFF'/>" + Language.TALENT_PANEL_INFOU[18]) + "</font>") + "<font color='#00FFFF'/>") + "+") + mysTreBuff[_local_3]) + "</font>");
                        break;
                    case "praDef":
                        _local_5.htmlText = (((((("<font color='#FFFFFF'/>" + Language.TALENT_PANEL_INFOU[15]) + "</font>") + "<font color='#00FFFF'/>") + "+") + mysTreBuff[_local_3]) + "</font>");
                        break;
                    case "praMagDef":
                        _local_5.htmlText = (((((("<font color='#FFFFFF'/>" + Language.TALENT_PANEL_INFOU[16]) + "</font>") + "<font color='#00FFFF'/>") + "+") + mysTreBuff[_local_3]) + "</font>");
                        break;
                };
                if (Number(mysTreBuff[_local_3]))
                {
                    propContainer.addChild(_local_5);
                };
            };
            if (!propContainer.numChildren)
            {
                _local_6 = new Label();
                _local_6.text = Language.DECORATE_PANEL[117];
                propContainer.addChild(_local_6);
            };
        }

        private function _MysTreShow_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.DECORATE_PANEL[118];
            _local_1 = Language.DECORATE_PANEL[119];
            _local_1 = _kind;
        }

        public function set kindDes(_arg_1:Label):void
        {
            var _local_2:Object = this._710658082kindDes;
            if (_local_2 !== _arg_1)
            {
                this._710658082kindDes = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "kindDes", _local_2, _arg_1));
            };
        }

        private function _MysTreShow_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DECORATE_PANEL[118];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MysTreShow_Label3.text = _arg_1;
            }, "_MysTreShow_Label3.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DECORATE_PANEL[119];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MysTreShow_Label4.text = _arg_1;
            }, "_MysTreShow_Label4.text");
            result[1] = binding;
            binding = new Binding(this, function ():Number
            {
                return (_kind);
            }, function (_arg_1:Number):void
            {
                mysTreDis.kind = _arg_1;
            }, "mysTreDis.kind");
            result[2] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get kindDes():Label
        {
            return (this._710658082kindDes);
        }

        [Bindable(event="propertyChange")]
        public function get propContainer():HBox
        {
            return (this._1800607650propContainer);
        }

        [Bindable(event="propertyChange")]
        public function get progress():Property
        {
            return (this._1001078227progress);
        }

        public function set progress(_arg_1:Property):void
        {
            var _local_2:Object = this._1001078227progress;
            if (_local_2 !== _arg_1)
            {
                this._1001078227progress = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "progress", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mysTreDis():MysTreDisplay
        {
            return (this._1815439218mysTreDis);
        }

        [Bindable(event="propertyChange")]
        private function get _kind():Number
        {
            return (this._91026547_kind);
        }

        public function set propContainer(_arg_1:HBox):void
        {
            var _local_2:Object = this._1800607650propContainer;
            if (_local_2 !== _arg_1)
            {
                this._1800607650propContainer = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propContainer", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get kindName():Label
        {
            return (this._555270081kindName);
        }


    }
}//package com.qeedoo.ui.view.comp

