// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.ActivityDetail

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.HBox;
    import mx.core.Repeater;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.config.Language;
    import mx.events.FlexEvent;
    import mx.binding.RepeatableBinding;
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

    public class ActivityDetail extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1870278688hardStarHbox:HBox;
        private var _1713554638moneyStar:Repeater;
        public var _ActivityDetail_Image3:Array;
        public var _ActivityDetail_Image4:Array;
        private var _1367080559_ActivityDetail_HBox2:HBox;
        private var _711621622LB_time:RoundedLabel;
        public var _ActivityDetail_Image2:Array;
        private var _37263852lb_hard:RoundedLabel;
        private var hardStarArr:Array;
        private var _1367080560_ActivityDetail_HBox3:HBox;
        private var _1150148425lb_money:RoundedLabel;
        private var _104387img:Image;
        private var moneyStarArr:Array;
        private var _2669TA:LinkTextArea;
        private var expStarArr:Array;
        private var _115854813hardStar:Repeater;
        private var _1109582892lb_exp:RoundedLabel;
        private var _711435188LB_name:RoundedLabel;
        private var _1309889009expStar:Repeater;
        private var _1515550027moneyStarHbox:HBox;
        private var _1367080558_ActivityDetail_HBox1:HBox;
        private var _1893418770expStarHbox:HBox;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "height":100,
                    "width":600,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"LB_name",
                        "stylesFactory":function ():void
                        {
                            this.left = "80";
                            this.fontSize = 14;
                            this.color = 0xFFFF00;
                            this.top = "3";
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"LB_time",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.color = 0xFFFFFF;
                            this.top = "5";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"text":""});
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"img",
                        "stylesFactory":function ():void
                        {
                            this.left = "10";
                            this.verticalCenter = "6";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":60,
                                "height":60
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":SimpleCanvas,
                        "stylesFactory":function ():void
                        {
                            this.top = "26";
                            this.left = "80";
                            this.bottom = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":379,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":LinkTextArea,
                                    "id":"TA",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "5";
                                        this.right = "5";
                                        this.top = "5";
                                        this.backgroundAlpha = 0;
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                        this.borderStyle = "none";
                                        this.bottom = "5";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off"
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"lb_hard",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":467,
                                "y":18,
                                "width":35
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"lb_exp",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":467,
                                "y":34,
                                "width":35
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"lb_money",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":467,
                                "y":52,
                                "width":35
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":HBox,
                        "id":"hardStarHbox",
                        "stylesFactory":function ():void
                        {
                            this.horizontalGap = 1;
                            this.right = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":100,
                                "y":21,
                                "height":12,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Repeater,
                                    "id":"hardStar",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_ActivityDetail_Image2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            })]});
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":HBox,
                        "id":"expStarHbox",
                        "stylesFactory":function ():void
                        {
                            this.horizontalGap = 1;
                            this.right = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":100,
                                "y":37,
                                "height":12,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Repeater,
                                    "id":"expStar",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_ActivityDetail_Image3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            })]});
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":HBox,
                        "id":"moneyStarHbox",
                        "stylesFactory":function ():void
                        {
                            this.horizontalGap = 1;
                            this.right = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":100,
                                "y":55,
                                "height":12,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Repeater,
                                    "id":"moneyStar",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_ActivityDetail_Image4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            })]});
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

        public function ActivityDetail()
        {
            mx_internal::_document = this;
            this.height = 100;
            this.width = 600;
            this.styleName = "CanvasBorder";
            this.addEventListener("creationComplete", ___ActivityDetail_Canvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ActivityDetail._watcherSetupUtil = _arg_1;
        }


        public function set _ActivityDetail_HBox2(_arg_1:HBox):void
        {
            var _local_2:Object = this._1367080559_ActivityDetail_HBox2;
            if (_local_2 !== _arg_1)
            {
                this._1367080559_ActivityDetail_HBox2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_ActivityDetail_HBox2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get LB_time():RoundedLabel
        {
            return (this._711621622LB_time);
        }

        public function set img(_arg_1:Image):void
        {
            var _local_2:Object = this._104387img;
            if (_local_2 !== _arg_1)
            {
                this._104387img = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img", _local_2, _arg_1));
            };
        }

        public function set _ActivityDetail_HBox3(_arg_1:HBox):void
        {
            var _local_2:Object = this._1367080560_ActivityDetail_HBox3;
            if (_local_2 !== _arg_1)
            {
                this._1367080560_ActivityDetail_HBox3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_ActivityDetail_HBox3", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:ActivityDetail;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ActivityDetail_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_ActivityDetailWatcherSetupUtil");
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
        public function get expStarHbox():HBox
        {
            return (this._1893418770expStarHbox);
        }

        public function init():void
        {
            var _local_2:int;
            var _local_3:int;
            LB_name.text = data.name;
            LB_time.text = data.timeStr;
            TA.htmlText = data.desc;
            hardStarArr = [];
            expStarArr = [];
            moneyStarArr = [];
            var _local_1:int;
            while (_local_1 < data.hard)
            {
                hardStarArr.push(ResManager.ICON_EQUIP_STAR);
                _local_1++;
            };
            if (data.exp)
            {
                _local_2 = 0;
                while (_local_2 < data.exp)
                {
                    expStarArr.push(ResManager.ICON_EQUIP_STAR);
                    _local_2++;
                };
                lb_exp.text = Language.GAMEINTROPANEL_U[16];
            }
            else
            {
                if (data.sx)
                {
                    _local_2 = 0;
                    while (_local_2 < data.sx)
                    {
                        expStarArr.push(ResManager.ICON_EQUIP_STAR);
                        _local_2++;
                    };
                    lb_exp.text = Language.GAMEINTROPANEL_U[27];
                };
            };
            if (data.money)
            {
                _local_3 = 0;
                while (_local_3 < data.money)
                {
                    moneyStarArr.push(ResManager.ICON_EQUIP_STAR);
                    _local_3++;
                };
                lb_money.text = Language.GAMEINTROPANEL_U[17];
            }
            else
            {
                if (data.quality)
                {
                    _local_2 = 0;
                    while (_local_2 < data.quality)
                    {
                        moneyStarArr.push(ResManager.ICON_EQUIP_STAR);
                        _local_2++;
                    };
                    lb_money.text = Language.GAMEINTROPANEL_U[26];
                };
            };
            hardStar.dataProvider = hardStarArr;
            expStar.dataProvider = expStarArr;
            moneyStar.dataProvider = moneyStarArr;
            img.source = ResManager.getIconUrl(data.resCode);
            if (expStarArr.length == 0)
            {
                lb_exp.visible = false;
            }
            else
            {
                lb_exp.visible = true;
            };
            if (moneyStarArr.length == 0)
            {
                lb_money.visible = false;
            }
            else
            {
                lb_money.visible = true;
            };
            setLbPosition();
        }

        [Bindable(event="propertyChange")]
        public function get lb_hard():RoundedLabel
        {
            return (this._37263852lb_hard);
        }

        public function ___ActivityDetail_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function set lb_exp(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1109582892lb_exp;
            if (_local_2 !== _arg_1)
            {
                this._1109582892lb_exp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_exp", _local_2, _arg_1));
            };
        }

        public function set lb_hard(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._37263852lb_hard;
            if (_local_2 !== _arg_1)
            {
                this._37263852lb_hard = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_hard", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get expStar():Repeater
        {
            return (this._1309889009expStar);
        }

        [Bindable(event="propertyChange")]
        public function get LB_name():RoundedLabel
        {
            return (this._711435188LB_name);
        }

        [Bindable(event="propertyChange")]
        public function get moneyStarHbox():HBox
        {
            return (this._1515550027moneyStarHbox);
        }

        public function set expStar(_arg_1:Repeater):void
        {
            var _local_2:Object = this._1309889009expStar;
            if (_local_2 !== _arg_1)
            {
                this._1309889009expStar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "expStar", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lb_money():RoundedLabel
        {
            return (this._1150148425lb_money);
        }

        [Bindable(event="propertyChange")]
        public function get moneyStar():Repeater
        {
            return (this._1713554638moneyStar);
        }

        public function set hardStarHbox(_arg_1:HBox):void
        {
            var _local_2:Object = this._1870278688hardStarHbox;
            if (_local_2 !== _arg_1)
            {
                this._1870278688hardStarHbox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hardStarHbox", _local_2, _arg_1));
            };
        }

        private function setLbPosition():void
        {
            if (((!(lb_exp.visible)) && (lb_money)))
            {
                lb_money.y = 34;
                moneyStarHbox.y = 37;
            }
            else
            {
                lb_money.y = 52;
                moneyStarHbox.y = 55;
            };
        }

        [Bindable(event="propertyChange")]
        public function get hardStarHbox():HBox
        {
            return (this._1870278688hardStarHbox);
        }

        public function set prop(_arg_1:Object):void
        {
            data = _arg_1;
        }

        public function set hardStar(_arg_1:Repeater):void
        {
            var _local_2:Object = this._115854813hardStar;
            if (_local_2 !== _arg_1)
            {
                this._115854813hardStar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hardStar", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lb_exp():RoundedLabel
        {
            return (this._1109582892lb_exp);
        }

        [Bindable(event="propertyChange")]
        public function get img():Image
        {
            return (this._104387img);
        }

        public function set _ActivityDetail_HBox1(_arg_1:HBox):void
        {
            var _local_2:Object = this._1367080558_ActivityDetail_HBox1;
            if (_local_2 !== _arg_1)
            {
                this._1367080558_ActivityDetail_HBox1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_ActivityDetail_HBox1", _local_2, _arg_1));
            };
        }

        private function _ActivityDetail_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.GAMEINTROPANEL_U[18];
            _local_1 = hardStar.currentItem;
            _local_1 = expStar.currentItem;
            _local_1 = moneyStar.currentItem;
        }

        [Bindable(event="propertyChange")]
        public function get hardStar():Repeater
        {
            return (this._115854813hardStar);
        }

        private function _ActivityDetail_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GAMEINTROPANEL_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lb_hard.text = _arg_1;
            }, "lb_hard.text");
            result[0] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):Object
            {
                return (hardStar.mx_internal::getItemAt(_arg_2[0]));
            }, function (_arg_1:Object, _arg_2:Array):void
            {
                _ActivityDetail_Image2[_arg_2[0]].source = _arg_1;
            }, "_ActivityDetail_Image2.source");
            result[1] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):Object
            {
                return (expStar.mx_internal::getItemAt(_arg_2[0]));
            }, function (_arg_1:Object, _arg_2:Array):void
            {
                _ActivityDetail_Image3[_arg_2[0]].source = _arg_1;
            }, "_ActivityDetail_Image3.source");
            result[2] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):Object
            {
                return (moneyStar.mx_internal::getItemAt(_arg_2[0]));
            }, function (_arg_1:Object, _arg_2:Array):void
            {
                _ActivityDetail_Image4[_arg_2[0]].source = _arg_1;
            }, "_ActivityDetail_Image4.source");
            result[3] = binding;
            return (result);
        }

        public function set LB_name(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._711435188LB_name;
            if (_local_2 !== _arg_1)
            {
                this._711435188LB_name = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "LB_name", _local_2, _arg_1));
            };
        }

        public function set expStarHbox(_arg_1:HBox):void
        {
            var _local_2:Object = this._1893418770expStarHbox;
            if (_local_2 !== _arg_1)
            {
                this._1893418770expStarHbox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "expStarHbox", _local_2, _arg_1));
            };
        }

        public function set moneyStar(_arg_1:Repeater):void
        {
            var _local_2:Object = this._1713554638moneyStar;
            if (_local_2 !== _arg_1)
            {
                this._1713554638moneyStar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moneyStar", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get _ActivityDetail_HBox1():HBox
        {
            return (this._1367080558_ActivityDetail_HBox1);
        }

        [Bindable(event="propertyChange")]
        public function get _ActivityDetail_HBox2():HBox
        {
            return (this._1367080559_ActivityDetail_HBox2);
        }

        [Bindable(event="propertyChange")]
        public function get _ActivityDetail_HBox3():HBox
        {
            return (this._1367080560_ActivityDetail_HBox3);
        }

        public function set moneyStarHbox(_arg_1:HBox):void
        {
            var _local_2:Object = this._1515550027moneyStarHbox;
            if (_local_2 !== _arg_1)
            {
                this._1515550027moneyStarHbox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moneyStarHbox", _local_2, _arg_1));
            };
        }

        public function set TA(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._2669TA;
            if (_local_2 !== _arg_1)
            {
                this._2669TA = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "TA", _local_2, _arg_1));
            };
        }

        public function set LB_time(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._711621622LB_time;
            if (_local_2 !== _arg_1)
            {
                this._711621622LB_time = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "LB_time", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get TA():LinkTextArea
        {
            return (this._2669TA);
        }

        public function set lb_money(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1150148425lb_money;
            if (_local_2 !== _arg_1)
            {
                this._1150148425lb_money = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_money", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.comp

