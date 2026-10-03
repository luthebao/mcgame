// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.UIContainer

package com.qeedoo.ui.view
{
    import com.qeedoo.ui.view.comp.UIBase;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.game.vo.UIPropVO;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.binding.BindingManager;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.system.Core;
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

    public class UIContainer extends UIBase implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _UIContainer_UIPropVO1:UIPropVO;
        public var _UIContainer_UIPropVO2:UIPropVO;
        public var _UIContainer_UIPropVO3:UIPropVO;
        public var _UIContainer_UIPropVO4:UIPropVO;
        public var _UIContainer_UIPropVO5:UIPropVO;
        public var _UIContainer_UIPropVO6:UIPropVO;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({"type":UIBase});
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function UIContainer()
        {
            mx_internal::_document = this;
            _UIContainer_Array1_i();
            this.addEventListener("creationComplete", ___UIContainer_UIBase1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            UIContainer._watcherSetupUtil = _arg_1;
        }


        override public function initialize():void
        {
            var target:UIContainer;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _UIContainer_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_UIContainerWatcherSetupUtil");
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

        private function _UIContainer_Array1_i():Array
        {
            var _local_1:Array = [_UIContainer_UIPropVO1_i(), _UIContainer_UIPropVO2_i(), _UIContainer_UIPropVO3_i(), _UIContainer_UIPropVO4_i(), _UIContainer_UIPropVO5_i(), _UIContainer_UIPropVO6_i()];
            uiList = _local_1;
            return (_local_1);
        }

        private function _UIContainer_UIPropVO1_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _UIContainer_UIPropVO1 = _local_1;
            _local_1.type = "遮罩面";
            _local_1.prop = {
                "x":0,
                "y":0,
                "percentWidth":100,
                "percentHeight":100
            };
            BindingManager.executeBindings(this, "_UIContainer_UIPropVO1", _UIContainer_UIPropVO1);
            return (_local_1);
        }

        private function _UIContainer_UIPropVO2_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _UIContainer_UIPropVO2 = _local_1;
            _local_1.type = "主界面";
            _local_1.prop = {
                "x":0,
                "y":0,
                "percentWidth":100,
                "percentHeight":100
            };
            BindingManager.executeBindings(this, "_UIContainer_UIPropVO2", _UIContainer_UIPropVO2);
            return (_local_1);
        }

        private function _UIContainer_UIPropVO3_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _UIContainer_UIPropVO3 = _local_1;
            _local_1.type = "功能面板";
            _local_1.prop = {
                "x":0,
                "y":0,
                "percentWidth":100,
                "percentHeight":100
            };
            BindingManager.executeBindings(this, "_UIContainer_UIPropVO3", _UIContainer_UIPropVO3);
            return (_local_1);
        }

        private function _UIContainer_UIPropVO4_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _UIContainer_UIPropVO4 = _local_1;
            _local_1.type = "登陆界面";
            _local_1.prop = {
                "x":0,
                "y":0,
                "percentWidth":100,
                "percentHeight":100
            };
            BindingManager.executeBindings(this, "_UIContainer_UIPropVO4", _UIContainer_UIPropVO4);
            return (_local_1);
        }

        private function _UIContainer_UIPropVO5_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _UIContainer_UIPropVO5 = _local_1;
            _local_1.type = "提示窗口";
            _local_1.prop = {
                "x":0,
                "y":0,
                "percentWidth":100,
                "percentHeight":100
            };
            BindingManager.executeBindings(this, "_UIContainer_UIPropVO5", _UIContainer_UIPropVO5);
            return (_local_1);
        }

        private function _UIContainer_UIPropVO6_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _UIContainer_UIPropVO6 = _local_1;
            _local_1.type = "工具提示";
            _local_1.prop = {
                "x":0,
                "y":0,
                "percentWidth":100,
                "percentHeight":100
            };
            BindingManager.executeBindings(this, "_UIContainer_UIPropVO6", _UIContainer_UIPropVO6);
            return (_local_1);
        }

        private function _UIContainer_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Class
            {
                return (ShadeLayer);
            }, function (_arg_1:Class):void
            {
                _UIContainer_UIPropVO1.cls = _arg_1;
            }, "_UIContainer_UIPropVO1.cls");
            result[0] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.UI_SHADE);
            }, function (_arg_1:int):void
            {
                _UIContainer_UIPropVO1.vid = _arg_1;
            }, "_UIContainer_UIPropVO1.vid");
            result[1] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _UIContainer_UIPropVO1.initVisible = _arg_1;
            }, "_UIContainer_UIPropVO1.initVisible");
            result[2] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MainLayer);
            }, function (_arg_1:Class):void
            {
                _UIContainer_UIPropVO2.cls = _arg_1;
            }, "_UIContainer_UIPropVO2.cls");
            result[3] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.UI_MAIN);
            }, function (_arg_1:int):void
            {
                _UIContainer_UIPropVO2.vid = _arg_1;
            }, "_UIContainer_UIPropVO2.vid");
            result[4] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _UIContainer_UIPropVO2.initVisible = _arg_1;
            }, "_UIContainer_UIPropVO2.initVisible");
            result[5] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PanelLayer);
            }, function (_arg_1:Class):void
            {
                _UIContainer_UIPropVO3.cls = _arg_1;
            }, "_UIContainer_UIPropVO3.cls");
            result[6] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.UI_PANEL);
            }, function (_arg_1:int):void
            {
                _UIContainer_UIPropVO3.vid = _arg_1;
            }, "_UIContainer_UIPropVO3.vid");
            result[7] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _UIContainer_UIPropVO3.initVisible = _arg_1;
            }, "_UIContainer_UIPropVO3.initVisible");
            result[8] = binding;
            binding = new Binding(this, function ():Class
            {
                return (LoginLayer);
            }, function (_arg_1:Class):void
            {
                _UIContainer_UIPropVO4.cls = _arg_1;
            }, "_UIContainer_UIPropVO4.cls");
            result[9] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.UI_LOGIN);
            }, function (_arg_1:int):void
            {
                _UIContainer_UIPropVO4.vid = _arg_1;
            }, "_UIContainer_UIPropVO4.vid");
            result[10] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _UIContainer_UIPropVO4.initVisible = _arg_1;
            }, "_UIContainer_UIPropVO4.initVisible");
            result[11] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PopupLayer);
            }, function (_arg_1:Class):void
            {
                _UIContainer_UIPropVO5.cls = _arg_1;
            }, "_UIContainer_UIPropVO5.cls");
            result[12] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.UI_POPUP);
            }, function (_arg_1:int):void
            {
                _UIContainer_UIPropVO5.vid = _arg_1;
            }, "_UIContainer_UIPropVO5.vid");
            result[13] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _UIContainer_UIPropVO5.initVisible = _arg_1;
            }, "_UIContainer_UIPropVO5.initVisible");
            result[14] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TooltipLayer);
            }, function (_arg_1:Class):void
            {
                _UIContainer_UIPropVO6.cls = _arg_1;
            }, "_UIContainer_UIPropVO6.cls");
            result[15] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.UI_TOOLTIP);
            }, function (_arg_1:int):void
            {
                _UIContainer_UIPropVO6.vid = _arg_1;
            }, "_UIContainer_UIPropVO6.vid");
            result[16] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _UIContainer_UIPropVO6.initVisible = _arg_1;
            }, "_UIContainer_UIPropVO6.initVisible");
            result[17] = binding;
            return (result);
        }

        private function addView():void
        {
            var _local_1:Core = Core.getInstance();
            _local_1.view.addUI(ViewManager.UI_CONTAINER, this, true);
        }

        private function _UIContainer_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = ShadeLayer;
            _local_1 = ViewManager.UI_SHADE;
            _local_1 = false;
            _local_1 = MainLayer;
            _local_1 = ViewManager.UI_MAIN;
            _local_1 = false;
            _local_1 = PanelLayer;
            _local_1 = ViewManager.UI_PANEL;
            _local_1 = false;
            _local_1 = LoginLayer;
            _local_1 = ViewManager.UI_LOGIN;
            _local_1 = true;
            _local_1 = PopupLayer;
            _local_1 = ViewManager.UI_POPUP;
            _local_1 = true;
            _local_1 = TooltipLayer;
            _local_1 = ViewManager.UI_TOOLTIP;
            _local_1 = false;
        }

        public function ___UIContainer_UIBase1_creationComplete(_arg_1:FlexEvent):void
        {
            addView();
        }


    }
}//package com.qeedoo.ui.view

