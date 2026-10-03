// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.PetSoulCanvas

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import mx.core.UIComponent;
    import mx.controls.Label;
    import mx.controls.LinkButton;
    import flash.display.Loader;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.adobe.crypto.MD5;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.ui.resource.ResManager;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
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

    public class PetSoulCanvas extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var iconCode:Number;
        public var _PetSoulCanvas_Image1:Image;
        private var soulIcon:UIComponent;
        private var _1891404463soulLevel:Label;
        private var _1740157726soulName:Label;
        protected var _toolTip:Object;
        private var _100313435image:Image;
        private var _578058629pickBtn:LinkButton;
        private var _1322534916resovleBtn:LinkButton;
        private var index:int;
        public var _resLoader:Loader;
        private var soulId:int;
        public var soul:SoulSprite;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":85,
                    "height":100,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"_PetSoulCanvas_Image1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":0,
                                "percentWidth":100,
                                "percentHeight":100
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"image",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":8,
                                "y":2,
                                "percentWidth":100,
                                "percentHeight":100
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"soulName",
                        "stylesFactory":function ():void
                        {
                            this.color = 16775802;
                            this.horizontalCenter = "0";
                            this.fontSize = 11;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":26,
                                "y":47,
                                "text":""
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"soulLevel",
                        "stylesFactory":function ():void
                        {
                            this.color = 16775802;
                            this.horizontalCenter = "0";
                            this.fontSize = 11;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":26,
                                "y":60,
                                "text":""
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":LinkButton,
                        "id":"pickBtn",
                        "events":{"click":"__pickBtn_click"},
                        "stylesFactory":function ():void
                        {
                            this.left = "5";
                            this.bottom = "5";
                            this.textDecoration = "underline";
                            this.fontSize = 12;
                            this.fontWeight = "normal";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"visible":false});
                        }
                    }), new UIComponentDescriptor({
                        "type":LinkButton,
                        "id":"resovleBtn",
                        "events":{"click":"__resovleBtn_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "5";
                            this.bottom = "5";
                            this.textDecoration = "underline";
                            this.fontSize = 12;
                            this.fontWeight = "normal";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"visible":false});
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var imgBg:Class = PetSoulCanvas_imgBg;
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PetSoulCanvas()
        {
            mx_internal::_document = this;
            this.styleName = "BtnStdRed";
            this.width = 85;
            this.height = 100;
            this.addEventListener("creationComplete", ___PetSoulCanvas_Canvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PetSoulCanvas._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get resovleBtn():LinkButton
        {
            return (this._1322534916resovleBtn);
        }

        private function transformExpInPanel():void
        {
            var gfunc:Function;
            var func:Function;
            if (!_core.delPass)
            {
                gfunc = function (_arg_1:String):void
                {
                    _core.remote.call("unlockMoney", null, MD5.hash(_arg_1));
                };
                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.DELETE_BY_PASS[1], gfunc);
                return;
            };
            var temp:Object = GameData.d[GamePredef.TBL_PET_SOUL][soulId];
            if (Number(temp.color) > 1)
            {
                func = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        _core.remote.call("transformExpInPanel", null, index);
                    };
                };
                Alert.show(Language.PET_SOUL_S[40].replace("{name}", temp.name), "", (Alert.YES | Alert.NO), null, func);
            }
            else
            {
                _core.remote.call("transformExpInPanel", null, index);
            };
        }

        override public function initialize():void
        {
            var target:PetSoulCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PetSoulCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_PetSoulCanvasWatcherSetupUtil");
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
        public function get soulName():Label
        {
            return (this._1740157726soulName);
        }

        public function init():void
        {
            var _local_2:String;
            var _local_1:Object = GameData.d[GamePredef.TBL_PET_SOUL][soulId];
            if (!_local_1)
            {
                return;
            };
            if (((_local_1) && (_local_1["iconCode"])))
            {
                iconCode = _local_1["iconCode"];
                _local_2 = ResManager.getResUrlNoHash(iconCode);
                soul = new SoulSprite();
                soul.show(_local_2);
                soulIcon = new UIComponent();
                soulIcon.addChild(soul);
                this.image.addChild(soulIcon);
            };
            if (GameData.d[GamePredef.TBL_PET_SOUL][soulId]["color"] < 0)
            {
                pickBtn.visible = false;
                resovleBtn.x = 25;
            }
            else
            {
                pickBtn.visible = true;
                resovleBtn.x = 50;
            };
            resovleBtn.visible = true;
            soulName.text = _local_1.name;
            soulLevel.text = ("Lv." + _local_1.level);
            soulName.setStyle("color", GamePredef.CODE_SOUL_COLOR[_local_1.color]);
            soulLevel.setStyle("color", GamePredef.CODE_SOUL_COLOR[_local_1.color]);
            image.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
            image.addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
        }

        public function mouseOutHandler(_arg_1:MouseEvent):void
        {
            if (_toolTip)
            {
                _toolTip.hide();
            };
        }

        public function set soulLevel(_arg_1:Label):void
        {
            var _local_2:Object = this._1891404463soulLevel;
            if (_local_2 !== _arg_1)
            {
                this._1891404463soulLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "soulLevel", _local_2, _arg_1));
            };
        }

        public function setData(_arg_1:Object):void
        {
            soulId = _arg_1.soulId;
            index = _arg_1.index;
        }

        public function set image(_arg_1:Image):void
        {
            var _local_2:Object = this._100313435image;
            if (_local_2 !== _arg_1)
            {
                this._100313435image = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "image", _local_2, _arg_1));
            };
        }

        private function showSoulToolTip():void
        {
            var _local_1:Object;
            var _local_2:Object;
            if (((((_toolTip) && (_toolTip.tipData)) && (_toolTip.tipData.temp)) && (_toolTip.tipData.temp.id == soulId)))
            {
                _toolTip.show();
            };
            if (_core.data.hasData(GamePredef.TBL_PET_SOUL, soulId))
            {
                _local_2 = {};
                _local_2.temp = GameData.d[GamePredef.TBL_PET_SOUL][soulId];
                _toolTip = _core.view.getUI(ViewManager.TOOLTIP_PET_SOUL);
                _toolTip.object = _local_2;
                _toolTip.show();
            };
        }

        public function set soulName(_arg_1:Label):void
        {
            var _local_2:Object = this._1740157726soulName;
            if (_local_2 !== _arg_1)
            {
                this._1740157726soulName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "soulName", _local_2, _arg_1));
            };
        }

        private function putToSoulBag():void
        {
            _core.remote.call("putSoulToBag", null, index);
        }

        private function _PetSoulCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = imgBg;
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.PET_SOUL_S[6];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.PET_SOUL_S[4];
        }

        [Bindable(event="propertyChange")]
        public function get soulLevel():Label
        {
            return (this._1891404463soulLevel);
        }

        public function ___PetSoulCanvas_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        private function _PetSoulCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (imgBg);
            }, function (_arg_1:Object):void
            {
                _PetSoulCanvas_Image1.source = _arg_1;
            }, "_PetSoulCanvas_Image1.source");
            result[0] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                pickBtn.setStyle("overSkin", _arg_1);
            }, "pickBtn.overSkin");
            result[1] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                pickBtn.setStyle("upSkin", _arg_1);
            }, "pickBtn.upSkin");
            result[2] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                pickBtn.setStyle("downSkin", _arg_1);
            }, "pickBtn.downSkin");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_SOUL_S[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                pickBtn.label = _arg_1;
            }, "pickBtn.label");
            result[4] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                resovleBtn.setStyle("overSkin", _arg_1);
            }, "resovleBtn.overSkin");
            result[5] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                resovleBtn.setStyle("upSkin", _arg_1);
            }, "resovleBtn.upSkin");
            result[6] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                resovleBtn.setStyle("downSkin", _arg_1);
            }, "resovleBtn.downSkin");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_SOUL_S[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                resovleBtn.label = _arg_1;
            }, "resovleBtn.label");
            result[8] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get image():Image
        {
            return (this._100313435image);
        }

        public function __pickBtn_click(_arg_1:MouseEvent):void
        {
            putToSoulBag();
        }

        public function __resovleBtn_click(_arg_1:MouseEvent):void
        {
            transformExpInPanel();
        }

        public function mouseOverHandler(_arg_1:MouseEvent):void
        {
            showSoulToolTip();
        }

        public function set resovleBtn(_arg_1:LinkButton):void
        {
            var _local_2:Object = this._1322534916resovleBtn;
            if (_local_2 !== _arg_1)
            {
                this._1322534916resovleBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "resovleBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pickBtn():LinkButton
        {
            return (this._578058629pickBtn);
        }

        public function set pickBtn(_arg_1:LinkButton):void
        {
            var _local_2:Object = this._578058629pickBtn;
            if (_local_2 !== _arg_1)
            {
                this._578058629pickBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pickBtn", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.comp

