// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.TipPetStone

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.core.IToolTip;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.controls.Image;
    import mx.containers.VBox;
    import mx.core.UIComponentDescriptor;
    import mx.containers.HBox;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.ResizeEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.data.GameData;
    import mx.controls.TextArea;
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

    public class TipPetStone extends BasicToolTip implements IBindingClient, IToolTip 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1577342312stoneProp:Label;
        private var _1577119358stoneIcon:Image;
        public var _TipPetStone_Label2:Label;
        private var _1577266320stoneName:Label;
        private var _506577178varContainer:VBox;
        private var _obj:Object;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":BasicToolTip,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":VBox,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "mouseChildren":false,
                                "mouseEnabled":false,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":HBox,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"stoneIcon",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":32,
                                                        "height":32
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"stoneName"
                                            })]});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_TipPetStone_Label2",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "text":"Thuộc tính bảo thạch:",
                                            "mouseEnabled":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"stoneProp",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"mouseEnabled":false});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":VBox,
                                    "id":"varContainer"
                                })]
                            });
                        }
                    })]});
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TipPetStone()
        {
            mx_internal::_document = this;
            this.styleName = "CanvasToolTip";
            this.addEventListener("resize", ___TipPetStone_BasicToolTip1_resize);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TipPetStone._watcherSetupUtil = _arg_1;
        }


        public function set stoneIcon(_arg_1:Image):void
        {
            var _local_2:Object = this._1577119358stoneIcon;
            if (_local_2 !== _arg_1)
            {
                this._1577119358stoneIcon = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stoneIcon", _local_2, _arg_1));
            };
        }

        public function set stoneProp(_arg_1:Label):void
        {
            var _local_2:Object = this._1577342312stoneProp;
            if (_local_2 !== _arg_1)
            {
                this._1577342312stoneProp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stoneProp", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get stoneIcon():Image
        {
            return (this._1577119358stoneIcon);
        }

        override public function initialize():void
        {
            var target:TipPetStone;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TipPetStone_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_TipPetStoneWatcherSetupUtil");
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

        public function ___TipPetStone_BasicToolTip1_resize(_arg_1:ResizeEvent):void
        {
            setPos();
        }

        private function _TipPetStone_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
        }

        private function setTemp(_arg_1:Object):void
        {
            var _local_4:*;
            var _local_5:Number;
            var _local_6:Object;
            var _local_7:*;
            var _local_8:Object;
            var _local_9:*;
            var _local_10:Number;
            var _local_11:Object;
            stoneIcon.source = ResManager.getIconUrl(_arg_1.temp.iconCode);
            var _local_2:Number = (Number(_arg_1.temp.level) - 1);
            var _local_3:String = GamePredef.MSG_ITEM_COLOR[_local_2];
            stoneName.setStyle("color", _local_3);
            stoneName.text = _arg_1.temp.name;
            stoneProp.text = ((Language.PET_STONE_PANEL[4][_arg_1.temp["propType"]] + "+") + _arg_1.temp["propNum"]);
            if (varContainer.numChildren > 0)
            {
                varContainer.removeAllChildren();
            };
            if (Number(_arg_1.temp.level) < 5)
            {
                _local_4 = new Label();
                _local_4.text = "Thuộc tính sau:";
                _local_4.setStyle("color", "#FFFF00");
                _local_4.filters = [GamePredef.FILTER_GLOW_LOWBLACK];
                varContainer.addChild(_local_4);
                _local_5 = Number(_arg_1.temp.nextId);
                _local_6 = GameData.d[GamePredef.TBL_PET_STONE][_local_5];
                _local_7 = new Label();
                _local_7.text = ((Language.PET_STONE_PANEL[4][_local_6["propType"]] + "+") + _local_6["propNum"]);
                _local_7.setStyle("color", "#00ffff");
                _local_7.filters = [GamePredef.FILTER_GLOW_LOWBLACK];
                varContainer.addChild(_local_7);
            }
            else
            {
                if (Number(_arg_1.temp.level) == 5)
                {
                    _local_4 = new Label();
                    _local_4.text = "Được Tụ Linh";
                    _local_4.setStyle("color", "#FFFF00");
                    _local_4.filters = [GamePredef.FILTER_GLOW_LOWBLACK];
                    varContainer.addChild(_local_4);
                }
                else
                {
                    if (((Number(_arg_1.temp.level) == 6) && (_arg_1.skillId < 1)))
                    {
                        _local_4 = new Label();
                        _local_4.text = "Được Luyện";
                        _local_4.setStyle("color", "#FFFF00");
                        _local_4.filters = [GamePredef.FILTER_GLOW_LOWBLACK];
                        varContainer.addChild(_local_4);
                    }
                    else
                    {
                        if (((Number(_arg_1.temp.level) == 6) && (_arg_1.skillId >= 1)))
                        {
                            _local_4 = new Label();
                            _local_4.text = "K.Năng TLinh：";
                            _local_4.setStyle("color", "#FFFF00");
                            _local_4.filters = [GamePredef.FILTER_GLOW_LOWBLACK];
                            varContainer.addChild(_local_4);
                            _local_7 = new Label();
                            _local_8 = GameData.d[GamePredef.TBL_SKILL][_arg_1.skillId];
                            _local_7.text = _local_8.name;
                            _local_7.setStyle("color", "#00ffff");
                            _local_7.filters = [GamePredef.FILTER_GLOW_LOWBLACK];
                            varContainer.addChild(_local_7);
                            _local_9 = new TextArea();
                            _local_9.width = 99;
                            _local_9.height = 73;
                            _local_10 = Number(_local_8["exStoneSid"]);
                            if (_local_10 > 0)
                            {
                                _local_11 = GameData.d[GamePredef.TBL_SKILL][_local_10];
                                _local_9.text = _local_11["description"];
                            }
                            else
                            {
                                _local_9.text = _local_8["description"];
                            };
                            _local_9.alpha = 0;
                            _local_9.setStyle("color", "#00ffff");
                            varContainer.addChild(_local_9);
                        };
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get stoneName():Label
        {
            return (this._1577266320stoneName);
        }

        public function set stoneName(_arg_1:Label):void
        {
            var _local_2:Object = this._1577266320stoneName;
            if (_local_2 !== _arg_1)
            {
                this._1577266320stoneName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stoneName", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get varContainer():VBox
        {
            return (this._506577178varContainer);
        }

        [Bindable(event="propertyChange")]
        public function get stoneProp():Label
        {
            return (this._1577342312stoneProp);
        }

        private function _TipPetStone_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                stoneName.filters = _arg_1;
            }, "stoneName.filters");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _TipPetStone_Label2.filters = _arg_1;
            }, "_TipPetStone_Label2.filters");
            result[1] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                stoneProp.filters = _arg_1;
            }, "stoneProp.filters");
            result[2] = binding;
            return (result);
        }

        public function set varContainer(_arg_1:VBox):void
        {
            var _local_2:Object = this._506577178varContainer;
            if (_local_2 !== _arg_1)
            {
                this._506577178varContainer = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "varContainer", _local_2, _arg_1));
            };
        }

        public function set object(_arg_1:Object):void
        {
            _obj = _arg_1;
            if (!_arg_1.temp)
            {
                return;
            };
            setTemp(_arg_1);
        }


    }
}//package com.qeedoo.ui.view.comp

