// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.texunkechengRenderer

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
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

    public class texunkechengRenderer extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1727756308stackNum2:int;
        private var _493282933advlocker:Image;
        private var _109532659slot1:ItemSlot;
        private var _661568106slotData2:Object;
        private var _1986315925advlockerVis:Boolean;
        private var _3007235awd1:Boolean;
        private var _3007236awd2:Boolean;
        private var _109532660slot2:ItemSlot;
        public var _texunkechengRenderer_Image1:Image;
        private var _98354772giid1:int;
        private var _2125486345levlabel:Label;
        private var _403869721levLabelTxt:String;
        private var _1727756307stackNum1:int;
        private var _98354773giid2:int;
        private var _661568105slotData1:Object;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":62,
                    "height":171,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"_texunkechengRenderer_Image1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":0,
                                "percentWidth":100,
                                "percentHeight":100,
                                "x":0
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"slot2",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.verticalCenter = "-49";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "showStackNum":true,
                                "width":32,
                                "height":32,
                                "acceptable":false,
                                "type":29,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"advlocker",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":28,
                                "height":28,
                                "x":4,
                                "y":48
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"levlabel",
                        "stylesFactory":function ():void
                        {
                            this.verticalCenter = "5";
                            this.horizontalCenter = "0";
                            this.fontSize = 14;
                            this.fontWeight = "bold";
                            this.color = 0xFFFFFF;
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"slot1",
                        "stylesFactory":function ():void
                        {
                            this.verticalCenter = "53";
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "showStackNum":true,
                                "width":32,
                                "height":32,
                                "acceptable":false,
                                "type":29,
                                "movable":false
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

        public function texunkechengRenderer()
        {
            mx_internal::_document = this;
            this.width = 62;
            this.height = 171;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
            this.styleName = "CanvasBorder";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            texunkechengRenderer._watcherSetupUtil = _arg_1;
        }


        private function set slotData2(_arg_1:Object):void
        {
            var _local_2:Object = this._661568106slotData2;
            if (_local_2 !== _arg_1)
            {
                this._661568106slotData2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slotData2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot1():ItemSlot
        {
            return (this._109532659slot1);
        }

        [Bindable(event="propertyChange")]
        private function get awd1():Boolean
        {
            return (this._3007235awd1);
        }

        [Bindable(event="propertyChange")]
        private function get awd2():Boolean
        {
            return (this._3007236awd2);
        }

        private function set awd1(_arg_1:Boolean):void
        {
            var _local_2:Object = this._3007235awd1;
            if (_local_2 !== _arg_1)
            {
                this._3007235awd1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awd1", _local_2, _arg_1));
            };
        }

        private function set awd2(_arg_1:Boolean):void
        {
            var _local_2:Object = this._3007236awd2;
            if (_local_2 !== _arg_1)
            {
                this._3007236awd2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awd2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get advlocker():Image
        {
            return (this._493282933advlocker);
        }

        [Bindable(event="propertyChange")]
        private function get giid1():int
        {
            return (this._98354772giid1);
        }

        override public function initialize():void
        {
            var target:texunkechengRenderer;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _texunkechengRenderer_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_texunkechengRendererWatcherSetupUtil");
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
        private function get stackNum1():int
        {
            return (this._1727756307stackNum1);
        }

        [Bindable(event="propertyChange")]
        private function get advlockerVis():Boolean
        {
            return (this._1986315925advlockerVis);
        }

        public function set advlocker(_arg_1:Image):void
        {
            var _local_2:Object = this._493282933advlocker;
            if (_local_2 !== _arg_1)
            {
                this._493282933advlocker = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "advlocker", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get levLabelTxt():String
        {
            return (this._403869721levLabelTxt);
        }

        [Bindable(event="propertyChange")]
        private function get stackNum2():int
        {
            return (this._1727756308stackNum2);
        }

        private function set giid2(_arg_1:int):void
        {
            var _local_2:Object = this._98354773giid2;
            if (_local_2 !== _arg_1)
            {
                this._98354773giid2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "giid2", _local_2, _arg_1));
            };
        }

        private function set stackNum1(_arg_1:int):void
        {
            var _local_2:Object = this._1727756307stackNum1;
            if (_local_2 !== _arg_1)
            {
                this._1727756307stackNum1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stackNum1", _local_2, _arg_1));
            };
        }

        private function _texunkechengRenderer_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = ResManager.getIconUrl(4130220003335);
            _local_1 = slotData2;
            _local_1 = stackNum2;
            _local_1 = awd2;
            _local_1 = giid2;
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = ResManager.getIconUrl(4130220003337);
            _local_1 = advlockerVis;
            _local_1 = levLabelTxt;
            _local_1 = slotData1;
            _local_1 = stackNum1;
            _local_1 = awd1;
            _local_1 = giid1;
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
        }

        private function set advlockerVis(_arg_1:Boolean):void
        {
            var _local_2:Object = this._1986315925advlockerVis;
            if (_local_2 !== _arg_1)
            {
                this._1986315925advlockerVis = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "advlockerVis", _local_2, _arg_1));
            };
        }

        private function set levLabelTxt(_arg_1:String):void
        {
            var _local_2:Object = this._403869721levLabelTxt;
            if (_local_2 !== _arg_1)
            {
                this._403869721levLabelTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levLabelTxt", _local_2, _arg_1));
            };
        }

        private function set stackNum2(_arg_1:int):void
        {
            var _local_2:Object = this._1727756308stackNum2;
            if (_local_2 !== _arg_1)
            {
                this._1727756308stackNum2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stackNum2", _local_2, _arg_1));
            };
        }

        private function set giid1(_arg_1:int):void
        {
            var _local_2:Object = this._98354772giid1;
            if (_local_2 !== _arg_1)
            {
                this._98354772giid1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "giid1", _local_2, _arg_1));
            };
        }

        private function _texunkechengRenderer_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220003335));
            }, function (_arg_1:Object):void
            {
                _texunkechengRenderer_Image1.source = _arg_1;
            }, "_texunkechengRenderer_Image1.source");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (slotData2);
            }, function (_arg_1:Object):void
            {
                slot2.slotData = _arg_1;
            }, "slot2.slotData");
            result[1] = binding;
            binding = new Binding(this, function ():int
            {
                return (stackNum2);
            }, function (_arg_1:int):void
            {
                slot2.stackNum = _arg_1;
            }, "slot2.stackNum");
            result[2] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (awd2);
            }, function (_arg_1:Boolean):void
            {
                slot2.enabled = _arg_1;
            }, "slot2.enabled");
            result[3] = binding;
            binding = new Binding(this, function ():Number
            {
                return (giid2);
            }, function (_arg_1:Number):void
            {
                slot2.giid = _arg_1;
            }, "slot2.giid");
            result[4] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                slot2.slotType = _arg_1;
            }, "slot2.slotType");
            result[5] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220003337));
            }, function (_arg_1:Object):void
            {
                advlocker.source = _arg_1;
            }, "advlocker.source");
            result[6] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (advlockerVis);
            }, function (_arg_1:Boolean):void
            {
                advlocker.visible = _arg_1;
            }, "advlocker.visible");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = levLabelTxt;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                levlabel.text = _arg_1;
            }, "levlabel.text");
            result[8] = binding;
            binding = new Binding(this, function ():Object
            {
                return (slotData1);
            }, function (_arg_1:Object):void
            {
                slot1.slotData = _arg_1;
            }, "slot1.slotData");
            result[9] = binding;
            binding = new Binding(this, function ():int
            {
                return (stackNum1);
            }, function (_arg_1:int):void
            {
                slot1.stackNum = _arg_1;
            }, "slot1.stackNum");
            result[10] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (awd1);
            }, function (_arg_1:Boolean):void
            {
                slot1.enabled = _arg_1;
            }, "slot1.enabled");
            result[11] = binding;
            binding = new Binding(this, function ():Number
            {
                return (giid1);
            }, function (_arg_1:Number):void
            {
                slot1.giid = _arg_1;
            }, "slot1.giid");
            result[12] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                slot1.slotType = _arg_1;
            }, "slot1.slotType");
            result[13] = binding;
            return (result);
        }

        private function set slotData1(_arg_1:Object):void
        {
            var _local_2:Object = this._661568105slotData1;
            if (_local_2 !== _arg_1)
            {
                this._661568105slotData1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slotData1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get giid2():int
        {
            return (this._98354773giid2);
        }

        override public function set data(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:Object;
            super.data = _arg_1;
            if (_arg_1)
            {
                _local_2 = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_arg_1.a1.i];
                _local_3 = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_arg_1.a2.i];
                slotData1 = _local_2;
                stackNum1 = _arg_1.a1.n;
                giid1 = _arg_1.a1.i;
                awd1 = (!(_arg_1.awd1));
                slotData2 = _local_3;
                stackNum2 = _arg_1.a2.n;
                giid2 = _arg_1.a2.i;
                awd2 = (!(_arg_1.awd2));
                if (_arg_1.p == 0)
                {
                    advlockerVis = true;
                };
                if (_arg_1.p == 1)
                {
                    advlockerVis = false;
                };
                levLabelTxt = _arg_1.lev;
            };
        }

        [Bindable(event="propertyChange")]
        private function get slotData1():Object
        {
            return (this._661568105slotData1);
        }

        [Bindable(event="propertyChange")]
        private function get slotData2():Object
        {
            return (this._661568106slotData2);
        }

        public function set levlabel(_arg_1:Label):void
        {
            var _local_2:Object = this._2125486345levlabel;
            if (_local_2 !== _arg_1)
            {
                this._2125486345levlabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levlabel", _local_2, _arg_1));
            };
        }

        public function set slot2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532660slot2;
            if (_local_2 !== _arg_1)
            {
                this._109532660slot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot2():ItemSlot
        {
            return (this._109532660slot2);
        }

        public function set slot1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532659slot1;
            if (_local_2 !== _arg_1)
            {
                this._109532659slot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get levlabel():Label
        {
            return (this._2125486345levlabel);
        }


    }
}//package com.qeedoo.ui.view.comp

