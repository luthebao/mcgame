// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.PRSExcCvs

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.controls.LinkButton;
    import mx.core.UIComponentDescriptor;
    import mx.controls.HRule;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.config.Language;
    import mx.controls.Alert;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.MouseEvent;
    import mx.events.FlexEvent;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import mx.core.UIComponent;
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

    public class PRSExcCvs extends Canvas implements IBindingClient 
    {

        private static const PAGE_NUM:uint = 5;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _PRSExcCvs_Label1:Label;
        private var _129859695prsSlotItem1:PRSSlotItem;
        private var _129859696prsSlotItem2:PRSSlotItem;
        private var _129859697prsSlotItem3:PRSSlotItem;
        private var _129859698prsSlotItem4:PRSSlotItem;
        private var _129859699prsSlotItem5:PRSSlotItem;
        public var _PRSExcCvs_LinkButton1:LinkButton;
        private var _607339634pageSelector:PageSelectorOnly;
        private var _curPage:int = 1;
        private var _chipArr:Array;
        private var _totalPage:int;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":260,
                    "height":388,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Label,
                        "id":"_PRSExcCvs_Label1",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":35,
                                "y":10
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":LinkButton,
                        "id":"_PRSExcCvs_LinkButton1",
                        "events":{"click":"___PRSExcCvs_LinkButton1_click"},
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.textDecoration = "underline";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":179,
                                "y":10,
                                "width":78
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":HRule,
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":190,
                                "height":1,
                                "y":36
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PRSSlotItem,
                        "id":"prsSlotItem1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":30.5,
                                "y":43
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PRSSlotItem,
                        "id":"prsSlotItem2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":109,
                                "x":30.5
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PRSSlotItem,
                        "id":"prsSlotItem3",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":174,
                                "x":31.5
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PRSSlotItem,
                        "id":"prsSlotItem4",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":236,
                                "x":31.5
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PRSSlotItem,
                        "id":"prsSlotItem5",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":297,
                                "x":30.5
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PageSelectorOnly,
                        "id":"pageSelector",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.bottom = "8";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"changeCall":updatePage});
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

        public function PRSExcCvs()
        {
            mx_internal::_document = this;
            this.width = 260;
            this.height = 388;
            this.styleName = "CanvasBorder";
            this.addEventListener("creationComplete", ___PRSExcCvs_Canvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PRSExcCvs._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelectorOnly
        {
            return (this._607339634pageSelector);
        }

        private function helpInfo():void
        {
            var _local_1:String = Language.PRS_PANEL[43].toString();
            Alert.show(_local_1);
        }

        override public function initialize():void
        {
            var target:PRSExcCvs;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PRSExcCvs_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_PRSExcCvsWatcherSetupUtil");
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

        public function ___PRSExcCvs_LinkButton1_click(_arg_1:MouseEvent):void
        {
            helpInfo();
        }

        private function _PRSExcCvs_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.PRS_PANEL[19].toString().replace("{num}", _core.player.realSoulCrystal);
            _local_1 = Language.PRS_PANEL[42];
        }

        public function ___PRSExcCvs_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function set pageSelector(_arg_1:PageSelectorOnly):void
        {
            var _local_2:Object = this._607339634pageSelector;
            if (_local_2 !== _arg_1)
            {
                this._607339634pageSelector = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageSelector", _local_2, _arg_1));
            };
        }

        private function init():void
        {
            _chipArr = (GameData.d[GamePredef.TBL_PRS_CHIP] as Array).slice(1);
            _chipArr.sortOn("position", Array.NUMERIC);
            updatePage();
        }

        private function _PRSExcCvs_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PRS_PANEL[19].toString().replace("{num}", _core.player.realSoulCrystal);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PRSExcCvs_Label1.text = _arg_1;
            }, "_PRSExcCvs_Label1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PRS_PANEL[42];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PRSExcCvs_LinkButton1.label = _arg_1;
            }, "_PRSExcCvs_LinkButton1.label");
            result[1] = binding;
            return (result);
        }

        public function set prsSlotItem1(_arg_1:PRSSlotItem):void
        {
            var _local_2:Object = this._129859695prsSlotItem1;
            if (_local_2 !== _arg_1)
            {
                this._129859695prsSlotItem1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prsSlotItem1", _local_2, _arg_1));
            };
        }

        public function set prsSlotItem2(_arg_1:PRSSlotItem):void
        {
            var _local_2:Object = this._129859696prsSlotItem2;
            if (_local_2 !== _arg_1)
            {
                this._129859696prsSlotItem2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prsSlotItem2", _local_2, _arg_1));
            };
        }

        public function set prsSlotItem3(_arg_1:PRSSlotItem):void
        {
            var _local_2:Object = this._129859697prsSlotItem3;
            if (_local_2 !== _arg_1)
            {
                this._129859697prsSlotItem3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prsSlotItem3", _local_2, _arg_1));
            };
        }

        public function set prsSlotItem4(_arg_1:PRSSlotItem):void
        {
            var _local_2:Object = this._129859698prsSlotItem4;
            if (_local_2 !== _arg_1)
            {
                this._129859698prsSlotItem4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prsSlotItem4", _local_2, _arg_1));
            };
        }

        public function set prsSlotItem5(_arg_1:PRSSlotItem):void
        {
            var _local_2:Object = this._129859699prsSlotItem5;
            if (_local_2 !== _arg_1)
            {
                this._129859699prsSlotItem5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prsSlotItem5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get prsSlotItem1():PRSSlotItem
        {
            return (this._129859695prsSlotItem1);
        }

        [Bindable(event="propertyChange")]
        public function get prsSlotItem2():PRSSlotItem
        {
            return (this._129859696prsSlotItem2);
        }

        [Bindable(event="propertyChange")]
        public function get prsSlotItem3():PRSSlotItem
        {
            return (this._129859697prsSlotItem3);
        }

        [Bindable(event="propertyChange")]
        public function get prsSlotItem4():PRSSlotItem
        {
            return (this._129859698prsSlotItem4);
        }

        public function updatePage():void
        {
            var _local_1:* = _chipArr.length;
            _totalPage = (pageSelector.totalPage = Math.ceil((_local_1 / PAGE_NUM)));
            _curPage = pageSelector.curPage;
            var _local_2:Number = ((_curPage - 1) * PAGE_NUM);
            var _local_3:int = 1;
            while (_local_3 <= PAGE_NUM)
            {
                if ((_local_2 + _local_3) > _chipArr.length)
                {
                    (this[("prsSlotItem" + _local_3)] as UIComponent).visible = false;
                }
                else
                {
                    (this[("prsSlotItem" + _local_3)] as PRSSlotItem).chipId = int(_chipArr[((_local_2 + _local_3) - 1)].id);
                    (this[("prsSlotItem" + _local_3)] as PRSSlotItem).updateItem();
                };
                _local_3++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get prsSlotItem5():PRSSlotItem
        {
            return (this._129859699prsSlotItem5);
        }


    }
}//package com.qeedoo.ui.view.comp

