// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.CrossContentionBattleInfo

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.IntroText;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import mx.core.mx_internal;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.FlexEvent;
    import mx.events.PropertyChangeEvent;
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

    public class CrossContentionBattleInfo extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1287834292panelTitle:BasicTitleCanvas;
        private var _115312txt:IntroText;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":625,
                    "height":500,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"panelTitle"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.left = "7";
                            this.right = "7";
                            this.top = "40";
                            this.bottom = "25";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"RoundedGradientBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":IntroText,
                                    "id":"txt",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontStyle = "normal";
                                        this.fontWeight = "bold";
                                        this.textAlign = "left";
                                        this.fontSize = 12;
                                        this.borderThickness = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":6,
                                            "y":6,
                                            "width":600,
                                            "height":420
                                        });
                                    }
                                })]
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

        public function CrossContentionBattleInfo()
        {
            mx_internal::_document = this;
            this.width = 625;
            this.height = 500;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___CrossContentionBattleInfo_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            CrossContentionBattleInfo._watcherSetupUtil = _arg_1;
        }


        public function open(_arg_1:Object):void
        {
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:String;
            var _local_7:Number;
            var _local_8:Number;
            var _local_9:Number;
            var _local_10:Number;
            var _local_11:String;
            var _local_12:String;
            var _local_13:int;
            var _local_14:String;
            var _local_15:String;
            var _local_16:Date;
            var _local_17:String;
            super.visible = true;
            if (!_arg_1)
            {
                return;
            };
            var _local_2:* = "";
            var _local_3:int;
            while (_local_3 < _arg_1.length)
            {
                _local_4 = _arg_1[_local_3];
                if (_local_4)
                {
                    _local_5 = _local_4.om;
                    _local_6 = _local_4.bm.leader;
                    _local_7 = _local_4.t;
                    _local_8 = _local_4.mid;
                    _local_9 = _local_4.rid;
                    _local_10 = _local_4.bosid;
                    _local_11 = Language.CROSS_CONTENTION_PANEL_U[158];
                    if (GamePredef.CROSS_CONTENTION_MAP[_local_8])
                    {
                        _local_12 = GamePredef.CROSS_CONTENTION_MAP[_local_8].name;
                        _local_13 = GamePredef.CROSS_CONTENTION_REC_TEMP_DATA[GamePredef.CROSS_CONTENTION_MAP_REC_INIT[_local_8]][_local_9].p;
                        _local_14 = ((Language.CROSS_CONTENTION_PANEL_U[(67 + _local_13)] + "-") + _local_9);
                        _local_15 = CrossContentionTotalPanel.getServerName(_local_10);
                        _local_16 = new Date(_local_7);
                        _local_17 = ((_local_16.getHours() + ":") + _local_16.getMinutes());
                        _local_2 = (_local_2 + ((((_local_3 + 1).toString() + "、") + _local_11.replace("{mname}", _local_12).replace("{rname}", _local_14).replace("{time}", _local_17).replace("{bosid}", _local_15).replace("{leader}", _local_6)) + "\n"));
                    };
                };
                _local_3++;
            };
            txt.htmlText = _local_2;
        }

        override public function initialize():void
        {
            var target:CrossContentionBattleInfo;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _CrossContentionBattleInfo_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_CrossContentionBattleInfoWatcherSetupUtil");
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

        public function ___CrossContentionBattleInfo_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        private function init():void
        {
        }

        public function set txt(_arg_1:IntroText):void
        {
            var _local_2:Object = this._115312txt;
            if (_local_2 !== _arg_1)
            {
                this._115312txt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txt", _local_2, _arg_1));
            };
        }

        private function _CrossContentionBattleInfo_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[159];
        }

        private function _CrossContentionBattleInfo_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[159];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                panelTitle.text = _arg_1;
            }, "panelTitle.text");
            result[0] = binding;
            return (result);
        }

        public function set panelTitle(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._1287834292panelTitle;
            if (_local_2 !== _arg_1)
            {
                this._1287834292panelTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "panelTitle", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get txt():IntroText
        {
            return (this._115312txt);
        }

        [Bindable(event="propertyChange")]
        public function get panelTitle():BasicTitleCanvas
        {
            return (this._1287834292panelTitle);
        }


    }
}//package com.qeedoo.ui.view.compDragable

