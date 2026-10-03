// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.ConsumeNoticeItem

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.Tile;
    import mx.core.UIComponentDescriptor;
    import mx.collections.ArrayCollection;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
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

    public class ConsumeNoticeItem extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _3587ps:String;
        private var _data:Object;
        private var _3573pe:String;
        private var _3575610type:String;
        private var _1177280081itemList:Tile;
        private var _110371416title:RoundedLabel;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":760,
                    "height":70,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"title",
                        "stylesFactory":function ():void
                        {
                            this.top = "3";
                            this.left = "10";
                            this.fontSize = 14;
                        }
                    }), new UIComponentDescriptor({
                        "type":Tile,
                        "id":"itemList",
                        "stylesFactory":function ():void
                        {
                            this.horizontalGap = 10;
                            this.top = "26";
                            this.bottom = "0";
                            this.left = "10";
                            this.right = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"direction":"horizontal"});
                        }
                    })]
                });
            }
        });
        public var list:ArrayCollection = new ArrayCollection();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function ConsumeNoticeItem()
        {
            mx_internal::_document = this;
            this.width = 760;
            this.height = 70;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ConsumeNoticeItem._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get type():String
        {
            return (this._3575610type);
        }

        [Bindable(event="propertyChange")]
        public function get title():RoundedLabel
        {
            return (this._110371416title);
        }

        public function set ps(_arg_1:String):void
        {
            var _local_2:Object = this._3587ps;
            if (_local_2 !== _arg_1)
            {
                this._3587ps = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ps", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:ConsumeNoticeItem;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ConsumeNoticeItem_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_ConsumeNoticeItemWatcherSetupUtil");
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
        public function get itemList():Tile
        {
            return (this._1177280081itemList);
        }

        private function _ConsumeNoticeItem_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (((((type + ": ") + ps) + " ~ ") + pe) + " 元可获得以下奖励");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                title.text = _arg_1;
            }, "title.text");
            result[0] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get ps():String
        {
            return (this._3587ps);
        }

        public function set itemList(_arg_1:Tile):void
        {
            var _local_2:Object = this._1177280081itemList;
            if (_local_2 !== _arg_1)
            {
                this._1177280081itemList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemList", _local_2, _arg_1));
            };
        }

        public function set pe(_arg_1:String):void
        {
            var _local_2:Object = this._3573pe;
            if (_local_2 !== _arg_1)
            {
                this._3573pe = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pe", _local_2, _arg_1));
            };
        }

        private function _ConsumeNoticeItem_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = (((((type + ": ") + ps) + " ~ ") + pe) + " 元可获得以下奖励");
        }

        public function setData(_arg_1:Array):*
        {
            var _local_2:*;
            var _local_3:Object;
            var _local_4:ItemSlot;
            itemList.removeAllChildren();
            if (_arg_1.length < 1)
            {
                return;
            };
            ps = (_arg_1[0].r as String).split("|")[0];
            pe = (_arg_1[0].r as String).split("|")[1];
            for (_local_2 in _arg_1)
            {
                if (_arg_1[_local_2])
                {
                    _local_3 = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][int(_arg_1[_local_2].i)];
                    _local_4 = new ItemSlot();
                    _local_4.acceptable = false;
                    _local_4.movable = false;
                    _local_4.slotType = Slot.SLOT_EQUFUNC_ITEM;
                    _local_4.type = GamePredef.TBL_ITEM_TEMPLATE;
                    _local_4.giid = int(_arg_1[_local_2].i);
                    _local_4.slotData = _local_3;
                    _local_4.stackNum = int(_arg_1[_local_2].n);
                    itemList.addChild(_local_4);
                };
            };
        }

        public function set type(_arg_1:String):void
        {
            var _local_2:Object = this._3575610type;
            if (_local_2 !== _arg_1)
            {
                this._3575610type = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "type", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pe():String
        {
            return (this._3573pe);
        }

        public function set title(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._110371416title;
            if (_local_2 !== _arg_1)
            {
                this._110371416title = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.comp

