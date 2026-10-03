// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.MysteryItem

package com.qeedoo.ui.view.compDragable
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.controls.TextInput;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.utils.LanguageUtil;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.PropertyChangeEvent;
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

    public class MysteryItem extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _2128961247scoreText:Label;
        private var _scoreIdx:int = -1;
        public var changeCall:Function;
        private var _1706957847inputText:TextInput;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":270,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Label,
                        "id":"scoreText",
                        "stylesFactory":function ():void
                        {
                            this.verticalCenter = "0";
                            this.color = 0xFFFFFF;
                            this.textAlign = "center";
                        }
                    }), new UIComponentDescriptor({
                        "type":TextInput,
                        "id":"inputText",
                        "events":{"change":"__inputText_change"},
                        "stylesFactory":function ():void
                        {
                            this.verticalCenter = "0";
                            this.right = "0";
                            this.textAlign = "right";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "restrict":"0-9",
                                "width":80,
                                "height":20
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

        public function MysteryItem()
        {
            mx_internal::_document = this;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
            this.clipContent = false;
            this.width = 270;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MysteryItem._watcherSetupUtil = _arg_1;
        }


        private function changeInput(_arg_1:Number):void
        {
            inputText.text = String(_arg_1);
            ((changeCall) && (changeCall(this)));
        }

        private function _MysteryItem_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
        }

        public function updateView(_arg_1:int, _arg_2:Number):void
        {
            _scoreIdx = _arg_1;
            if (((_scoreIdx < 0) || (!(Language.MYSTERY_FURNACE_PANEL[8][_scoreIdx]))))
            {
                this.cleanView();
                return;
            };
            this.visible = true;
            var _local_3:Object = Language.MYSTERY_FURNACE_PANEL[8][_scoreIdx];
            var _local_4:Number = ((_core.player[_local_3.score]) || (0));
            if (((_arg_2 < 0) || (_arg_2 > _local_4)))
            {
                _arg_2 = _local_4;
            };
            scoreText.htmlText = (_local_3.name + LanguageUtil.replace(Language.MYSTERY_FURNACE_PANEL[9], {"num":_local_4}));
            inputText.text = String(_arg_2);
        }

        override public function initialize():void
        {
            var target:MysteryItem;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MysteryItem_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_MysteryItemWatcherSetupUtil");
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

        public function cleanView():void
        {
            _scoreIdx = -1;
            this.visible = false;
            this.changeInput(0);
            scoreText.htmlText = Language.MYSTERY_FURNACE_PANEL[10];
        }

        public function getInput():Number
        {
            if (_scoreIdx < 0)
            {
                return (0);
            };
            return ((Number(inputText.text)) ? Number(inputText.text) : 0);
        }

        [Bindable(event="propertyChange")]
        public function get inputText():TextInput
        {
            return (this._1706957847inputText);
        }

        public function set scoreText(_arg_1:Label):void
        {
            var _local_2:Object = this._2128961247scoreText;
            if (_local_2 !== _arg_1)
            {
                this._2128961247scoreText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scoreText", _local_2, _arg_1));
            };
        }

        private function _MysteryItem_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                scoreText.filters = _arg_1;
            }, "scoreText.filters");
            result[0] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get scoreText():Label
        {
            return (this._2128961247scoreText);
        }

        public function get scoreType():int
        {
            if (((_scoreIdx < 0) || (!(Language.MYSTERY_FURNACE_PANEL[8][_scoreIdx]))))
            {
                return (0);
            };
            var _local_1:Object = Language.MYSTERY_FURNACE_PANEL[8][_scoreIdx];
            return (_local_1.type);
        }

        public function set inputText(_arg_1:TextInput):void
        {
            var _local_2:Object = this._1706957847inputText;
            if (_local_2 !== _arg_1)
            {
                this._1706957847inputText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "inputText", _local_2, _arg_1));
            };
        }

        public function __inputText_change(_arg_1:Event):void
        {
            changeHandler(_arg_1);
        }

        private function changeHandler(_arg_1:Event):void
        {
            if (((_scoreIdx < 0) || (!(Language.MYSTERY_FURNACE_PANEL[8][_scoreIdx]))))
            {
                this.cleanView();
                return;
            };
            var _local_2:Object = Language.MYSTERY_FURNACE_PANEL[8][_scoreIdx];
            var _local_3:Number = ((_core.player[_local_2.score]) || (0));
            var _local_4:Number = ((Number(inputText.text)) || (0));
            if (_local_4 > _local_3)
            {
                this.changeInput(_local_3);
            }
            else
            {
                ((changeCall) && (changeCall(this)));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

