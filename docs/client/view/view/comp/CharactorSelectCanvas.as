// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.CharactorSelectCanvas

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
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

    public class CharactorSelectCanvas extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _CharactorSelectCanvas_RoundedLabel2:RoundedLabel;
        public var _CharactorSelectCanvas_RoundedLabel3:RoundedLabel;
        private var _1387368223cLevel:String;
        private var _3560248tips:String = "";
        public var deleted:Boolean = false;
        public var _CharactorSelectCanvas_Image1:Image;
        private var _252017581cIconUrl:String;
        public var cid:Number;
        private var _93848974cName:String;
        public var cImgUrl:String;
        private var _1395491115cClass:String;
        public var _CharactorSelectCanvas_RoundedLabel1:RoundedLabel;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":129,
                    "height":67,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"_CharactorSelectCanvas_Image1",
                        "stylesFactory":function ():void
                        {
                            this.verticalCenter = "-2";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":12,
                                "width":49,
                                "height":47,
                                "scaleContent":true
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_CharactorSelectCanvas_RoundedLabel1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":61,
                                "y":5,
                                "width":58
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_CharactorSelectCanvas_RoundedLabel2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":61,
                                "y":24,
                                "width":58
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_CharactorSelectCanvas_RoundedLabel3",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":61,
                                "y":41,
                                "width":58
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

        public function CharactorSelectCanvas()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.borderStyle = "none";
                this.borderColor = 0;
            };
            this.width = 129;
            this.height = 67;
            this.styleName = "CanvasStartBtnBack";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            CharactorSelectCanvas._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get cName():String
        {
            return (this._93848974cName);
        }

        override public function initialize():void
        {
            var target:CharactorSelectCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _CharactorSelectCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_CharactorSelectCanvasWatcherSetupUtil");
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

        public function set cName(_arg_1:String):void
        {
            var _local_2:Object = this._93848974cName;
            if (_local_2 !== _arg_1)
            {
                this._93848974cName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cName", _local_2, _arg_1));
            };
        }

        private function _CharactorSelectCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = cIconUrl;
            _local_1 = cName;
            _local_1 = ("LV " + cLevel);
            _local_1 = cClass;
        }

        public function set cIconUrl(_arg_1:String):void
        {
            var _local_2:Object = this._252017581cIconUrl;
            if (_local_2 !== _arg_1)
            {
                this._252017581cIconUrl = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cIconUrl", _local_2, _arg_1));
            };
        }

        public function set cClass(_arg_1:String):void
        {
            var _local_2:Object = this._1395491115cClass;
            if (_local_2 !== _arg_1)
            {
                this._1395491115cClass = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cClass", _local_2, _arg_1));
            };
        }

        public function set selected(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                filters = [GamePredef.FILTER_CHAR_SELECTED];
            }
            else
            {
                filters = [];
            };
        }

        [Bindable(event="propertyChange")]
        public function get tips():String
        {
            return (this._3560248tips);
        }

        public function set cLevel(_arg_1:String):void
        {
            var _local_2:Object = this._1387368223cLevel;
            if (_local_2 !== _arg_1)
            {
                this._1387368223cLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cLevel", _local_2, _arg_1));
            };
        }

        private function update(_arg_1:Object):void
        {
            var _local_4:Date;
            var _local_5:String;
            var _local_2:Object = _core.data.getGameDataList(GamePredef.TBL_CLASS);
            if (!_local_2)
            {
                callLater(update, [_arg_1]);
                return;
            };
            if (((_arg_1.delTime) && (_arg_1.delTime > 0)))
            {
                this.alpha = 0.5;
                _local_4 = new Date((_arg_1.delTime * 1000));
                _local_5 = "";
                _local_5 = Language.CHARACTOR_DELETE[0].replace("{year}", int(_local_4.getFullYear()));
                _local_5 = _local_5.replace("{month}", int(ToolKit.add(_local_4.getMonth(), 1)));
                _local_5 = _local_5.replace("{dates}", int(_local_4.getDate()));
                _local_5 = _local_5.replace("{hour}", int(_local_4.getHours()));
                _local_5 = _local_5.replace("{minutes}", int(_local_4.getMinutes()));
                _local_5 = _local_5.replace("{cname}", _arg_1.name);
                this.tips = _local_5;
                deleted = true;
            }
            else
            {
                this.tips = "";
            };
            cName = _arg_1.name;
            cLevel = _core.basic.expToLevel(_arg_1.exp).toString();
            cClass = _local_2[_arg_1.classId].name;
            var _local_3:Number = Number(((Number(_arg_1.gender) <= 0) ? _local_2[_arg_1.classId].largeImgMale : _local_2[_arg_1.classId].largeImgFemale));
            cImgUrl = ResManager.getIconUrl(_local_3);
            cIconUrl = ResManager.getIconUrl(_arg_1.iconCode);
            cid = Number(_arg_1.id);
        }

        [Bindable(event="propertyChange")]
        public function get cIconUrl():String
        {
            return (this._252017581cIconUrl);
        }

        [Bindable(event="propertyChange")]
        public function get cClass():String
        {
            return (this._1395491115cClass);
        }

        public function set cData(_arg_1:Object):void
        {
            update(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get cLevel():String
        {
            return (this._1387368223cLevel);
        }

        private function _CharactorSelectCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (cIconUrl);
            }, function (_arg_1:Object):void
            {
                _CharactorSelectCanvas_Image1.source = _arg_1;
            }, "_CharactorSelectCanvas_Image1.source");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = cName;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorSelectCanvas_RoundedLabel1.text = _arg_1;
            }, "_CharactorSelectCanvas_RoundedLabel1.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ("LV " + cLevel);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorSelectCanvas_RoundedLabel2.text = _arg_1;
            }, "_CharactorSelectCanvas_RoundedLabel2.text");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = cClass;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorSelectCanvas_RoundedLabel3.text = _arg_1;
            }, "_CharactorSelectCanvas_RoundedLabel3.text");
            result[3] = binding;
            return (result);
        }

        public function set tips(_arg_1:String):void
        {
            var _local_2:Object = this._3560248tips;
            if (_local_2 !== _arg_1)
            {
                this._3560248tips = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tips", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.comp

