// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.HeiyaoshiAlertPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.HtmlTextArea;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.view.ViewManager;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.FlexEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import flash.net.Responder;
    import com.adobe.crypto.MD5;
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

    public class HeiyaoshiAlertPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _HeiyaoshiAlertPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _3237038info:HtmlTextArea;
        private var _typeNum:Number;
        private var _str:String;
        private var _pointNum:Number;
        private var _1655974669activate:BasicGlowButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":230,
                    "height":110,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_HeiyaoshiAlertPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "height":96,
                                "y":30,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":HtmlTextArea,
                                    "id":"info",
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "none";
                                        this.backgroundAlpha = 0;
                                        this.color = 0xFFFFFF;
                                        this.left = "10";
                                        this.right = "10";
                                        this.top = "10";
                                        this.bottom = "24";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "editable":false,
                                            "selectable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"activate",
                                    "events":{"click":"__activate_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":76.5,
                                            "y":48,
                                            "width":77,
                                            "height":24,
                                            "styleName":"CrystalBlueButton"
                                        });
                                    }
                                })]
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

        public function HeiyaoshiAlertPanel()
        {
            mx_internal::_document = this;
            this.width = 230;
            this.height = 110;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            HeiyaoshiAlertPanel._watcherSetupUtil = _arg_1;
        }


        public function setGoldLock(_arg_1:Boolean):void
        {
            var _local_2:BagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
            var _local_3:Boolean = _local_2.goldLockFlag;
            if (((!(_local_3 == _arg_1)) && (_local_2)))
            {
                _local_2.goldLockFlag = _arg_1;
            };
        }

        public function showPanel():*
        {
            initView();
            visible = true;
        }

        [Bindable(event="propertyChange")]
        public function get activate():BasicGlowButton
        {
            return (this._1655974669activate);
        }

        override public function initialize():void
        {
            var target:HeiyaoshiAlertPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _HeiyaoshiAlertPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_HeiyaoshiAlertPanelWatcherSetupUtil");
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

        private function doUnlockMoneyGold(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                setGoldLock(false);
            };
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            this.pointNum = _pointNum;
            this.str = _str;
        }

        public function set typeNum(_arg_1:Number):void
        {
            _typeNum = _arg_1;
        }

        private function _HeiyaoshiAlertPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HEIYAOSHI_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _HeiyaoshiAlertPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_HeiyaoshiAlertPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2]);
            }, function (_arg_1:Array):void
            {
                info.filters = _arg_1;
            }, "info.filters");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HEIYAOSHI_PANEL[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                activate.label = _arg_1;
            }, "activate.label");
            result[2] = binding;
            return (result);
        }

        public function __activate_click(_arg_1:MouseEvent):void
        {
            activateHeiyaoshiPoint();
        }

        public function set str(_arg_1:String):void
        {
            _str = _arg_1;
            if (initialized)
            {
                info.htmlText = _str;
            };
        }

        public function set info(_arg_1:HtmlTextArea):void
        {
            var _local_2:Object = this._3237038info;
            if (_local_2 !== _arg_1)
            {
                this._3237038info = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "info", _local_2, _arg_1));
            };
        }

        public function set activate(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1655974669activate;
            if (_local_2 !== _arg_1)
            {
                this._1655974669activate = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "activate", _local_2, _arg_1));
            };
        }

        public function activateHeiyaoshiPoint():void
        {
            var bagPanel:BagPanel;
            var goldLockFlag:Boolean;
            var gfunc:Function;
            if (_typeNum == 2)
            {
                bagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
                goldLockFlag = bagPanel.goldLockFlag;
                if (((goldLockFlag) || (!(bagPanel))))
                {
                    _core.sysMsg(Language.JUHUASUAN_PANEL[15]);
                    gfunc = function (_arg_1:String):void
                    {
                        _core.remote.call("unlockMoney", new Responder(doUnlockMoneyGold), MD5.hash(_arg_1));
                    };
                    _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], gfunc);
                    return;
                };
            };
            _core.remote.call("activateHeiyaoshiPoint", null, _typeNum, _pointNum);
            this.visible = false;
        }

        [Bindable(event="propertyChange")]
        public function get info():HtmlTextArea
        {
            return (this._3237038info);
        }

        public function set pointNum(_arg_1:Number):void
        {
            _pointNum = _arg_1;
        }

        private function _HeiyaoshiAlertPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.HEIYAOSHI_PANEL[0];
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            _local_1 = Language.HEIYAOSHI_PANEL[2];
        }


    }
}//package com.qeedoo.ui.view.compDragable

