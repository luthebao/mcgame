// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.AwakenPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import mx.controls.Alert;
    import mx.controls.Text;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.SimpleSlot;
    import com.qeedoo.ui.view.comp.FilterButton;
    import mx.controls.CheckBox;
    import mx.core.UIComponent;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import mx.containers.HBox;
    import mx.containers.VBox;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.ui.utils.LanguageUtil;
    import com.qeedoo.ui.resource.ResManager;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import mx.events.FlexEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.managers.PopUpManager;
    import flash.display.MovieClip;
    import com.qeedoo.game.resource.ResCacher;
    import flash.display.LoaderInfo;
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

    public class AwakenPanel extends DragableCanvas implements IBindingClient 
    {

        private static const NODE:int = 11;
        private static const NODE_MAX:* = 7;
        private static const IMAGE_BASE:Number = 4130220002000;
        private static const OFFSET_LIGHT:int = 1;
        private static const OFFSET_GRAY:int = 2;
        private static const SWF_BASE:Number = 2080130102000;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1990650299skillBox5:AwakenSkillBox;
        private var _905948603sense3:Image;
        private var _helpAlert:Alert;
        private var _1059134896awakeName:Text;
        public var _AwakenPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _selectScene:int;
        private var _738692350propText2:Text;
        private var _alert:Alert;
        private var _905948604sense2:Image;
        private var _738692351propText1:Text;
        private var _859285687consumeText:Text;
        private var _905948600sense6:Image;
        public var _AwakenPanel_Label1:Label;
        private var _1497712068awakenItem:SimpleSlot;
        private var _1657688947pointsUsedText:Text;
        private var _1059210888awakeProp:Text;
        private var _905948599sense7:Image;
        private var _738692352propText0:Text;
        private var _1990650294skillBox0:AwakenSkillBox;
        private var _1990650295skillBox1:AwakenSkillBox;
        private var _905948601sense5:Image;
        public var _AwakenPanel_Text1:Text;
        private var _1283779760pointsText:Text;
        public var _AwakenPanel_FilterButton1:FilterButton;
        private var _646343081autoBuy:CheckBox;
        public var _AwakenPanel_Text9:Text;
        private var _905948605sense1:Image;
        private var _2035355342swfHolder:UIComponent;
        private var _1990650296skillBox2:AwakenSkillBox;
        private var _422286893rateText:Text;
        public var _AwakenPanel_Image1:Image;
        private var _1990650297skillBox3:AwakenSkillBox;
        private var _905948602sense4:Image;
        private var _1990650298skillBox4:AwakenSkillBox;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":850,
                    "height":460,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_AwakenPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":15,
                                "y":40,
                                "width":650,
                                "height":400,
                                "clipContent":false,
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_AwakenPanel_Image1"
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"sense1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":197,
                                            "y":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"sense2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":319,
                                            "y":78
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"sense3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":350,
                                            "y":207
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"sense4",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":264,
                                            "y":316
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"sense5",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":131,
                                            "y":316
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"sense6",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":43,
                                            "y":207
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"sense7",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":74,
                                            "y":78
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":UIComponent,
                                    "id":"swfHolder",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":115,
                                            "y":64
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CanvasBorder",
                                            "x":455,
                                            "y":5,
                                            "width":190,
                                            "height":140,
                                            "clipContent":false,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"_AwakenPanel_Text1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                    this.color = 0xFFFF00;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":10,
                                                        "mouseEnabled":false,
                                                        "mouseChildren":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"propText0",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":15,
                                                        "y":30,
                                                        "mouseEnabled":false,
                                                        "mouseChildren":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"propText1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":100,
                                                        "y":30,
                                                        "mouseEnabled":false,
                                                        "mouseChildren":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"propText2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":15,
                                                        "y":100,
                                                        "mouseEnabled":false,
                                                        "mouseChildren":false
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CanvasBorder",
                                            "x":455,
                                            "y":150,
                                            "width":190,
                                            "height":245,
                                            "clipContent":false,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"awakeName",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                    this.color = 0xFFFFFF;
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":10,
                                                        "mouseEnabled":false,
                                                        "mouseChildren":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"awakeProp",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                    this.color = 0xFFFFFF;
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":30,
                                                        "mouseEnabled":false,
                                                        "mouseChildren":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":SimpleSlot,
                                                "id":"awakenItem",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"y":70});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"consumeText",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":25,
                                                        "y":115,
                                                        "mouseEnabled":false,
                                                        "mouseChildren":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"rateText",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":25,
                                                        "y":158,
                                                        "mouseEnabled":false,
                                                        "mouseChildren":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":HBox,
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                    this.horizontalGap = 2;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":187,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":CheckBox,
                                                            "id":"autoBuy"
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AwakenPanel_Label1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":FilterButton,
                                                "id":"_AwakenPanel_FilterButton1",
                                                "events":{"click":"___AwakenPanel_FilterButton1_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":50,
                                                        "height":23,
                                                        "y":210,
                                                        "styleName":"BtnStdGreen"
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_AwakenPanel_Text9",
                                    "events":{"click":"___AwakenPanel_Text9_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":390,
                                            "y":370,
                                            "selectable":false
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"RoundedGradientBorder",
                                "x":670,
                                "y":40,
                                "width":170,
                                "height":400,
                                "clipContent":false,
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"pointsText",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":10,
                                            "mouseEnabled":false,
                                            "mouseChildren":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"pointsUsedText",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":30,
                                            "mouseEnabled":false,
                                            "mouseChildren":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":VBox,
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.horizontalAlign = "center";
                                        this.verticalGap = 17;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":70,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":AwakenSkillBox,
                                                "id":"skillBox0"
                                            }), new UIComponentDescriptor({
                                                "type":AwakenSkillBox,
                                                "id":"skillBox1"
                                            }), new UIComponentDescriptor({
                                                "type":AwakenSkillBox,
                                                "id":"skillBox2"
                                            }), new UIComponentDescriptor({
                                                "type":AwakenSkillBox,
                                                "id":"skillBox3"
                                            }), new UIComponentDescriptor({
                                                "type":AwakenSkillBox,
                                                "id":"skillBox4"
                                            }), new UIComponentDescriptor({
                                                "type":AwakenSkillBox,
                                                "id":"skillBox5"
                                            })]
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
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function AwakenPanel()
        {
            mx_internal::_document = this;
            this.width = 850;
            this.height = 460;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___AwakenPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            AwakenPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get propText1():Text
        {
            return (this._738692351propText1);
        }

        public function set propText1(_arg_1:Text):void
        {
            var _local_2:Object = this._738692351propText1;
            if (_local_2 !== _arg_1)
            {
                this._738692351propText1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propText1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get propText0():Text
        {
            return (this._738692352propText0);
        }

        [Bindable(event="propertyChange")]
        public function get propText2():Text
        {
            return (this._738692350propText2);
        }

        public function set propText2(_arg_1:Text):void
        {
            var _local_2:Object = this._738692350propText2;
            if (_local_2 !== _arg_1)
            {
                this._738692350propText2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propText2", _local_2, _arg_1));
            };
        }

        public function updatePoints(_arg_1:Event=null):void
        {
            ((_arg_1) && (_arg_1.stopImmediatePropagation()));
            if (!this.initialized)
            {
                return;
            };
            var _local_2:int = _core.player.awakenPoint;
            var _local_3:int = _core.player.awakenPointUsed;
            pointsText.htmlText = (Language.AWAKEN_PANEL[3] + _local_2);
            pointsUsedText.htmlText = (Language.AWAKEN_PANEL[4] + _local_3);
        }

        public function ___AwakenPanel_FilterButton1_click(_arg_1:MouseEvent):void
        {
            awakenHandler(_arg_1);
        }

        public function updateView():void
        {
            var _local_3:int;
            var _local_4:Object;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            var _local_8:String;
            var _local_9:int;
            var _local_10:int;
            var _local_11:int;
            var _local_12:Number;
            var _local_13:String;
            var _local_1:int = _core.player.awakenLevel;
            var _local_2:Object = {};
            if (_local_1 >= GamePredef.AWAKEN_EDGE)
            {
                awakeName.htmlText = Language.AWAKEN_PANEL[9];
                awakeProp.htmlText = "";
                _local_2["reqLevel"] = "-";
                _local_2["reqNum"] = "-";
                _local_2["reqMoney"] = "-";
            }
            else
            {
                _local_3 = (_local_1 + 1);
                _local_4 = GameData.d[GamePredef.TBL_AWAKENING][_local_3];
                _local_5 = Number(_local_4.reqLevel);
                _local_6 = Number(_local_4.itemNum);
                _local_7 = Number(_local_4.money);
                _local_8 = "";
                _local_9 = 1;
                while (_local_9 <= 2)
                {
                    _local_11 = _local_4[("prop" + _local_9)];
                    if (_local_11 > 0)
                    {
                        _local_12 = Number(_local_4[("propNum" + _local_9)]);
                        _local_13 = String(_local_12);
                        if (GamePredef.AWAKEN_PERCENT_PROP[_local_11])
                        {
                            _local_12 = (_local_12 * 100);
                            _local_13 = _local_12.toFixed(2);
                            _local_13 = (_local_13 + "%");
                        }
                        else
                        {
                            if (int(_local_12) < _local_12)
                            {
                                _local_13 = _local_12.toFixed(2);
                            };
                        };
                        _local_8 = (_local_8 + ((_local_8) ? "\n" : ""));
                        _local_8 = (_local_8 + ((GamePredef.AWAKEN_PROP_DICT[_local_11] + "+") + _local_13));
                    };
                    _local_9++;
                };
                awakeName.htmlText = LanguageUtil.replace(Language.AWAKEN_PANEL[5], {"name":_local_4.name});
                awakeProp.htmlText = _local_8;
                _local_10 = _core.getItemNumFromBag(GamePredef.TBL_ITEM_TEMPLATE, GamePredef.AWAKEN_ITEMID).num;
                _local_2["reqLevel"] = ((_core.player.level < _local_5) ? (("<font color='#FF0000'>" + _local_5) + "</font>") : _local_5);
                _local_2["reqNum"] = ((_local_10 < _local_6) ? (("<font color='#FF0000'>" + _local_6) + "</font>") : _local_6);
                _local_2["reqMoney"] = ((_core.player.money < _local_7) ? (("<font color='#FF0000'>" + _local_7) + "</font>") : _local_7);
            };
            consumeText.htmlText = LanguageUtil.replace(Language.AWAKEN_PANEL[6], _local_2);
            this.updateUI();
            this.updateTotal();
            this.updateRate();
            this.updateItem();
            this.updatePoints();
            this.updateSkills();
        }

        public function set propText0(_arg_1:Text):void
        {
            var _local_2:Object = this._738692352propText0;
            if (_local_2 !== _arg_1)
            {
                this._738692352propText0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propText0", _local_2, _arg_1));
            };
        }

        public function set awakeProp(_arg_1:Text):void
        {
            var _local_2:Object = this._1059210888awakeProp;
            if (_local_2 !== _arg_1)
            {
                this._1059210888awakeProp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awakeProp", _local_2, _arg_1));
            };
        }

        public function set pointsUsedText(_arg_1:Text):void
        {
            var _local_2:Object = this._1657688947pointsUsedText;
            if (_local_2 !== _arg_1)
            {
                this._1657688947pointsUsedText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pointsUsedText", _local_2, _arg_1));
            };
        }

        private function updateUI():void
        {
            var _local_3:Image;
            var _local_4:Number;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            var _local_8:int;
            var _local_9:Object;
            var _local_10:int;
            var _local_11:Object;
            var _local_1:int = _core.player.awakenLevel;
            var _local_2:int = 1;
            while (_local_2 <= 7)
            {
                _local_3 = this[("sense" + _local_2)];
                _local_4 = ((IMAGE_BASE + (_local_2 * 10)) + ((_local_1 >= (_local_2 * NODE)) ? OFFSET_LIGHT : OFFSET_GRAY));
                _local_3.source = ResManager.getIconUrl(_local_4);
                _local_5 = 0;
                _local_6 = ((_local_2 - 1) * NODE);
                _local_7 = (_local_6 + NODE);
                _local_8 = _local_6;
                while (_local_8 < _local_7)
                {
                    _local_10 = (_local_8 + 1);
                    _local_11 = GameData.d[GamePredef.TBL_AWAKENING][_local_10];
                    if (!((!(_local_11)) || (int(_local_11.points) <= 0)))
                    {
                        _local_5 = (_local_5 + int(_local_11.points));
                    };
                    _local_8++;
                };
                _local_9 = {
                    "name":Language.AWAKEN_PANEL[21][_local_2],
                    "num":_local_5
                };
                _local_3.toolTip = LanguageUtil.replace(Language.AWAKEN_PANEL[20], _local_9);
                _local_2++;
            };
            this.updateSwf();
        }

        [Bindable(event="propertyChange")]
        public function get rateText():Text
        {
            return (this._422286893rateText);
        }

        private function closeHandler(_arg_1:CloseEvent):void
        {
            if (_arg_1.detail == Alert.NO)
            {
                return;
            };
            _core.remote.call("ensureBuyAwaken", new Responder(onAwakening));
        }

        [Bindable(event="propertyChange")]
        public function get awakenItem():SimpleSlot
        {
            return (this._1497712068awakenItem);
        }

        [Bindable(event="propertyChange")]
        public function get sense1():Image
        {
            return (this._905948605sense1);
        }

        [Bindable(event="propertyChange")]
        public function get sense2():Image
        {
            return (this._905948604sense2);
        }

        [Bindable(event="propertyChange")]
        public function get sense3():Image
        {
            return (this._905948603sense3);
        }

        private function updateRate():void
        {
            var _local_3:int;
            var _local_4:Object;
            var _local_5:int;
            var _local_6:Number;
            if (!rateText)
            {
                return;
            };
            var _local_1:* = "-";
            var _local_2:int = _core.player.awakenLevel;
            if (_local_2 < GamePredef.AWAKEN_EDGE)
            {
                _local_3 = (_local_2 + 1);
                _local_4 = GameData.d[GamePredef.TBL_AWAKENING][_local_3];
                _local_5 = _core.player.awakenAdd;
                _local_6 = Number(_local_4.rate);
                if (_core.MC_BIRTH_FLAG[19])
                {
                    _local_6 = (_local_6 + Number(GamePredef.MC_BIRTH_CONFIG[19]));
                    if (_local_6 > 100)
                    {
                        _local_6 = 100;
                    };
                };
                _local_1 = ((_local_5 <= 0) ? (_local_6 + "%") : (((_local_6 + "% <font color='#00FF00'>+") + _local_5) + "%</font>"));
            };
            rateText.htmlText = (Language.AWAKEN_PANEL[11] + _local_1);
        }

        [Bindable(event="propertyChange")]
        public function get sense4():Image
        {
            return (this._905948602sense4);
        }

        [Bindable(event="propertyChange")]
        public function get autoBuy():CheckBox
        {
            return (this._646343081autoBuy);
        }

        public function ___AwakenPanel_Text9_click(_arg_1:MouseEvent):void
        {
            helpHandler(_arg_1);
        }

        public function set rateText(_arg_1:Text):void
        {
            var _local_2:Object = this._422286893rateText;
            if (_local_2 !== _arg_1)
            {
                this._422286893rateText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rateText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get sense5():Image
        {
            return (this._905948601sense5);
        }

        [Bindable(event="propertyChange")]
        public function get consumeText():Text
        {
            return (this._859285687consumeText);
        }

        [Bindable(event="propertyChange")]
        public function get sense6():Image
        {
            return (this._905948600sense6);
        }

        private function updateSkills():void
        {
            var _local_3:Object;
            var _local_4:int;
            var _local_5:AwakenSkillBox;
            var _local_6:int;
            var _local_1:Object = {};
            var _local_2:Object = GameData.d[GamePredef.TBL_AWAKENING_SKILL];
            for each (_local_3 in _local_2)
            {
                if (!(((!(_local_3)) || (!(_local_3.hasOwnProperty("position")))) || (!(_local_3.reqClass == _core.player.classId))))
                {
                    _local_1[_local_3.position] = _local_3;
                };
            };
            _local_4 = 0;
            while (_local_4 <= 5)
            {
                _local_5 = this[("skillBox" + _local_4)];
                _local_6 = (_local_4 + 1);
                if (!_local_1[_local_6])
                {
                    _local_5.cleanView();
                }
                else
                {
                    _local_5.updateView(_local_1[_local_6]);
                };
                _local_4++;
            };
        }

        public function set skillBox0(_arg_1:AwakenSkillBox):void
        {
            var _local_2:Object = this._1990650294skillBox0;
            if (_local_2 !== _arg_1)
            {
                this._1990650294skillBox0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skillBox0", _local_2, _arg_1));
            };
        }

        public function set skillBox1(_arg_1:AwakenSkillBox):void
        {
            var _local_2:Object = this._1990650295skillBox1;
            if (_local_2 !== _arg_1)
            {
                this._1990650295skillBox1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skillBox1", _local_2, _arg_1));
            };
        }

        public function set skillBox2(_arg_1:AwakenSkillBox):void
        {
            var _local_2:Object = this._1990650296skillBox2;
            if (_local_2 !== _arg_1)
            {
                this._1990650296skillBox2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skillBox2", _local_2, _arg_1));
            };
        }

        public function set skillBox3(_arg_1:AwakenSkillBox):void
        {
            var _local_2:Object = this._1990650297skillBox3;
            if (_local_2 !== _arg_1)
            {
                this._1990650297skillBox3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skillBox3", _local_2, _arg_1));
            };
        }

        public function set skillBox4(_arg_1:AwakenSkillBox):void
        {
            var _local_2:Object = this._1990650298skillBox4;
            if (_local_2 !== _arg_1)
            {
                this._1990650298skillBox4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skillBox4", _local_2, _arg_1));
            };
        }

        private function updateItem(_arg_1:int=-1):void
        {
            if (!awakenItem)
            {
                return;
            };
            awakenItem.slotId = GamePredef.AWAKEN_ITEMID;
            if ((_arg_1 >= 0))
            {
                awakenItem.stackNum = _arg_1;
            };
        }

        public function set skillBox5(_arg_1:AwakenSkillBox):void
        {
            var _local_2:Object = this._1990650299skillBox5;
            if (_local_2 !== _arg_1)
            {
                this._1990650299skillBox5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skillBox5", _local_2, _arg_1));
            };
        }

        private function awakenHandler(_arg_1:Event):void
        {
            _arg_1.stopImmediatePropagation();
            var _local_2:Boolean = ((autoBuy) && (autoBuy.selected));
            _core.remote.call("awakening", new Responder(onAwakening), _local_2);
        }

        public function set sense1(_arg_1:Image):void
        {
            var _local_2:Object = this._905948605sense1;
            if (_local_2 !== _arg_1)
            {
                this._905948605sense1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sense1", _local_2, _arg_1));
            };
        }

        public function set awakenItem(_arg_1:SimpleSlot):void
        {
            var _local_2:Object = this._1497712068awakenItem;
            if (_local_2 !== _arg_1)
            {
                this._1497712068awakenItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awakenItem", _local_2, _arg_1));
            };
        }

        public function set sense3(_arg_1:Image):void
        {
            var _local_2:Object = this._905948603sense3;
            if (_local_2 !== _arg_1)
            {
                this._905948603sense3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sense3", _local_2, _arg_1));
            };
        }

        public function set awakeName(_arg_1:Text):void
        {
            var _local_2:Object = this._1059134896awakeName;
            if (_local_2 !== _arg_1)
            {
                this._1059134896awakeName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awakeName", _local_2, _arg_1));
            };
        }

        public function set sense5(_arg_1:Image):void
        {
            var _local_2:Object = this._905948601sense5;
            if (_local_2 !== _arg_1)
            {
                this._905948601sense5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sense5", _local_2, _arg_1));
            };
        }

        public function ___AwakenPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            updateView();
        }

        override public function initialize():void
        {
            var target:AwakenPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _AwakenPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_AwakenPanelWatcherSetupUtil");
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

        public function set consumeText(_arg_1:Text):void
        {
            var _local_2:Object = this._859285687consumeText;
            if (_local_2 !== _arg_1)
            {
                this._859285687consumeText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "consumeText", _local_2, _arg_1));
            };
        }

        public function set sense4(_arg_1:Image):void
        {
            var _local_2:Object = this._905948602sense4;
            if (_local_2 !== _arg_1)
            {
                this._905948602sense4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sense4", _local_2, _arg_1));
            };
        }

        public function set pointsText(_arg_1:Text):void
        {
            var _local_2:Object = this._1283779760pointsText;
            if (_local_2 !== _arg_1)
            {
                this._1283779760pointsText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pointsText", _local_2, _arg_1));
            };
        }

        private function onAwakening(_arg_1:Object=null):void
        {
            var _local_2:int;
            var _local_3:String;
            if (!_arg_1)
            {
                return;
            };
            if (_arg_1.hasOwnProperty("needGold"))
            {
                if (_alert)
                {
                    PopUpManager.removePopUp(_alert);
                    _alert = null;
                };
                _local_2 = int(_arg_1.needGold);
                _local_3 = LanguageUtil.replace(Language.AWAKEN_PANEL[10], {"money":_local_2});
                _alert = Alert.show(LanguageUtil.html2PlainText(_local_3), "", (Alert.YES | Alert.NO), null, closeHandler);
                _alert.mx_internal::alertForm.mx_internal::textField.htmlText = _local_3;
                return;
            };
            if (!_arg_1.hasOwnProperty("success"))
            {
                return;
            };
            _core.player.awakenAdd = ((_arg_1.hasOwnProperty("awakenAdd")) ? _arg_1.awakenAdd : 0);
            if (_arg_1.success)
            {
                _core.player.awakenLevel = _arg_1.awakenLevel;
                _core.player.awakenPoint = _arg_1.awakenPoint;
                this.updateView();
                return;
            };
            this.updateItem(_arg_1.itemNum);
            this.updateRate();
        }

        [Bindable(event="propertyChange")]
        public function get sense7():Image
        {
            return (this._905948599sense7);
        }

        public function set sense6(_arg_1:Image):void
        {
            var _local_2:Object = this._905948600sense6;
            if (_local_2 !== _arg_1)
            {
                this._905948600sense6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sense6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pointsUsedText():Text
        {
            return (this._1657688947pointsUsedText);
        }

        [Bindable(event="propertyChange")]
        public function get awakeProp():Text
        {
            return (this._1059210888awakeProp);
        }

        public function set swfHolder(_arg_1:UIComponent):void
        {
            var _local_2:Object = this._2035355342swfHolder;
            if (_local_2 !== _arg_1)
            {
                this._2035355342swfHolder = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "swfHolder", _local_2, _arg_1));
            };
        }

        private function _AwakenPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AWAKEN_PANEL[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AwakenPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_AwakenPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220002000));
            }, function (_arg_1:Object):void
            {
                _AwakenPanel_Image1.source = _arg_1;
            }, "_AwakenPanel_Image1.source");
            result[1] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AwakenPanel_Text1.filters = _arg_1;
            }, "_AwakenPanel_Text1.filters");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AWAKEN_PANEL[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AwakenPanel_Text1.text = _arg_1;
            }, "_AwakenPanel_Text1.text");
            result[3] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                propText0.filters = _arg_1;
            }, "propText0.filters");
            result[4] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                propText1.filters = _arg_1;
            }, "propText1.filters");
            result[5] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                propText2.filters = _arg_1;
            }, "propText2.filters");
            result[6] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                awakeName.filters = _arg_1;
            }, "awakeName.filters");
            result[7] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                awakeProp.filters = _arg_1;
            }, "awakeProp.filters");
            result[8] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_ITEM_TEMPLATE);
            }, function (_arg_1:int):void
            {
                awakenItem.type = _arg_1;
            }, "awakenItem.type");
            result[9] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                consumeText.filters = _arg_1;
            }, "consumeText.filters");
            result[10] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                rateText.filters = _arg_1;
            }, "rateText.filters");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AWAKEN_PANEL[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AwakenPanel_Label1.text = _arg_1;
            }, "_AwakenPanel_Label1.text");
            result[12] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AwakenPanel_Label1.filters = _arg_1;
            }, "_AwakenPanel_Label1.filters");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AWAKEN_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AwakenPanel_FilterButton1.label = _arg_1;
            }, "_AwakenPanel_FilterButton1.label");
            result[14] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AwakenPanel_FilterButton1.filters = _arg_1;
            }, "_AwakenPanel_FilterButton1.filters");
            result[15] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AwakenPanel_Text9.filters = _arg_1;
            }, "_AwakenPanel_Text9.filters");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AWAKEN_PANEL[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AwakenPanel_Text9.htmlText = _arg_1;
            }, "_AwakenPanel_Text9.htmlText");
            result[17] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                pointsText.filters = _arg_1;
            }, "pointsText.filters");
            result[18] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                pointsUsedText.filters = _arg_1;
            }, "pointsUsedText.filters");
            result[19] = binding;
            return (result);
        }

        public function set autoBuy(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._646343081autoBuy;
            if (_local_2 !== _arg_1)
            {
                this._646343081autoBuy = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "autoBuy", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get awakeName():Text
        {
            return (this._1059134896awakeName);
        }

        public function set sense7(_arg_1:Image):void
        {
            var _local_2:Object = this._905948599sense7;
            if (_local_2 !== _arg_1)
            {
                this._905948599sense7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sense7", _local_2, _arg_1));
            };
        }

        public function set sense2(_arg_1:Image):void
        {
            var _local_2:Object = this._905948604sense2;
            if (_local_2 !== _arg_1)
            {
                this._905948604sense2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sense2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get skillBox0():AwakenSkillBox
        {
            return (this._1990650294skillBox0);
        }

        [Bindable(event="propertyChange")]
        public function get pointsText():Text
        {
            return (this._1283779760pointsText);
        }

        [Bindable(event="propertyChange")]
        public function get skillBox3():AwakenSkillBox
        {
            return (this._1990650297skillBox3);
        }

        [Bindable(event="propertyChange")]
        public function get skillBox5():AwakenSkillBox
        {
            return (this._1990650299skillBox5);
        }

        [Bindable(event="propertyChange")]
        public function get skillBox1():AwakenSkillBox
        {
            return (this._1990650295skillBox1);
        }

        [Bindable(event="propertyChange")]
        public function get skillBox2():AwakenSkillBox
        {
            return (this._1990650296skillBox2);
        }

        [Bindable(event="propertyChange")]
        public function get skillBox4():AwakenSkillBox
        {
            return (this._1990650298skillBox4);
        }

        private function helpHandler(_arg_1:Event):void
        {
            _arg_1.stopImmediatePropagation();
            if (_helpAlert)
            {
                PopUpManager.removePopUp(_helpAlert);
                _helpAlert = null;
            };
            var _local_2:String = Language.AWAKEN_PANEL[12];
            _helpAlert = Alert.show(LanguageUtil.html2PlainText(_local_2), "", Alert.YES);
            _helpAlert.mx_internal::alertForm.mx_internal::textField.htmlText = _local_2;
        }

        [Bindable(event="propertyChange")]
        public function get swfHolder():UIComponent
        {
            return (this._2035355342swfHolder);
        }

        private function _AwakenPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.AWAKEN_PANEL[1];
            _local_1 = ResManager.getIconUrl(4130220002000);
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.AWAKEN_PANEL[2];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = GamePredef.TBL_ITEM_TEMPLATE;
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.AWAKEN_PANEL[7];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.AWAKEN_PANEL[0];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.AWAKEN_PANEL[8];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            ((_arg_1) && (this.updateItem()));
        }

        public function updateAwakening(_arg_1:int):void
        {
            var _local_4:*;
            if (!_core.player)
            {
                return;
            };
            _core.player.awakenAdd = 0;
            _core.player.awakenPointUsed = 0;
            _core.player.awakenLevel = _arg_1;
            var _local_2:int;
            var _local_3:int = 1;
            while (_local_3 <= _arg_1)
            {
                _local_4 = GameData.d[GamePredef.TBL_AWAKENING][_local_3];
                if (!((!(_local_4)) || (Number(_local_4.points) <= 0)))
                {
                    _local_2 = (_local_2 + Number(_local_4.points));
                };
                _local_3++;
            };
            _core.player.awakenPoint = _local_2;
            ((this.initialized) && (this.updateView()));
        }

        private function updateSwf():void
        {
            var stepIndex:int;
            var selectSense:int;
            var diffScene:Boolean;
            var senseUrl:String;
            var selectSwf:MovieClip;
            var i:int;
            var onLoadSwf:Function;
            var awakenLvl:int = _core.player.awakenLevel;
            var stepLvl:int = (awakenLvl % NODE);
            stepIndex = (stepLvl + 1);
            var nodeLvl:* = Math.ceil((awakenLvl / NODE));
            if (awakenLvl <= 0)
            {
                selectSense = 1;
            }
            else
            {
                if (awakenLvl >= (NODE_MAX * NODE))
                {
                    stepIndex = NODE;
                    selectSense = NODE_MAX;
                }
                else
                {
                    if (stepLvl == 0)
                    {
                        stepIndex = 0;
                        selectSense = (nodeLvl + 1);
                    }
                    else
                    {
                        selectSense = nodeLvl;
                    };
                };
            };
            diffScene = (!(_selectScene == selectSense));
            if (diffScene)
            {
                _selectScene = selectSense;
                i = (swfHolder.numChildren - 1);
                while (i >= 0)
                {
                    swfHolder.removeChildAt(i);
                    i = (i - 1);
                };
            };
            senseUrl = ResManager.getResUrl((SWF_BASE + _selectScene));
            selectSwf = (ResCacher.getInstance().getRes(senseUrl) as MovieClip);
            if (!selectSwf)
            {
                onLoadSwf = function (_arg_1:Event):void
                {
                    var _local_2:LoaderInfo = ResCacher.getInstance().current_complete_loader;
                    if (_local_2.url.indexOf(senseUrl) == -1)
                    {
                        return;
                    };
                    ResCacher.getInstance().removeEventListener("complete", onLoadSwf);
                    selectSwf = (_arg_1.target.current_complete_loader.content as MovieClip);
                    selectSwf.gotoAndStop(stepIndex);
                    ((diffScene) && (swfHolder.addChild(selectSwf)));
                };
                ResCacher.getInstance().addEventListener("complete", onLoadSwf);
                return;
            };
            selectSwf.gotoAndStop(stepIndex);
            ((diffScene) && (swfHolder.addChild(selectSwf)));
        }

        private function updateTotal():void
        {
            var _local_6:String;
            var _local_7:int;
            var _local_8:Array;
            var _local_9:int;
            var _local_12:int;
            var _local_13:Object;
            var _local_14:int;
            var _local_15:Number;
            var _local_16:Number;
            var _local_17:String;
            var _local_18:Object;
            var _local_19:int;
            var _local_20:String;
            var _local_21:Object;
            var _local_22:String;
            var _local_1:int = _core.player.awakenLevel;
            var _local_2:Object = {};
            var _local_3:int = 1;
            while (_local_3 <= _local_1)
            {
                _local_13 = GameData.d[GamePredef.TBL_AWAKENING][_local_3];
                _local_12 = 1;
                while (_local_12 <= 2)
                {
                    _local_14 = _local_13[("prop" + _local_12)];
                    if (_local_14 > 0)
                    {
                        _local_15 = Number(_local_13[("propNum" + _local_12)]);
                        _local_2[_local_14] = ((_local_2.hasOwnProperty(_local_14)) ? (Number(_local_2[_local_14]) + _local_15) : _local_15);
                    };
                    _local_12++;
                };
                _local_3++;
            };
            var _local_4:Array = [];
            var _local_5:Array = [];
            for (_local_6 in _local_2)
            {
                _local_16 = Number(_local_2[_local_6]);
                _local_17 = String(_local_16);
                if (GamePredef.AWAKEN_PERCENT_PROP[_local_6])
                {
                    _local_16 = (_local_16 * 100);
                    _local_17 = _local_16.toFixed(2);
                    _local_17 = (_local_17 + "%");
                    _local_5.push({
                        "propType":_local_6,
                        "propNum":_local_17
                    });
                }
                else
                {
                    if (int(_local_16) < _local_16)
                    {
                        _local_17 = _local_16.toFixed(2);
                    };
                    _local_4.push({
                        "propType":_local_6,
                        "propNum":_local_17
                    });
                };
            };
            _local_4.sortOn("propType", Array.NUMERIC);
            _local_5.sortOn("propType", Array.NUMERIC);
            _local_7 = _local_4.length;
            _local_8 = ["", ""];
            _local_9 = 0;
            while (_local_9 < _local_7)
            {
                _local_18 = _local_4[_local_9];
                _local_19 = (_local_9 % 2);
                _local_20 = ((GamePredef.AWAKEN_PROP_DICT[_local_18.propType] + "+") + _local_18.propNum);
                _local_8[_local_19] = (_local_8[_local_19] + ((_local_8[_local_19]) ? ("\n" + _local_20) : _local_20));
                _local_9++;
            };
            propText0.htmlText = _local_8[0];
            propText1.htmlText = _local_8[1];
            var _local_10:* = "";
            var _local_11:int = _local_5.length;
            _local_12 = 0;
            while (_local_12 < _local_11)
            {
                _local_21 = _local_5[_local_12];
                _local_22 = ((GamePredef.AWAKEN_PROP_DICT[_local_21.propType] + "+") + _local_21.propNum);
                _local_10 = (_local_10 + ((_local_10) ? ("\n" + _local_22) : _local_22));
                _local_12++;
            };
            propText2.htmlText = _local_10;
        }

        override public function show():void
        {
            super.show();
            (((this.initialized) && (this.visible)) && (updateView()));
        }


    }
}//package com.qeedoo.ui.view.compDragable

