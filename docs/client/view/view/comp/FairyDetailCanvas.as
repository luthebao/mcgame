// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.FairyDetailCanvas

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.FlexEvent;
    import com.qeedoo.game.logic.FairyLogic;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
    import flash.events.Event;
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

    public class FairyDetailCanvas extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _FairyDetailCanvas_BasicTxtButton4:BasicTxtButton;
        public var _FairyDetailCanvas_BasicTxtButton5:BasicTxtButton;
        private var _96515agi:Label;
        private var _3117846ener:Label;
        public var _FairyDetailCanvas_BasicTxtButton2:BasicTxtButton;
        private var _3237462inte:Label;
        public var _FairyDetailCanvas_BasicTitleCanvas1:BasicTitleCanvas;
        private var _114225str:Label;
        private var _114208sta:Label;
        private var _fairy:Object;
        private var _p:DragableCanvas;
        public var _FairyDetailCanvas_BasicTxtButton1:BasicTxtButton;
        public var _FairyDetailCanvas_BasicTxtButton3:BasicTxtButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":230,
                    "height":190,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_FairyDetailCanvas_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"str",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "left";
                            this.color = 0xFF00;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":40,
                                "width":60,
                                "x":135,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_FairyDetailCanvas_BasicTxtButton1",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 1;
                            this.paddingRight = 1;
                            this.right = "110";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":40,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"sta",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "left";
                            this.color = 0xFF00;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":65,
                                "width":60,
                                "x":135,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_FairyDetailCanvas_BasicTxtButton2",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 1;
                            this.paddingRight = 1;
                            this.right = "110";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":65,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"agi",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "left";
                            this.color = 0xFF00;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":90,
                                "width":60,
                                "x":135,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_FairyDetailCanvas_BasicTxtButton3",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 1;
                            this.paddingRight = 1;
                            this.right = "110";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":90,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"inte",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "left";
                            this.color = 0xFF00;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":115,
                                "width":60,
                                "x":135,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_FairyDetailCanvas_BasicTxtButton4",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 1;
                            this.paddingRight = 1;
                            this.right = "110";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":115,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"ener",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "left";
                            this.color = 0xFF00;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":140,
                                "width":60,
                                "x":135,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_FairyDetailCanvas_BasicTxtButton5",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 1;
                            this.paddingRight = 1;
                            this.right = "110";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":140,
                                "height":18
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

        public function FairyDetailCanvas()
        {
            mx_internal::_document = this;
            this.width = 230;
            this.height = 190;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            FairyDetailCanvas._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get agi():Label
        {
            return (this._96515agi);
        }

        public function set str(_arg_1:Label):void
        {
            var _local_2:Object = this._114225str;
            if (_local_2 !== _arg_1)
            {
                this._114225str = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "str", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:FairyDetailCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _FairyDetailCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_FairyDetailCanvasWatcherSetupUtil");
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

        public function set agi(_arg_1:Label):void
        {
            var _local_2:Object = this._96515agi;
            if (_local_2 !== _arg_1)
            {
                this._96515agi = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "agi", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get ener():Label
        {
            return (this._3117846ener);
        }

        private function initCre(_arg_1:FlexEvent):void
        {
            this.fairy = _fairy;
            _fairy = null;
        }

        [Bindable(event="propertyChange")]
        public function get sta():Label
        {
            return (this._114208sta);
        }

        public function set fairy(_arg_1:Object):void
        {
            if (!initialized)
            {
                _fairy = _arg_1;
                this.addEventListener(FlexEvent.CREATION_COMPLETE, initCre);
                return;
            };
            var _local_2:int = FairyLogic.gexpToLv(_arg_1.gexp);
            var _local_3:int = int(Math.round((_arg_1.doh / 100)));
            var _local_4:Number = ((GamePredef.FAIRY_COLOR_EFFECT[Math.floor((((_local_2 == 0) ? 0 : (_local_2 - 1)) / 10))] * (1 - (((75 > _local_3) ? (75 - _local_3) : 0) / 75))) / 100);
            str.text = ("+ " + String(Math.round((_local_4 * (Number(_arg_1.ste) + ((FairyLogic.expToLv(_arg_1.exp) - 1) * (_arg_1.steG - (-0.2 * _local_2))))))));
            sta.text = ("+ " + String(Math.round((_local_4 * (Number(_arg_1.sta) + ((FairyLogic.expToLv(_arg_1.exp) - 1) * (_arg_1.staG - (-0.2 * _local_2))))))));
            agi.text = ("+ " + String(Math.round((_local_4 * (Number(_arg_1.agi) + ((FairyLogic.expToLv(_arg_1.exp) - 1) * (_arg_1.agiG - (-0.2 * _local_2))))))));
            inte.text = ("+ " + String(Math.round((_local_4 * (Number(_arg_1.inte) + ((FairyLogic.expToLv(_arg_1.exp) - 1) * (_arg_1.inteG - (-0.2 * _local_2))))))));
            ener.text = ("+ " + String(Math.round((_local_4 * (Number(_arg_1.ener) + ((FairyLogic.expToLv(_arg_1.exp) - 1) * (_arg_1.enerG - (-0.2 * _local_2))))))));
        }

        private function _FairyDetailCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[31];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyDetailCanvas_BasicTitleCanvas1.text = _arg_1;
            }, "_FairyDetailCanvas_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.FAIRY_MANAGER_PANEL_U[53] + Language.FAIRY_MANAGER_PANEL_U[11]);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyDetailCanvas_BasicTxtButton1.label = _arg_1;
            }, "_FairyDetailCanvas_BasicTxtButton1.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.FAIRY_MANAGER_PANEL_U[53] + Language.FAIRY_MANAGER_PANEL_U[9]);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyDetailCanvas_BasicTxtButton2.label = _arg_1;
            }, "_FairyDetailCanvas_BasicTxtButton2.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.FAIRY_MANAGER_PANEL_U[53] + Language.FAIRY_MANAGER_PANEL_U[13]);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyDetailCanvas_BasicTxtButton3.label = _arg_1;
            }, "_FairyDetailCanvas_BasicTxtButton3.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.FAIRY_MANAGER_PANEL_U[53] + Language.FAIRY_MANAGER_PANEL_U[15]);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyDetailCanvas_BasicTxtButton4.label = _arg_1;
            }, "_FairyDetailCanvas_BasicTxtButton4.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.FAIRY_MANAGER_PANEL_U[53] + Language.FAIRY_MANAGER_PANEL_U[17]);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyDetailCanvas_BasicTxtButton5.label = _arg_1;
            }, "_FairyDetailCanvas_BasicTxtButton5.label");
            result[5] = binding;
            return (result);
        }

        public function follow(_arg_1:DragableCanvas):void
        {
            _p = _arg_1;
            this.x = (_arg_1.x + _arg_1.width);
            this.y = _arg_1.y;
            if (this.visible)
            {
                _arg_1.addEventListener(DragableCanvas.EVENT_MOVE, onMove);
            };
        }

        public function set sta(_arg_1:Label):void
        {
            var _local_2:Object = this._114208sta;
            if (_local_2 !== _arg_1)
            {
                this._114208sta = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sta", _local_2, _arg_1));
            };
        }

        public function hide():void
        {
            this.visible = false;
        }

        public function set ener(_arg_1:Label):void
        {
            var _local_2:Object = this._3117846ener;
            if (_local_2 !== _arg_1)
            {
                this._3117846ener = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ener", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get str():Label
        {
            return (this._114225str);
        }

        public function set inte(_arg_1:Label):void
        {
            var _local_2:Object = this._3237462inte;
            if (_local_2 !== _arg_1)
            {
                this._3237462inte = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "inte", _local_2, _arg_1));
            };
        }

        private function onMove(_arg_1:Event):void
        {
            this.x = (_p.x + _p.width);
            this.y = _p.y;
        }

        [Bindable(event="propertyChange")]
        public function get inte():Label
        {
            return (this._3237462inte);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            if (_p)
            {
                super.visible = _arg_1;
                if (_arg_1)
                {
                    follow(_p);
                    if (this.parent)
                    {
                        this.parent.setChildIndex(this, (this.parent.numChildren - 1));
                    };
                }
                else
                {
                    _p.removeEventListener(DragableCanvas.EVENT_MOVE, onMove);
                };
            }
            else
            {
                super.visible = false;
            };
        }

        private function _FairyDetailCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[31];
            _local_1 = (Language.FAIRY_MANAGER_PANEL_U[53] + Language.FAIRY_MANAGER_PANEL_U[11]);
            _local_1 = (Language.FAIRY_MANAGER_PANEL_U[53] + Language.FAIRY_MANAGER_PANEL_U[9]);
            _local_1 = (Language.FAIRY_MANAGER_PANEL_U[53] + Language.FAIRY_MANAGER_PANEL_U[13]);
            _local_1 = (Language.FAIRY_MANAGER_PANEL_U[53] + Language.FAIRY_MANAGER_PANEL_U[15]);
            _local_1 = (Language.FAIRY_MANAGER_PANEL_U[53] + Language.FAIRY_MANAGER_PANEL_U[17]);
        }


    }
}//package com.qeedoo.ui.view.comp

