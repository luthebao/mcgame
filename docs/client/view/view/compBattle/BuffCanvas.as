// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compBattle.BuffCanvas

package com.qeedoo.ui.view.compBattle
{
    import mx.containers.HBox;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.core.Repeater;
    import mx.core.UIComponentDescriptor;
    import mx.controls.Image;
    import mx.collections.ArrayCollection;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.view.ViewManager;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.vo.BuffVO;
    import com.qeedoo.game.predef.GamePredef;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.config.Language;
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

    public class BuffCanvas extends HBox implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _3646rp:Repeater;
        public var _BuffCanvas_Image1:Array;
        public var _BuffCanvas_HBox1:HBox;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":HBox,
            "id":"_BuffCanvas_HBox1",
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":Repeater,
                        "id":"rp",
                        "propertiesFactory":function ():Object
                        {
                            return ({"childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_BuffCanvas_Image1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":32,
                                            "height":32,
                                            "scaleContent":true
                                        });
                                    }
                                })]});
                        }
                    })]});
            }
        });
        private var _1378119755buffAC:ArrayCollection = new ArrayCollection();
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function BuffCanvas()
        {
            mx_internal::_document = this;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            BuffCanvas._watcherSetupUtil = _arg_1;
        }


        public function clearBuff():void
        {
            var _local_1:Object;
            buffAC.removeAll();
            if (_core.view.getUI(ViewManager.STAGE_BATTLE).isAirBattle)
            {
                _local_1 = new Object();
                _local_1["id"] = 1590;
                addBuff(_local_1);
            };
        }

        public function set rp(_arg_1:Repeater):void
        {
            var _local_2:Object = this._3646rp;
            if (_local_2 !== _arg_1)
            {
                this._3646rp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rp", _local_2, _arg_1));
            };
        }

        public function updateRound():void
        {
            var _local_1:BuffVO;
            for each (_local_1 in buffAC)
            {
                if (_local_1.roundLeft > 0)
                {
                    _local_1.roundLeft--;
                };
            };
        }

        public function hasStateBuff(_arg_1:int):Boolean
        {
            var _local_2:BuffVO;
            var _local_3:Object;
            for each (_local_2 in buffAC)
            {
                _local_3 = _core.data.gameData[GamePredef.TBL_BUFF][_local_2.id];
                if (((_local_3) && (Number(_local_3.state) == _arg_1)))
                {
                    return (true);
                };
            };
            return (false);
        }

        override public function initialize():void
        {
            var target:BuffCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _BuffCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compBattle_BuffCanvasWatcherSetupUtil");
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

        public function addBuff(_arg_1:Object):void
        {
            if (buffAC)
            {
                delBuff(_arg_1.id);
            };
            var _local_2:BuffVO = new BuffVO();
            var _local_3:Object = _core.data.gameData[GamePredef.TBL_BUFF][_arg_1.id];
            if (!_local_3)
            {
                return;
            };
            _local_2.source = ResManager.getIconUrl(_local_3.iconCode);
            _local_2.toolTip = ((((_local_3.name + Language.BUFFCANVAS_S[0]) + _local_3.level) + "\n") + _local_3.description);
            if (_arg_1.id == 1590)
            {
                _local_2.hasRoundLimit = false;
            }
            else
            {
                _local_2.toolTip = (_local_2.toolTip + Language.BUFFCANVAS_S[1]);
            };
            _local_2.id = _arg_1.id;
            _local_2.roundLeft = Number(_arg_1.round);
            buffAC.addItem(_local_2);
        }

        public function getCharactorBuff():ArrayCollection
        {
            return (buffAC);
        }

        [Bindable(event="propertyChange")]
        public function get rp():Repeater
        {
            return (this._3646rp);
        }

        private function _BuffCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (buffAC);
            }, function (_arg_1:Object):void
            {
                rp.dataProvider = _arg_1;
            }, "rp.dataProvider");
            result[0] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):Object
            {
                return (rp.mx_internal::getItemAt(_arg_2[0]).source);
            }, function (_arg_1:Object, _arg_2:Array):void
            {
                _BuffCanvas_Image1[_arg_2[0]].source = _arg_1;
            }, "_BuffCanvas_Image1.source");
            result[1] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):String
            {
                var _local_3:* = (rp.mx_internal::getItemAt(_arg_2[0]).toolTip + rp.mx_internal::getItemAt(_arg_2[0]).roundLeft);
                var _local_4:* = ((_local_3 == undefined) ? null : String(_local_3));
                return (_local_4);
            }, function (_arg_1:String, _arg_2:Array):void
            {
                _BuffCanvas_Image1[_arg_2[0]].toolTip = _arg_1;
            }, "_BuffCanvas_Image1.toolTip");
            result[2] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        private function get buffAC():ArrayCollection
        {
            return (this._1378119755buffAC);
        }

        private function _BuffCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = buffAC;
            _local_1 = rp.currentItem.source;
            _local_1 = (rp.currentItem.toolTip + rp.currentItem.roundLeft);
        }

        private function set buffAC(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._1378119755buffAC;
            if (_local_2 !== _arg_1)
            {
                this._1378119755buffAC = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buffAC", _local_2, _arg_1));
            };
        }

        public function delBuff(_arg_1:Number):void
        {
            var _local_2:BuffVO;
            var _local_3:int;
            for each (_local_2 in buffAC)
            {
                if (_local_2.id == _arg_1)
                {
                    _local_3 = buffAC.getItemIndex(_local_2);
                    buffAC.removeItemAt(_local_3);
                    break;
                };
            };
            buffAC.refresh();
        }


    }
}//package com.qeedoo.ui.view.compBattle

