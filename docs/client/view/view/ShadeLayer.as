// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.ShadeLayer

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
    import com.qeedoo.ui.view.compDragable.PVPShadePanel;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.view.compDragable.PVPRoomListPanel;
    import com.qeedoo.ui.view.compDragable.PVPGroupPanel;
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
    import com.qeedoo.ui.view.compDragable.*;
    import flash.ui.*;
    import flash.filters.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    use namespace mx_internal;

    public class ShadeLayer extends UIBase implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _ShadeLayer_UIPropVO1:UIPropVO;
        public var _ShadeLayer_UIPropVO2:UIPropVO;
        public var _ShadeLayer_UIPropVO3:UIPropVO;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({"type":UIBase});
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function ShadeLayer()
        {
            mx_internal::_document = this;
            _ShadeLayer_Array1_i();
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ShadeLayer._watcherSetupUtil = _arg_1;
        }


        private function _ShadeLayer_UIPropVO1_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _ShadeLayer_UIPropVO1 = _local_1;
            _local_1.name = "PVP竞技场遮罩";
            BindingManager.executeBindings(this, "_ShadeLayer_UIPropVO1", _ShadeLayer_UIPropVO1);
            return (_local_1);
        }

        override public function initialize():void
        {
            var target:ShadeLayer;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ShadeLayer_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_ShadeLayerWatcherSetupUtil");
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

        private function _ShadeLayer_UIPropVO3_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _ShadeLayer_UIPropVO3 = _local_1;
            _local_1.name = "PVP组队等待面板";
            BindingManager.executeBindings(this, "_ShadeLayer_UIPropVO3", _ShadeLayer_UIPropVO3);
            return (_local_1);
        }

        private function _ShadeLayer_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = PVPShadePanel;
            _local_1 = ViewManager.SHADE_PVP;
            _local_1 = false;
            _local_1 = PVPRoomListPanel;
            _local_1 = ViewManager.PANEL_PVP_ROOM_LIST;
            _local_1 = false;
            _local_1 = false;
            _local_1 = PVPGroupPanel;
            _local_1 = ViewManager.POPU_PVP_WAIT;
            _local_1 = false;
            _local_1 = false;
        }

        private function _ShadeLayer_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Class
            {
                return (PVPShadePanel);
            }, function (_arg_1:Class):void
            {
                _ShadeLayer_UIPropVO1.cls = _arg_1;
            }, "_ShadeLayer_UIPropVO1.cls");
            result[0] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.SHADE_PVP);
            }, function (_arg_1:int):void
            {
                _ShadeLayer_UIPropVO1.vid = _arg_1;
            }, "_ShadeLayer_UIPropVO1.vid");
            result[1] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _ShadeLayer_UIPropVO1.initVisible = _arg_1;
            }, "_ShadeLayer_UIPropVO1.initVisible");
            result[2] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PVPRoomListPanel);
            }, function (_arg_1:Class):void
            {
                _ShadeLayer_UIPropVO2.cls = _arg_1;
            }, "_ShadeLayer_UIPropVO2.cls");
            result[3] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_PVP_ROOM_LIST);
            }, function (_arg_1:int):void
            {
                _ShadeLayer_UIPropVO2.vid = _arg_1;
            }, "_ShadeLayer_UIPropVO2.vid");
            result[4] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _ShadeLayer_UIPropVO2.initVisible = _arg_1;
            }, "_ShadeLayer_UIPropVO2.initVisible");
            result[5] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _ShadeLayer_UIPropVO2.createLater = _arg_1;
            }, "_ShadeLayer_UIPropVO2.createLater");
            result[6] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PVPGroupPanel);
            }, function (_arg_1:Class):void
            {
                _ShadeLayer_UIPropVO3.cls = _arg_1;
            }, "_ShadeLayer_UIPropVO3.cls");
            result[7] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.POPU_PVP_WAIT);
            }, function (_arg_1:int):void
            {
                _ShadeLayer_UIPropVO3.vid = _arg_1;
            }, "_ShadeLayer_UIPropVO3.vid");
            result[8] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _ShadeLayer_UIPropVO3.initVisible = _arg_1;
            }, "_ShadeLayer_UIPropVO3.initVisible");
            result[9] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _ShadeLayer_UIPropVO3.createLater = _arg_1;
            }, "_ShadeLayer_UIPropVO3.createLater");
            result[10] = binding;
            return (result);
        }

        private function _ShadeLayer_Array1_i():Array
        {
            var _local_1:Array = [_ShadeLayer_UIPropVO1_i(), _ShadeLayer_UIPropVO2_i(), _ShadeLayer_UIPropVO3_i()];
            uiList = _local_1;
            return (_local_1);
        }

        private function _ShadeLayer_UIPropVO2_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _ShadeLayer_UIPropVO2 = _local_1;
            _local_1.name = "pvp竞技场房间列表";
            _local_1.prop = {
                "dx":100,
                "dy":80
            };
            BindingManager.executeBindings(this, "_ShadeLayer_UIPropVO2", _ShadeLayer_UIPropVO2);
            return (_local_1);
        }


    }
}//package com.qeedoo.ui.view

