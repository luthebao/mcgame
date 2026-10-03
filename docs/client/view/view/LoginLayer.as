// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.LoginLayer

package com.qeedoo.ui.view
{
    import com.qeedoo.ui.view.comp.UIBase;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.game.vo.UIPropVO;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.binding.BindingManager;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.ui.view.compFore.CharSelectCanvas;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.view.compFore.LoginCanvas;
    import com.qeedoo.ui.view.compFore.LineSelectCanvas;
    import flash.events.*;
    import flash.display.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.text.*;
    import flash.media.*;
    import mx.binding.*;
    import flash.net.*;
    import com.qeedoo.ui.view.compFore.*;
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

    public class LoginLayer extends UIBase implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _LoginLayer_UIPropVO1:UIPropVO;
        public var _LoginLayer_UIPropVO2:UIPropVO;
        public var _LoginLayer_UIPropVO3:UIPropVO;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({"type":UIBase});
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function LoginLayer()
        {
            mx_internal::_document = this;
            _LoginLayer_Array1_i();
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            LoginLayer._watcherSetupUtil = _arg_1;
        }


        private function _LoginLayer_UIPropVO1_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _LoginLayer_UIPropVO1 = _local_1;
            _local_1.name = "角色选择界面";
            _local_1.style = {
                "horizontalCenter":0,
                "verticalCenter":0
            };
            BindingManager.executeBindings(this, "_LoginLayer_UIPropVO1", _LoginLayer_UIPropVO1);
            return (_local_1);
        }

        override public function initialize():void
        {
            var target:LoginLayer;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _LoginLayer_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_LoginLayerWatcherSetupUtil");
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

        private function _LoginLayer_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = CharSelectCanvas;
            _local_1 = ViewManager.FORE_C_C;
            _local_1 = false;
            _local_1 = LoginCanvas;
            _local_1 = ViewManager.FORE_L_R;
            _local_1 = true;
            _local_1 = LineSelectCanvas;
            _local_1 = ViewManager.MAIN_LINE;
            _local_1 = false;
        }

        private function _LoginLayer_UIPropVO3_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _LoginLayer_UIPropVO3 = _local_1;
            _local_1.name = "线选择栏";
            _local_1.style = {
                "horizontalCenter":0,
                "verticalCenter":0
            };
            BindingManager.executeBindings(this, "_LoginLayer_UIPropVO3", _LoginLayer_UIPropVO3);
            return (_local_1);
        }

        private function _LoginLayer_Array1_i():Array
        {
            var _local_1:Array = [_LoginLayer_UIPropVO1_i(), _LoginLayer_UIPropVO2_i(), _LoginLayer_UIPropVO3_i()];
            uiList = _local_1;
            return (_local_1);
        }

        private function _LoginLayer_UIPropVO2_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _LoginLayer_UIPropVO2 = _local_1;
            _local_1.name = "登陆界面";
            _local_1.style = {
                "horizontalCenter":0,
                "verticalCenter":0
            };
            BindingManager.executeBindings(this, "_LoginLayer_UIPropVO2", _LoginLayer_UIPropVO2);
            return (_local_1);
        }

        private function _LoginLayer_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Class
            {
                return (CharSelectCanvas);
            }, function (_arg_1:Class):void
            {
                _LoginLayer_UIPropVO1.cls = _arg_1;
            }, "_LoginLayer_UIPropVO1.cls");
            result[0] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.FORE_C_C);
            }, function (_arg_1:int):void
            {
                _LoginLayer_UIPropVO1.vid = _arg_1;
            }, "_LoginLayer_UIPropVO1.vid");
            result[1] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _LoginLayer_UIPropVO1.initVisible = _arg_1;
            }, "_LoginLayer_UIPropVO1.initVisible");
            result[2] = binding;
            binding = new Binding(this, function ():Class
            {
                return (LoginCanvas);
            }, function (_arg_1:Class):void
            {
                _LoginLayer_UIPropVO2.cls = _arg_1;
            }, "_LoginLayer_UIPropVO2.cls");
            result[3] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.FORE_L_R);
            }, function (_arg_1:int):void
            {
                _LoginLayer_UIPropVO2.vid = _arg_1;
            }, "_LoginLayer_UIPropVO2.vid");
            result[4] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _LoginLayer_UIPropVO2.initVisible = _arg_1;
            }, "_LoginLayer_UIPropVO2.initVisible");
            result[5] = binding;
            binding = new Binding(this, function ():Class
            {
                return (LineSelectCanvas);
            }, function (_arg_1:Class):void
            {
                _LoginLayer_UIPropVO3.cls = _arg_1;
            }, "_LoginLayer_UIPropVO3.cls");
            result[6] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.MAIN_LINE);
            }, function (_arg_1:int):void
            {
                _LoginLayer_UIPropVO3.vid = _arg_1;
            }, "_LoginLayer_UIPropVO3.vid");
            result[7] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _LoginLayer_UIPropVO3.initVisible = _arg_1;
            }, "_LoginLayer_UIPropVO3.initVisible");
            result[8] = binding;
            return (result);
        }


    }
}//package com.qeedoo.ui.view

