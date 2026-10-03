// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.StarInstanceCanvas

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import mx.controls.Button;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.binding.Binding;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
    import flash.events.MouseEvent;
    import com.qeedoo.game.predef.GamePredef;
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

    public class StarInstanceCanvas extends SimpleCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _enabled:Boolean = false;
        private var _705847778imgStar3:Image;
        private var _scoreNum:uint = 0;
        private var _3005871auto:Button;
        private var _878708453txtName:Label;
        public var _isClick:Boolean = false;
        private var _705847776imgStar5:Image;
        private var _721510293imgBuild:MyButton;
        private var _705847779imgStar2:Image;
        private var _1472332155_level:int = 1;
        private var _name:String = "";
        private var _705847780imgStar1:Image;
        private var _705847777imgStar4:Image;
        private var _1396158280battle:Button;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":180,
                    "height":168,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Label,
                        "id":"txtName",
                        "stylesFactory":function ():void
                        {
                            this.color = 16261152;
                            this.fontSize = 16;
                            this.fontFamily = "Tahoma";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":50,
                                "y":112
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"imgStar1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":20,
                                "y":135,
                                "width":20,
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"imgStar2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":50,
                                "y":135,
                                "width":20,
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"imgStar3",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":80,
                                "y":135,
                                "width":20,
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"imgStar4",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":110,
                                "y":135,
                                "width":20,
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"imgStar5",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":140,
                                "y":135,
                                "width":20,
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":MyButton,
                        "id":"imgBuild",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":20,
                                "y":10,
                                "width":130,
                                "height":100
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"battle",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":41,
                                "y":82,
                                "label":"Fight",
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"auto",
                        "events":{
                            "mouseOver":"__auto_mouseOver",
                            "mouseOut":"__auto_mouseOut"
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":85,
                                "y":82,
                                "label":"Auto",
                                "visible":false
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

        public function StarInstanceCanvas()
        {
            mx_internal::_document = this;
            this.width = 180;
            this.height = 168;
            this.addEventListener("creationComplete", ___StarInstanceCanvas_SimpleCanvas1_creationComplete);
            this.addEventListener("rollOut", ___StarInstanceCanvas_SimpleCanvas1_rollOut);
            this.addEventListener("rollOver", ___StarInstanceCanvas_SimpleCanvas1_rollOver);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            StarInstanceCanvas._watcherSetupUtil = _arg_1;
        }


        public function get enable():Boolean
        {
            return (this._enabled);
        }

        public function set level(_arg_1:int):void
        {
            _level = _arg_1;
            resetStarName();
        }

        private function set _level(_arg_1:int):void
        {
            var _local_2:Object = this._1472332155_level;
            if (_local_2 !== _arg_1)
            {
                this._1472332155_level = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_level", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get _level():int
        {
            return (this._1472332155_level);
        }

        private function _StarInstanceCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (ResManager.IMG_STARS_INS_LIGHT);
            }, function (_arg_1:Object):void
            {
                imgStar1.source = _arg_1;
            }, "imgStar1.source");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.IMG_STARS_INS_LIGHT);
            }, function (_arg_1:Object):void
            {
                imgStar2.source = _arg_1;
            }, "imgStar2.source");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.IMG_STARS_INS_LIGHT);
            }, function (_arg_1:Object):void
            {
                imgStar3.source = _arg_1;
            }, "imgStar3.source");
            result[2] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.IMG_STARS_INS_LIGHT);
            }, function (_arg_1:Object):void
            {
                imgStar4.source = _arg_1;
            }, "imgStar4.source");
            result[3] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.IMG_STARS_INS_LIGHT);
            }, function (_arg_1:Object):void
            {
                imgStar5.source = _arg_1;
            }, "imgStar5.source");
            result[4] = binding;
            return (result);
        }

        override public function set enabled(_arg_1:Boolean):void
        {
            super.enabled = true;
            this._enabled = _arg_1;
            if (this.imgBuild)
            {
                this.imgBuild.enabled = _arg_1;
            };
            if (!_arg_1)
            {
                this.toolTip = Language.STAR_BATTLE[0].toString().replace("{name}", _name).replace("{level}", _level);
            }
            else
            {
                this.toolTip = "";
            };
        }

        override public function initialize():void
        {
            var target:StarInstanceCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _StarInstanceCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_StarInstanceCanvasWatcherSetupUtil");
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

        public function ___StarInstanceCanvas_SimpleCanvas1_rollOut(_arg_1:MouseEvent):void
        {
            autoVisible(2);
        }

        public function __auto_mouseOut(_arg_1:MouseEvent):void
        {
            mousePosistionChange(2);
        }

        [Bindable(event="propertyChange")]
        public function get txtName():Label
        {
            return (this._878708453txtName);
        }

        [Bindable(event="propertyChange")]
        public function get imgStar1():Image
        {
            return (this._705847780imgStar1);
        }

        [Bindable(event="propertyChange")]
        public function get imgStar2():Image
        {
            return (this._705847779imgStar2);
        }

        [Bindable(event="propertyChange")]
        public function get imgStar3():Image
        {
            return (this._705847778imgStar3);
        }

        private function init():void
        {
            txtName.filters = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
        }

        [Bindable(event="propertyChange")]
        public function get imgStar4():Image
        {
            return (this._705847777imgStar4);
        }

        public function set starNum(_arg_1:uint):void
        {
            this._scoreNum = _arg_1;
            var _local_2:uint = 1;
            if (_arg_1 > 90)
            {
                _local_2 = 5;
            }
            else
            {
                if (_arg_1 > 80)
                {
                    _local_2 = 4;
                }
                else
                {
                    if (_arg_1 > 60)
                    {
                        _local_2 = 3;
                    }
                    else
                    {
                        if (_arg_1 > 30)
                        {
                            _local_2 = 2;
                        };
                    };
                };
            };
            var _local_3:uint = 1;
            while (_local_3 < 6)
            {
                if (_arg_1 == 0)
                {
                    this[("imgStar" + _local_3)].visible = false;
                }
                else
                {
                    this[("imgStar" + _local_3)].visible = true;
                };
                if (_local_3 > _local_2)
                {
                    this[("imgStar" + _local_3)].source = ResManager.IMG_STARS_INS_DARK;
                }
                else
                {
                    this[("imgStar" + _local_3)].source = ResManager.IMG_STARS_INS_LIGHT;
                };
                _local_3++;
            };
        }

        public function ___StarInstanceCanvas_SimpleCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        [Bindable(event="propertyChange")]
        public function get auto():Button
        {
            return (this._3005871auto);
        }

        public function set txtName(_arg_1:Label):void
        {
            var _local_2:Object = this._878708453txtName;
            if (_local_2 !== _arg_1)
            {
                this._878708453txtName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtName", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get battle():Button
        {
            return (this._1396158280battle);
        }

        private function _StarInstanceCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = ResManager.IMG_STARS_INS_LIGHT;
            _local_1 = ResManager.IMG_STARS_INS_LIGHT;
            _local_1 = ResManager.IMG_STARS_INS_LIGHT;
            _local_1 = ResManager.IMG_STARS_INS_LIGHT;
            _local_1 = ResManager.IMG_STARS_INS_LIGHT;
        }

        public function set imgStar3(_arg_1:Image):void
        {
            var _local_2:Object = this._705847778imgStar3;
            if (_local_2 !== _arg_1)
            {
                this._705847778imgStar3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgStar3", _local_2, _arg_1));
            };
        }

        public function set imgStar4(_arg_1:Image):void
        {
            var _local_2:Object = this._705847777imgStar4;
            if (_local_2 !== _arg_1)
            {
                this._705847777imgStar4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgStar4", _local_2, _arg_1));
            };
        }

        public function set imgStar2(_arg_1:Image):void
        {
            var _local_2:Object = this._705847779imgStar2;
            if (_local_2 !== _arg_1)
            {
                this._705847779imgStar2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgStar2", _local_2, _arg_1));
            };
        }

        public function autoVisible(_arg_1:int):void
        {
            if (_arg_1 == 1)
            {
                if (this._enabled)
                {
                    this.battle.visible = true;
                    this.auto.visible = true;
                }
                else
                {
                    this.battle.visible = false;
                    this.auto.visible = false;
                };
            }
            else
            {
                this.battle.visible = false;
                this.auto.visible = false;
            };
        }

        public function set imgStar1(_arg_1:Image):void
        {
            var _local_2:Object = this._705847780imgStar1;
            if (_local_2 !== _arg_1)
            {
                this._705847780imgStar1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgStar1", _local_2, _arg_1));
            };
        }

        public function ___StarInstanceCanvas_SimpleCanvas1_rollOver(_arg_1:MouseEvent):void
        {
            autoVisible(1);
        }

        [Bindable(event="propertyChange")]
        public function get imgStar5():Image
        {
            return (this._705847776imgStar5);
        }

        public function set imgStar5(_arg_1:Image):void
        {
            var _local_2:Object = this._705847776imgStar5;
            if (_local_2 !== _arg_1)
            {
                this._705847776imgStar5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgStar5", _local_2, _arg_1));
            };
        }

        public function set imgBuild(_arg_1:MyButton):void
        {
            var _local_2:Object = this._721510293imgBuild;
            if (_local_2 !== _arg_1)
            {
                this._721510293imgBuild = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgBuild", _local_2, _arg_1));
            };
        }

        public function set auto(_arg_1:Button):void
        {
            var _local_2:Object = this._3005871auto;
            if (_local_2 !== _arg_1)
            {
                this._3005871auto = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "auto", _local_2, _arg_1));
            };
        }

        public function set resCode(_arg_1:*):void
        {
            imgBuild.skin = _arg_1;
        }

        [Bindable(event="propertyChange")]
        public function get imgBuild():MyButton
        {
            return (this._721510293imgBuild);
        }

        private function resetStarName():void
        {
            txtName.text = ((_name + " LV") + _level);
        }

        public function set battle(_arg_1:Button):void
        {
            var _local_2:Object = this._1396158280battle;
            if (_local_2 !== _arg_1)
            {
                this._1396158280battle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battle", _local_2, _arg_1));
            };
        }

        public function __auto_mouseOver(_arg_1:MouseEvent):void
        {
            mousePosistionChange(1);
        }

        public function set starName(_arg_1:String):void
        {
            _name = _arg_1;
            resetStarName();
        }

        private function mousePosistionChange(_arg_1:int):void
        {
            if (((this._enabled) && (_arg_1 == 1)))
            {
                this._isClick = true;
            }
            else
            {
                this._isClick = false;
            };
        }


    }
}//package com.qeedoo.ui.view.comp

