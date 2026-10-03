// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.WorldCupCanvas

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import mx.containers.Canvas;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import mx.utils.StringUtil;
    import com.qeedoo.ui.resource.ResManager;
    import mx.binding.Binding;
    import mx.events.FlexEvent;
    import com.qeedoo.ui.utils.ToolKit;
    import flash.events.Event;
    import flash.utils.getDefinitionByName;
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

    public class WorldCupCanvas extends SimpleCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _3236047img2:Image;
        private var _3236049img4:Image;
        private var _100318716imgY2:Image;
        private var _1872787729saveCal:DelayButton;
        private var _teamInfo:String;
        private var _3118c1:Canvas;
        private var _104584968name3:Label;
        private var _3121c4:Canvas;
        private var _110233972team1:Label;
        private var _100318715imgY1:Image;
        private var _3120c3:Canvas;
        private var _3236046img1:Image;
        private var _group:String = "A";
        private var _3236048img3:Image;
        private var _clickId:Number = -1;
        private var _104584967name2:Label;
        private var _click:Number = -1;
        private var _3237038info:Label;
        private var _110233971team0:Label;
        private var _1185092072imgSJ2:Image;
        private var _teamRealy:String;
        private var _104584969name4:Label;
        private var _1439306256teamLab:Label;
        private var _3119c2:Canvas;
        private var _104584966name1:Label;
        private var _1185092073imgSJ1:Image;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":206,
                    "height":250,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Label,
                        "id":"teamLab",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                            this.color = 0xFFD700;
                            this.fontSize = 20;
                            this.fontFamily = "Arial";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "text":"123",
                                "width":206
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":DelayButton,
                        "id":"saveCal",
                        "events":{"click":"__saveCal_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":133,
                                "y":4,
                                "clickDelay":3000,
                                "styleName":"BtnStdRed"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"info",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFD700;
                            this.fontSize = 15;
                            this.fontFamily = "Arial";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":206,
                                "y":125,
                                "height":25.5
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"c1",
                        "events":{"click":"__c1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":20,
                                "y":152.5,
                                "width":39,
                                "height":39,
                                "buttonMode":true,
                                "useHandCursor":true,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"img1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0,
                                            "y":0,
                                            "width":39,
                                            "height":39
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"name1",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":60,
                                "y":155.5,
                                "width":53,
                                "height":30
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"c2",
                        "events":{"click":"__c2_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":112,
                                "y":152.5,
                                "width":39,
                                "height":39,
                                "buttonMode":true,
                                "useHandCursor":true,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"img2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0,
                                            "y":0,
                                            "width":39,
                                            "height":39
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"name2",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":152,
                                "y":155.5,
                                "width":53,
                                "height":30
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"c3",
                        "events":{"click":"__c3_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":20,
                                "y":203.45,
                                "width":39,
                                "height":39,
                                "buttonMode":true,
                                "useHandCursor":true,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"img3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0,
                                            "y":0,
                                            "width":39,
                                            "height":39
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"name3",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":60,
                                "y":206.5,
                                "width":53,
                                "height":30
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"c4",
                        "events":{"click":"__c4_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":112,
                                "y":203.45,
                                "width":39,
                                "height":39,
                                "buttonMode":true,
                                "useHandCursor":true,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"img4",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0,
                                            "y":0,
                                            "width":39,
                                            "height":39
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"name4",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":152,
                                "y":206.5,
                                "width":53,
                                "height":30
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"team0",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                            this.color = 0xFFD700;
                            this.fontSize = 15;
                            this.fontFamily = "Arial";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":75,
                                "x":0,
                                "y":39
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"team1",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                            this.color = 0xFFD700;
                            this.fontSize = 15;
                            this.fontFamily = "Arial";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":75,
                                "x":0,
                                "y":86
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"imgY1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":80,
                                "y":35.45,
                                "width":39,
                                "height":39
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"imgY2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":134,
                                "y":35.45,
                                "width":39,
                                "height":39
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"imgSJ1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":80,
                                "y":87.45,
                                "width":39,
                                "height":39
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"imgSJ2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":134,
                                "y":87.45,
                                "width":39,
                                "height":39
                            });
                        }
                    })]
                });
            }
        });
        private var _teamChar:Object = {};
        private var _team:Array = new Array();
        private var _teamSure:Array = new Array();
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function WorldCupCanvas()
        {
            mx_internal::_document = this;
            this.width = 206;
            this.height = 250;
            this.addEventListener("creationComplete", ___WorldCupCanvas_SimpleCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            WorldCupCanvas._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get imgY2():Image
        {
            return (this._100318716imgY2);
        }

        [Bindable(event="propertyChange")]
        public function get name2():Label
        {
            return (this._104584967name2);
        }

        [Bindable(event="propertyChange")]
        public function get name4():Label
        {
            return (this._104584969name4);
        }

        public function set name1(_arg_1:Label):void
        {
            var _local_2:Object = this._104584966name1;
            if (_local_2 !== _arg_1)
            {
                this._104584966name1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "name1", _local_2, _arg_1));
            };
        }

        public function set imgY1(_arg_1:Image):void
        {
            var _local_2:Object = this._100318715imgY1;
            if (_local_2 !== _arg_1)
            {
                this._100318715imgY1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgY1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get name1():Label
        {
            return (this._104584966name1);
        }

        [Bindable(event="propertyChange")]
        public function get imgSJ2():Image
        {
            return (this._1185092072imgSJ2);
        }

        public function set name2(_arg_1:Label):void
        {
            var _local_2:Object = this._104584967name2;
            if (_local_2 !== _arg_1)
            {
                this._104584967name2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "name2", _local_2, _arg_1));
            };
        }

        public function __c1_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroup(0);
        }

        private function init():void
        {
            updateInfo();
        }

        public function set name4(_arg_1:Label):void
        {
            var _local_2:Object = this._104584969name4;
            if (_local_2 !== _arg_1)
            {
                this._104584969name4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "name4", _local_2, _arg_1));
            };
        }

        public function set saveCal(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._1872787729saveCal;
            if (_local_2 !== _arg_1)
            {
                this._1872787729saveCal = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "saveCal", _local_2, _arg_1));
            };
        }

        public function updateInfo():void
        {
            var _local_1:*;
            var _local_2:Array;
            var _local_3:int;
            teamLab.text = (_group + Language.WORLD_CUP_PANEL[5]);
            _teamSure = new Array();
            if (_teamInfo)
            {
                _local_2 = _teamInfo.split("|");
                _local_3 = 0;
                _local_1 = 0;
                while (_local_1 < _local_2.length)
                {
                    if ((((_local_2[_local_1]) && (!(StringUtil.trim(_local_2[_local_1]) == ""))) && (GamePredef.WORLD_CUP_INFO[_local_2[_local_1]])))
                    {
                        this[("img" + ++_local_3)].source = ResManager.getIconUrl(parseInt(GamePredef.WORLD_CUP_INFO[_local_2[_local_1]].icon));
                        this[("name" + _local_3)].text = GamePredef.WORLD_CUP_INFO[_local_2[_local_1]].name;
                        _teamSure.push(_local_2[_local_1]);
                    };
                    _local_1++;
                };
            };
            this["imgSJ1"].visible = false;
            this["imgSJ2"].visible = false;
            if (_teamRealy)
            {
                _local_2 = _teamRealy.split("|");
                _local_3 = 0;
                _local_1 = 0;
                while (_local_1 < _local_2.length)
                {
                    if ((((_local_2[_local_1]) && (!(StringUtil.trim(_local_2[_local_1]) == ""))) && (GamePredef.WORLD_CUP_INFO[_local_2[_local_1]])))
                    {
                        this[("imgSJ" + ++_local_3)].source = ResManager.getIconUrl(parseInt(GamePredef.WORLD_CUP_INFO[_local_2[_local_1]].icon));
                        this[("imgSJ" + _local_3)].visible = true;
                    };
                    _local_1++;
                };
            };
            this["imgY1"].visible = false;
            this["imgY2"].visible = false;
            _local_3 = 0;
            _team = new Array();
            for (_local_1 in _teamChar)
            {
                if (((_teamChar[_local_1]) && (GamePredef.WORLD_CUP_INFO[_local_1])))
                {
                    this[("imgY" + ++_local_3)].source = ResManager.getIconUrl(parseInt(GamePredef.WORLD_CUP_INFO[_local_1].icon));
                    this[("imgY" + _local_3)].visible = true;
                    _team.push(_local_1);
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get saveCal():DelayButton
        {
            return (this._1872787729saveCal);
        }

        [Bindable(event="propertyChange")]
        public function get name3():Label
        {
            return (this._104584968name3);
        }

        [Bindable(event="propertyChange")]
        public function get c1():Canvas
        {
            return (this._3118c1);
        }

        [Bindable(event="propertyChange")]
        public function get c2():Canvas
        {
            return (this._3119c2);
        }

        [Bindable(event="propertyChange")]
        public function get c3():Canvas
        {
            return (this._3120c3);
        }

        [Bindable(event="propertyChange")]
        public function get c4():Canvas
        {
            return (this._3121c4);
        }

        public function set imgSJ1(_arg_1:Image):void
        {
            var _local_2:Object = this._1185092073imgSJ1;
            if (_local_2 !== _arg_1)
            {
                this._1185092073imgSJ1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgSJ1", _local_2, _arg_1));
            };
        }

        public function set imgSJ2(_arg_1:Image):void
        {
            var _local_2:Object = this._1185092072imgSJ2;
            if (_local_2 !== _arg_1)
            {
                this._1185092072imgSJ2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgSJ2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get imgSJ1():Image
        {
            return (this._1185092073imgSJ1);
        }

        public function set name3(_arg_1:Label):void
        {
            var _local_2:Object = this._104584968name3;
            if (_local_2 !== _arg_1)
            {
                this._104584968name3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "name3", _local_2, _arg_1));
            };
        }

        private function _WorldCupCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                saveCal.label = _arg_1;
            }, "saveCal.label");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                info.text = _arg_1;
            }, "info.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                c1.toolTip = _arg_1;
            }, "c1.toolTip");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                c2.toolTip = _arg_1;
            }, "c2.toolTip");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                c3.toolTip = _arg_1;
            }, "c3.toolTip");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                c4.toolTip = _arg_1;
            }, "c4.toolTip");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                team0.text = _arg_1;
            }, "team0.text");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                team1.text = _arg_1;
            }, "team1.text");
            result[7] = binding;
            return (result);
        }

        private function _WorldCupCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.WORLD_CUP_PANEL[1];
            _local_1 = Language.WORLD_CUP_PANEL[4];
            _local_1 = Language.WORLD_CUP_PANEL[6];
            _local_1 = Language.WORLD_CUP_PANEL[6];
            _local_1 = Language.WORLD_CUP_PANEL[6];
            _local_1 = Language.WORLD_CUP_PANEL[6];
            _local_1 = Language.WORLD_CUP_PANEL[2];
            _local_1 = Language.WORLD_CUP_PANEL[3];
        }

        public function set teamInfo(_arg_1:String):void
        {
            _teamInfo = _arg_1;
        }

        public function __c2_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroup(1);
        }

        public function set c1(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3118c1;
            if (_local_2 !== _arg_1)
            {
                this._3118c1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "c1", _local_2, _arg_1));
            };
        }

        public function set c2(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3119c2;
            if (_local_2 !== _arg_1)
            {
                this._3119c2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "c2", _local_2, _arg_1));
            };
        }

        public function set c3(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3120c3;
            if (_local_2 !== _arg_1)
            {
                this._3120c3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "c3", _local_2, _arg_1));
            };
        }

        public function set c4(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3121c4;
            if (_local_2 !== _arg_1)
            {
                this._3121c4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "c4", _local_2, _arg_1));
            };
        }

        public function set info(_arg_1:Label):void
        {
            var _local_2:Object = this._3237038info;
            if (_local_2 !== _arg_1)
            {
                this._3237038info = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "info", _local_2, _arg_1));
            };
        }

        public function ___WorldCupCanvas_SimpleCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        [Bindable(event="propertyChange")]
        public function get team1():Label
        {
            return (this._110233972team1);
        }

        [Bindable(event="propertyChange")]
        public function get team0():Label
        {
            return (this._110233971team0);
        }

        public function set teamRealy(_arg_1:String):void
        {
            _teamRealy = _arg_1;
        }

        private function onCalculateWorldCupGroup(_arg_1:Event):void
        {
            var _local_2:*;
            if (_teamSure[0])
            {
                if (_team.length >= 2)
                {
                    _team = _team.shift();
                    _team.push(_teamSure[0]);
                }
                else
                {
                    _team.push(_teamSure[0]);
                };
                _local_2 = 0;
                while (_local_2 < _team.length)
                {
                    this[("imgY" + ToolKit.add(_local_2, 1))].source = ResManager.getIconUrl(parseInt(GamePredef.WORLD_CUP_INFO[_team[_local_2]].icon));
                    this[("imgY" + ToolKit.add(_local_2, 1))].visible = true;
                    _local_2++;
                };
            };
        }

        override public function initialize():void
        {
            var target:WorldCupCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _WorldCupCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_WorldCupCanvasWatcherSetupUtil");
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

        public function __c3_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroup(2);
        }

        public function set img2(_arg_1:Image):void
        {
            var _local_2:Object = this._3236047img2;
            if (_local_2 !== _arg_1)
            {
                this._3236047img2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img2", _local_2, _arg_1));
            };
        }

        public function set img3(_arg_1:Image):void
        {
            var _local_2:Object = this._3236048img3;
            if (_local_2 !== _arg_1)
            {
                this._3236048img3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img3", _local_2, _arg_1));
            };
        }

        public function set img4(_arg_1:Image):void
        {
            var _local_2:Object = this._3236049img4;
            if (_local_2 !== _arg_1)
            {
                this._3236049img4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img4", _local_2, _arg_1));
            };
        }

        public function set img1(_arg_1:Image):void
        {
            var _local_2:Object = this._3236046img1;
            if (_local_2 !== _arg_1)
            {
                this._3236046img1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img1", _local_2, _arg_1));
            };
        }

        public function set teamChar(_arg_1:Object):void
        {
            _teamChar = _arg_1;
        }

        [Bindable(event="propertyChange")]
        public function get info():Label
        {
            return (this._3237038info);
        }

        private function calculateWorldCupGroup(_arg_1:Number):void
        {
            var _local_3:*;
            if (_teamRealy)
            {
                return;
            };
            var _local_2:* = new Date().getTime();
            if (((ToolKit.minus(_local_2, _click) <= 700) && (_clickId == _arg_1)))
            {
                if (_teamSure[_arg_1])
                {
                    _local_3 = 0;
                    while (_local_3 < _team.length)
                    {
                        if (_team[_local_3] == _teamSure[_arg_1])
                        {
                            return;
                        };
                        _local_3++;
                    };
                    if (_team.length >= 2)
                    {
                        _team.shift();
                        _team.push(_teamSure[_arg_1]);
                    }
                    else
                    {
                        _team.push(_teamSure[_arg_1]);
                    };
                    _local_3 = 0;
                    while (_local_3 < _team.length)
                    {
                        this[("imgY" + ToolKit.add(_local_3, 1))].source = ResManager.getIconUrl(parseInt(GamePredef.WORLD_CUP_INFO[_team[_local_3]].icon));
                        this[("imgY" + ToolKit.add(_local_3, 1))].visible = true;
                        _local_3++;
                    };
                };
            }
            else
            {
                _click = _local_2;
                _clickId = _arg_1;
            };
        }

        [Bindable(event="propertyChange")]
        public function get img2():Image
        {
            return (this._3236047img2);
        }

        [Bindable(event="propertyChange")]
        public function get img4():Image
        {
            return (this._3236049img4);
        }

        [Bindable(event="propertyChange")]
        public function get img1():Image
        {
            return (this._3236046img1);
        }

        public function __c4_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroup(3);
        }

        [Bindable(event="propertyChange")]
        public function get img3():Image
        {
            return (this._3236048img3);
        }

        public function set teamLab(_arg_1:Label):void
        {
            var _local_2:Object = this._1439306256teamLab;
            if (_local_2 !== _arg_1)
            {
                this._1439306256teamLab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "teamLab", _local_2, _arg_1));
            };
        }

        private function saveCalculateResult():void
        {
            var _local_1:Object;
            var _local_2:Object;
            var _local_3:*;
            if (_team.length > 0)
            {
                _local_1 = new Object();
                _local_1["group"] = _group;
                _local_1["state"] = 8;
                _local_2 = new Object();
                _local_3 = 0;
                while (_local_3 < _team.length)
                {
                    _local_2[_team[_local_3]] = 1;
                    _local_3++;
                };
                _local_1["info"] = _local_2;
                _core.remote.call("updateCharWorldCupData", null, _local_1);
            };
        }

        public function set team1(_arg_1:Label):void
        {
            var _local_2:Object = this._110233972team1;
            if (_local_2 !== _arg_1)
            {
                this._110233972team1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "team1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get teamLab():Label
        {
            return (this._1439306256teamLab);
        }

        public function set team0(_arg_1:Label):void
        {
            var _local_2:Object = this._110233971team0;
            if (_local_2 !== _arg_1)
            {
                this._110233971team0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "team0", _local_2, _arg_1));
            };
        }

        public function set imgY2(_arg_1:Image):void
        {
            var _local_2:Object = this._100318716imgY2;
            if (_local_2 !== _arg_1)
            {
                this._100318716imgY2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgY2", _local_2, _arg_1));
            };
        }

        public function __saveCal_click(_arg_1:MouseEvent):void
        {
            saveCalculateResult();
        }

        [Bindable(event="propertyChange")]
        public function get imgY1():Image
        {
            return (this._100318715imgY1);
        }

        public function set group(_arg_1:String):void
        {
            _group = _arg_1;
        }


    }
}//package com.qeedoo.ui.view.comp

