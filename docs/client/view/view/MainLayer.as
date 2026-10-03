// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.MainLayer

package com.qeedoo.ui.view
{
    import com.qeedoo.ui.view.comp.UIBase;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.game.vo.UIPropVO;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.binding.BindingManager;
    import mx.binding.Binding;
    import com.qeedoo.ui.view.compMain.SystemBarCanvas;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.view.compMain.UserBarCanvas;
    import com.qeedoo.ui.view.compMain.PortraitCanvas;
    import com.qeedoo.ui.view.compMain.PetCanvas;
    import com.qeedoo.ui.view.compDragable.SysInfoPanel;
    import com.qeedoo.ui.view.compMain.GroupInfoCanvas;
    import com.qeedoo.ui.view.compMain.LongBuffCanvas;
    import com.qeedoo.ui.view.compMain.ActivityCanvas;
    import com.qeedoo.ui.view.compMain.MiniMapCanvas;
    import com.qeedoo.ui.view.compMain.WbRankCanvas;
    import com.qeedoo.ui.view.compMain.WarnCanvas;
    import com.qeedoo.ui.view.compMain.TemporaryBagWarnCanvas;
    import com.qeedoo.ui.view.compMain.AwardWarnCanvas;
    import com.qeedoo.ui.view.compMain.TargetCanvas;
    import com.qeedoo.ui.view.compMain.CenterNoticeCanvas;
    import com.qeedoo.ui.view.compMain.MidWarnCanvas;
    import com.qeedoo.ui.view.compBattle.PlayerCmdCanvas;
    import com.qeedoo.ui.view.compBattle.PetCmdCanvas;
    import com.qeedoo.ui.view.compMain.AutoBattleCanva;
    import com.qeedoo.ui.view.compMain.WbAutoBattleCanva;
    import com.qeedoo.ui.view.compDragable.QuestGuide;
    import com.qeedoo.ui.view.compMain.AntiAddictCanvas;
    import com.qeedoo.ui.view.compMain.GuildwarScoreCanvas;
    import com.qeedoo.ui.view.compMain.AdventureLayer;
    import com.qeedoo.ui.view.compMain.GatherProgressCanvas;
    import com.qeedoo.ui.view.compMain.DogFightCanvas;
    import com.qeedoo.ui.view.compMain.AddItemEffectLayer;
    import com.qeedoo.ui.view.compDragable.MazeInfoPanel;
    import com.qeedoo.ui.view.compDragable.TripleTownTurnPanel;
    import com.qeedoo.ui.view.compMain.BloodyBattleInfoPanel;
    import flash.utils.getDefinitionByName;
    import flash.events.*;
    import flash.display.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.text.*;
    import flash.media.*;
    import mx.binding.*;
    import flash.net.*;
    import com.qeedoo.ui.view.compMain.*;
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

    public class MainLayer extends UIBase implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _MainLayer_UIPropVO10:UIPropVO;
        public var _MainLayer_UIPropVO11:UIPropVO;
        public var _MainLayer_UIPropVO12:UIPropVO;
        public var _MainLayer_UIPropVO14:UIPropVO;
        public var _MainLayer_UIPropVO15:UIPropVO;
        public var _MainLayer_UIPropVO16:UIPropVO;
        public var _MainLayer_UIPropVO17:UIPropVO;
        public var _MainLayer_UIPropVO19:UIPropVO;
        public var _MainLayer_UIPropVO18:UIPropVO;
        public var _MainLayer_UIPropVO13:UIPropVO;
        public var _MainLayer_UIPropVO20:UIPropVO;
        public var _MainLayer_UIPropVO21:UIPropVO;
        public var _MainLayer_UIPropVO23:UIPropVO;
        public var _MainLayer_UIPropVO24:UIPropVO;
        public var _MainLayer_UIPropVO25:UIPropVO;
        public var _MainLayer_UIPropVO1:UIPropVO;
        public var _MainLayer_UIPropVO2:UIPropVO;
        public var _MainLayer_UIPropVO22:UIPropVO;
        public var _MainLayer_UIPropVO4:UIPropVO;
        public var _MainLayer_UIPropVO5:UIPropVO;
        public var _MainLayer_UIPropVO6:UIPropVO;
        public var _MainLayer_UIPropVO26:UIPropVO;
        public var _MainLayer_UIPropVO27:UIPropVO;
        public var _MainLayer_UIPropVO28:UIPropVO;
        public var _MainLayer_UIPropVO29:UIPropVO;
        public var _MainLayer_UIPropVO7:UIPropVO;
        public var _MainLayer_UIPropVO8:UIPropVO;
        public var _MainLayer_UIPropVO9:UIPropVO;
        public var _MainLayer_UIPropVO3:UIPropVO;
        public var _MainLayer_UIPropVO30:UIPropVO;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({"type":UIBase});
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function MainLayer()
        {
            mx_internal::_document = this;
            _MainLayer_Array1_i();
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MainLayer._watcherSetupUtil = _arg_1;
        }


        private function _MainLayer_UIPropVO23_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _MainLayer_UIPropVO23 = _local_1;
            _local_1.name = "行动力显示";
            _local_1.style = {
                "right":60,
                "bottom":140
            };
            BindingManager.executeBindings(this, "_MainLayer_UIPropVO23", _MainLayer_UIPropVO23);
            return (_local_1);
        }

        private function _MainLayer_UIPropVO1_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _MainLayer_UIPropVO1 = _local_1;
            _local_1.name = "系统栏";
            _local_1.style = {
                "right":0,
                "left":0,
                "bottom":0
            };
            BindingManager.executeBindings(this, "_MainLayer_UIPropVO1", _MainLayer_UIPropVO1);
            return (_local_1);
        }

        private function _MainLayer_Array1_i():Array
        {
            var _local_1:Array = [_MainLayer_UIPropVO1_i(), _MainLayer_UIPropVO2_i(), _MainLayer_UIPropVO3_i(), _MainLayer_UIPropVO4_i(), _MainLayer_UIPropVO5_i(), _MainLayer_UIPropVO6_i(), _MainLayer_UIPropVO7_i(), _MainLayer_UIPropVO8_i(), _MainLayer_UIPropVO9_i(), _MainLayer_UIPropVO10_i(), _MainLayer_UIPropVO11_i(), _MainLayer_UIPropVO12_i(), _MainLayer_UIPropVO13_i(), _MainLayer_UIPropVO14_i(), _MainLayer_UIPropVO15_i(), _MainLayer_UIPropVO16_i(), _MainLayer_UIPropVO17_i(), _MainLayer_UIPropVO18_i(), _MainLayer_UIPropVO19_i(), _MainLayer_UIPropVO20_i(), _MainLayer_UIPropVO21_i(), _MainLayer_UIPropVO22_i(), _MainLayer_UIPropVO23_i(), _MainLayer_UIPropVO24_i(), _MainLayer_UIPropVO25_i(), _MainLayer_UIPropVO26_i(), _MainLayer_UIPropVO27_i(), _MainLayer_UIPropVO28_i(), _MainLayer_UIPropVO29_i(), _MainLayer_UIPropVO30_i()];
            uiList = _local_1;
            return (_local_1);
        }

        private function _MainLayer_UIPropVO5_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _MainLayer_UIPropVO5 = _local_1;
            _local_1.name = "系统信息";
            _local_1.style = {
                "left":2,
                "top":280
            };
            BindingManager.executeBindings(this, "_MainLayer_UIPropVO5", _MainLayer_UIPropVO5);
            return (_local_1);
        }

        private function _MainLayer_UIPropVO27_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _MainLayer_UIPropVO27 = _local_1;
            _local_1.name = "得到物品效果层";
            _local_1.style = {
                "right":295,
                "bottom":10
            };
            BindingManager.executeBindings(this, "_MainLayer_UIPropVO27", _MainLayer_UIPropVO27);
            return (_local_1);
        }

        private function _MainLayer_UIPropVO9_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _MainLayer_UIPropVO9 = _local_1;
            _local_1.name = "迷你地图";
            _local_1.style = {
                "right":0,
                "top":0
            };
            BindingManager.executeBindings(this, "_MainLayer_UIPropVO9", _MainLayer_UIPropVO9);
            return (_local_1);
        }

        private function _MainLayer_UIPropVO30_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _MainLayer_UIPropVO30 = _local_1;
            _local_1.name = "血战古堡";
            _local_1.style = {
                "right":0,
                "top":0
            };
            BindingManager.executeBindings(this, "_MainLayer_UIPropVO30", _MainLayer_UIPropVO30);
            return (_local_1);
        }

        private function _MainLayer_UIPropVO11_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _MainLayer_UIPropVO11 = _local_1;
            _local_1.name = "提示区";
            _local_1.style = {
                "right":10,
                "bottom":95
            };
            BindingManager.executeBindings(this, "_MainLayer_UIPropVO11", _MainLayer_UIPropVO11);
            return (_local_1);
        }

        private function _MainLayer_UIPropVO15_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _MainLayer_UIPropVO15 = _local_1;
            _local_1.name = "中间提示框";
            _local_1.style = {};
            BindingManager.executeBindings(this, "_MainLayer_UIPropVO15", _MainLayer_UIPropVO15);
            return (_local_1);
        }

        private function _MainLayer_UIPropVO19_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _MainLayer_UIPropVO19 = _local_1;
            _local_1.name = "自动战斗";
            _local_1.style = {
                "right":50,
                "bottom":100
            };
            BindingManager.executeBindings(this, "_MainLayer_UIPropVO19", _MainLayer_UIPropVO19);
            return (_local_1);
        }

        private function _MainLayer_UIPropVO22_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _MainLayer_UIPropVO22 = _local_1;
            _local_1.name = "防沉迷";
            _local_1.style = {
                "right":70,
                "bottom":90
            };
            BindingManager.executeBindings(this, "_MainLayer_UIPropVO22", _MainLayer_UIPropVO22);
            return (_local_1);
        }

        private function _MainLayer_UIPropVO26_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _MainLayer_UIPropVO26 = _local_1;
            _local_1.name = "个人混战积分面板";
            _local_1.style = {
                "right":50,
                "bottom":150
            };
            BindingManager.executeBindings(this, "_MainLayer_UIPropVO26", _MainLayer_UIPropVO26);
            return (_local_1);
        }

        private function _MainLayer_UIPropVO4_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _MainLayer_UIPropVO4 = _local_1;
            _local_1.name = "宠物头像";
            _local_1.style = {
                "left":2,
                "top":67
            };
            BindingManager.executeBindings(this, "_MainLayer_UIPropVO4", _MainLayer_UIPropVO4);
            return (_local_1);
        }

        private function _MainLayer_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Class
            {
                return (SystemBarCanvas);
            }, function (_arg_1:Class):void
            {
                _MainLayer_UIPropVO1.cls = _arg_1;
            }, "_MainLayer_UIPropVO1.cls");
            result[0] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.MAIN_SYS);
            }, function (_arg_1:int):void
            {
                _MainLayer_UIPropVO1.vid = _arg_1;
            }, "_MainLayer_UIPropVO1.vid");
            result[1] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _MainLayer_UIPropVO1.initVisible = _arg_1;
            }, "_MainLayer_UIPropVO1.initVisible");
            result[2] = binding;
            binding = new Binding(this, function ():Class
            {
                return (UserBarCanvas);
            }, function (_arg_1:Class):void
            {
                _MainLayer_UIPropVO2.cls = _arg_1;
            }, "_MainLayer_UIPropVO2.cls");
            result[3] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.MAIN_USER_BAR);
            }, function (_arg_1:int):void
            {
                _MainLayer_UIPropVO2.vid = _arg_1;
            }, "_MainLayer_UIPropVO2.vid");
            result[4] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _MainLayer_UIPropVO2.initVisible = _arg_1;
            }, "_MainLayer_UIPropVO2.initVisible");
            result[5] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PortraitCanvas);
            }, function (_arg_1:Class):void
            {
                _MainLayer_UIPropVO3.cls = _arg_1;
            }, "_MainLayer_UIPropVO3.cls");
            result[6] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.MAIN_SELF);
            }, function (_arg_1:int):void
            {
                _MainLayer_UIPropVO3.vid = _arg_1;
            }, "_MainLayer_UIPropVO3.vid");
            result[7] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _MainLayer_UIPropVO3.initVisible = _arg_1;
            }, "_MainLayer_UIPropVO3.initVisible");
            result[8] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PetCanvas);
            }, function (_arg_1:Class):void
            {
                _MainLayer_UIPropVO4.cls = _arg_1;
            }, "_MainLayer_UIPropVO4.cls");
            result[9] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.MAIN_PET);
            }, function (_arg_1:int):void
            {
                _MainLayer_UIPropVO4.vid = _arg_1;
            }, "_MainLayer_UIPropVO4.vid");
            result[10] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _MainLayer_UIPropVO4.initVisible = _arg_1;
            }, "_MainLayer_UIPropVO4.initVisible");
            result[11] = binding;
            binding = new Binding(this, function ():Class
            {
                return (SysInfoPanel);
            }, function (_arg_1:Class):void
            {
                _MainLayer_UIPropVO5.cls = _arg_1;
            }, "_MainLayer_UIPropVO5.cls");
            result[12] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.MAIN_SYSTEM_INFO);
            }, function (_arg_1:int):void
            {
                _MainLayer_UIPropVO5.vid = _arg_1;
            }, "_MainLayer_UIPropVO5.vid");
            result[13] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _MainLayer_UIPropVO5.initVisible = _arg_1;
            }, "_MainLayer_UIPropVO5.initVisible");
            result[14] = binding;
            binding = new Binding(this, function ():Class
            {
                return (GroupInfoCanvas);
            }, function (_arg_1:Class):void
            {
                _MainLayer_UIPropVO6.cls = _arg_1;
            }, "_MainLayer_UIPropVO6.cls");
            result[15] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.MAIN_GROUP);
            }, function (_arg_1:int):void
            {
                _MainLayer_UIPropVO6.vid = _arg_1;
            }, "_MainLayer_UIPropVO6.vid");
            result[16] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _MainLayer_UIPropVO6.initVisible = _arg_1;
            }, "_MainLayer_UIPropVO6.initVisible");
            result[17] = binding;
            binding = new Binding(this, function ():Class
            {
                return (LongBuffCanvas);
            }, function (_arg_1:Class):void
            {
                _MainLayer_UIPropVO7.cls = _arg_1;
            }, "_MainLayer_UIPropVO7.cls");
            result[18] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.MAIN_LONGBUFF);
            }, function (_arg_1:int):void
            {
                _MainLayer_UIPropVO7.vid = _arg_1;
            }, "_MainLayer_UIPropVO7.vid");
            result[19] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _MainLayer_UIPropVO7.initVisible = _arg_1;
            }, "_MainLayer_UIPropVO7.initVisible");
            result[20] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ActivityCanvas);
            }, function (_arg_1:Class):void
            {
                _MainLayer_UIPropVO8.cls = _arg_1;
            }, "_MainLayer_UIPropVO8.cls");
            result[21] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.MAIN_ACTIVITY);
            }, function (_arg_1:int):void
            {
                _MainLayer_UIPropVO8.vid = _arg_1;
            }, "_MainLayer_UIPropVO8.vid");
            result[22] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _MainLayer_UIPropVO8.initVisible = _arg_1;
            }, "_MainLayer_UIPropVO8.initVisible");
            result[23] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MiniMapCanvas);
            }, function (_arg_1:Class):void
            {
                _MainLayer_UIPropVO9.cls = _arg_1;
            }, "_MainLayer_UIPropVO9.cls");
            result[24] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.MAIN_MINIMAP);
            }, function (_arg_1:int):void
            {
                _MainLayer_UIPropVO9.vid = _arg_1;
            }, "_MainLayer_UIPropVO9.vid");
            result[25] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _MainLayer_UIPropVO9.initVisible = _arg_1;
            }, "_MainLayer_UIPropVO9.initVisible");
            result[26] = binding;
            binding = new Binding(this, function ():Class
            {
                return (WbRankCanvas);
            }, function (_arg_1:Class):void
            {
                _MainLayer_UIPropVO10.cls = _arg_1;
            }, "_MainLayer_UIPropVO10.cls");
            result[27] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.WB_RANK_CANVAS);
            }, function (_arg_1:int):void
            {
                _MainLayer_UIPropVO10.vid = _arg_1;
            }, "_MainLayer_UIPropVO10.vid");
            result[28] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _MainLayer_UIPropVO10.initVisible = _arg_1;
            }, "_MainLayer_UIPropVO10.initVisible");
            result[29] = binding;
            binding = new Binding(this, function ():Class
            {
                return (WarnCanvas);
            }, function (_arg_1:Class):void
            {
                _MainLayer_UIPropVO11.cls = _arg_1;
            }, "_MainLayer_UIPropVO11.cls");
            result[30] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.MAIN_WARN);
            }, function (_arg_1:int):void
            {
                _MainLayer_UIPropVO11.vid = _arg_1;
            }, "_MainLayer_UIPropVO11.vid");
            result[31] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _MainLayer_UIPropVO11.initVisible = _arg_1;
            }, "_MainLayer_UIPropVO11.initVisible");
            result[32] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TemporaryBagWarnCanvas);
            }, function (_arg_1:Class):void
            {
                _MainLayer_UIPropVO12.cls = _arg_1;
            }, "_MainLayer_UIPropVO12.cls");
            result[33] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.MAIN_TEMP_BAG_WARN);
            }, function (_arg_1:int):void
            {
                _MainLayer_UIPropVO12.vid = _arg_1;
            }, "_MainLayer_UIPropVO12.vid");
            result[34] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _MainLayer_UIPropVO12.initVisible = _arg_1;
            }, "_MainLayer_UIPropVO12.initVisible");
            result[35] = binding;
            binding = new Binding(this, function ():Class
            {
                return (AwardWarnCanvas);
            }, function (_arg_1:Class):void
            {
                _MainLayer_UIPropVO13.cls = _arg_1;
            }, "_MainLayer_UIPropVO13.cls");
            result[36] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.MAIN_AWARD_WARN);
            }, function (_arg_1:int):void
            {
                _MainLayer_UIPropVO13.vid = _arg_1;
            }, "_MainLayer_UIPropVO13.vid");
            result[37] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _MainLayer_UIPropVO13.initVisible = _arg_1;
            }, "_MainLayer_UIPropVO13.initVisible");
            result[38] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TargetCanvas);
            }, function (_arg_1:Class):void
            {
                _MainLayer_UIPropVO14.cls = _arg_1;
            }, "_MainLayer_UIPropVO14.cls");
            result[39] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.MAIN_TARGET);
            }, function (_arg_1:int):void
            {
                _MainLayer_UIPropVO14.vid = _arg_1;
            }, "_MainLayer_UIPropVO14.vid");
            result[40] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _MainLayer_UIPropVO14.initVisible = _arg_1;
            }, "_MainLayer_UIPropVO14.initVisible");
            result[41] = binding;
            binding = new Binding(this, function ():Class
            {
                return (CenterNoticeCanvas);
            }, function (_arg_1:Class):void
            {
                _MainLayer_UIPropVO15.cls = _arg_1;
            }, "_MainLayer_UIPropVO15.cls");
            result[42] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.MAIN_CNOTICE);
            }, function (_arg_1:int):void
            {
                _MainLayer_UIPropVO15.vid = _arg_1;
            }, "_MainLayer_UIPropVO15.vid");
            result[43] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _MainLayer_UIPropVO15.initVisible = _arg_1;
            }, "_MainLayer_UIPropVO15.initVisible");
            result[44] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MidWarnCanvas);
            }, function (_arg_1:Class):void
            {
                _MainLayer_UIPropVO16.cls = _arg_1;
            }, "_MainLayer_UIPropVO16.cls");
            result[45] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.MID_MAIN_WARN);
            }, function (_arg_1:int):void
            {
                _MainLayer_UIPropVO16.vid = _arg_1;
            }, "_MainLayer_UIPropVO16.vid");
            result[46] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _MainLayer_UIPropVO16.initVisible = _arg_1;
            }, "_MainLayer_UIPropVO16.initVisible");
            result[47] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PlayerCmdCanvas);
            }, function (_arg_1:Class):void
            {
                _MainLayer_UIPropVO17.cls = _arg_1;
            }, "_MainLayer_UIPropVO17.cls");
            result[48] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.MAIN_BATTLE_PLAYER);
            }, function (_arg_1:int):void
            {
                _MainLayer_UIPropVO17.vid = _arg_1;
            }, "_MainLayer_UIPropVO17.vid");
            result[49] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _MainLayer_UIPropVO17.initVisible = _arg_1;
            }, "_MainLayer_UIPropVO17.initVisible");
            result[50] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PetCmdCanvas);
            }, function (_arg_1:Class):void
            {
                _MainLayer_UIPropVO18.cls = _arg_1;
            }, "_MainLayer_UIPropVO18.cls");
            result[51] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.MAIN_BATTLE_PET);
            }, function (_arg_1:int):void
            {
                _MainLayer_UIPropVO18.vid = _arg_1;
            }, "_MainLayer_UIPropVO18.vid");
            result[52] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _MainLayer_UIPropVO18.initVisible = _arg_1;
            }, "_MainLayer_UIPropVO18.initVisible");
            result[53] = binding;
            binding = new Binding(this, function ():Class
            {
                return (AutoBattleCanva);
            }, function (_arg_1:Class):void
            {
                _MainLayer_UIPropVO19.cls = _arg_1;
            }, "_MainLayer_UIPropVO19.cls");
            result[54] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.MAIN_AUTOBATTLE_SET);
            }, function (_arg_1:int):void
            {
                _MainLayer_UIPropVO19.vid = _arg_1;
            }, "_MainLayer_UIPropVO19.vid");
            result[55] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _MainLayer_UIPropVO19.initVisible = _arg_1;
            }, "_MainLayer_UIPropVO19.initVisible");
            result[56] = binding;
            binding = new Binding(this, function ():Class
            {
                return (WbAutoBattleCanva);
            }, function (_arg_1:Class):void
            {
                _MainLayer_UIPropVO20.cls = _arg_1;
            }, "_MainLayer_UIPropVO20.cls");
            result[57] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_WB_BATTLEAUTO);
            }, function (_arg_1:int):void
            {
                _MainLayer_UIPropVO20.vid = _arg_1;
            }, "_MainLayer_UIPropVO20.vid");
            result[58] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _MainLayer_UIPropVO20.initVisible = _arg_1;
            }, "_MainLayer_UIPropVO20.initVisible");
            result[59] = binding;
            binding = new Binding(this, function ():Class
            {
                return (QuestGuide);
            }, function (_arg_1:Class):void
            {
                _MainLayer_UIPropVO21.cls = _arg_1;
            }, "_MainLayer_UIPropVO21.cls");
            result[60] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.MAIN_QUEST_GUIDE);
            }, function (_arg_1:int):void
            {
                _MainLayer_UIPropVO21.vid = _arg_1;
            }, "_MainLayer_UIPropVO21.vid");
            result[61] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _MainLayer_UIPropVO21.initVisible = _arg_1;
            }, "_MainLayer_UIPropVO21.initVisible");
            result[62] = binding;
            binding = new Binding(this, function ():Class
            {
                return (AntiAddictCanvas);
            }, function (_arg_1:Class):void
            {
                _MainLayer_UIPropVO22.cls = _arg_1;
            }, "_MainLayer_UIPropVO22.cls");
            result[63] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.MAIN_ADDICT_WARN);
            }, function (_arg_1:int):void
            {
                _MainLayer_UIPropVO22.vid = _arg_1;
            }, "_MainLayer_UIPropVO22.vid");
            result[64] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _MainLayer_UIPropVO22.initVisible = _arg_1;
            }, "_MainLayer_UIPropVO22.initVisible");
            result[65] = binding;
            binding = new Binding(this, function ():Class
            {
                return (GuildwarScoreCanvas);
            }, function (_arg_1:Class):void
            {
                _MainLayer_UIPropVO23.cls = _arg_1;
            }, "_MainLayer_UIPropVO23.cls");
            result[66] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.MAIN_GW_SCORE);
            }, function (_arg_1:int):void
            {
                _MainLayer_UIPropVO23.vid = _arg_1;
            }, "_MainLayer_UIPropVO23.vid");
            result[67] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _MainLayer_UIPropVO23.initVisible = _arg_1;
            }, "_MainLayer_UIPropVO23.initVisible");
            result[68] = binding;
            binding = new Binding(this, function ():Class
            {
                return (AdventureLayer);
            }, function (_arg_1:Class):void
            {
                _MainLayer_UIPropVO24.cls = _arg_1;
            }, "_MainLayer_UIPropVO24.cls");
            result[69] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.MAIN_ADVENTURE);
            }, function (_arg_1:int):void
            {
                _MainLayer_UIPropVO24.vid = _arg_1;
            }, "_MainLayer_UIPropVO24.vid");
            result[70] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _MainLayer_UIPropVO24.initVisible = _arg_1;
            }, "_MainLayer_UIPropVO24.initVisible");
            result[71] = binding;
            binding = new Binding(this, function ():Class
            {
                return (GatherProgressCanvas);
            }, function (_arg_1:Class):void
            {
                _MainLayer_UIPropVO25.cls = _arg_1;
            }, "_MainLayer_UIPropVO25.cls");
            result[72] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.MAIN_GATHER_PROGRESS);
            }, function (_arg_1:int):void
            {
                _MainLayer_UIPropVO25.vid = _arg_1;
            }, "_MainLayer_UIPropVO25.vid");
            result[73] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _MainLayer_UIPropVO25.initVisible = _arg_1;
            }, "_MainLayer_UIPropVO25.initVisible");
            result[74] = binding;
            binding = new Binding(this, function ():Class
            {
                return (DogFightCanvas);
            }, function (_arg_1:Class):void
            {
                _MainLayer_UIPropVO26.cls = _arg_1;
            }, "_MainLayer_UIPropVO26.cls");
            result[75] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.MAIN_DOG_FIGHT);
            }, function (_arg_1:int):void
            {
                _MainLayer_UIPropVO26.vid = _arg_1;
            }, "_MainLayer_UIPropVO26.vid");
            result[76] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _MainLayer_UIPropVO26.initVisible = _arg_1;
            }, "_MainLayer_UIPropVO26.initVisible");
            result[77] = binding;
            binding = new Binding(this, function ():Class
            {
                return (AddItemEffectLayer);
            }, function (_arg_1:Class):void
            {
                _MainLayer_UIPropVO27.cls = _arg_1;
            }, "_MainLayer_UIPropVO27.cls");
            result[78] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.MAIN_ADD_ITEM_EFFECT);
            }, function (_arg_1:int):void
            {
                _MainLayer_UIPropVO27.vid = _arg_1;
            }, "_MainLayer_UIPropVO27.vid");
            result[79] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _MainLayer_UIPropVO27.initVisible = _arg_1;
            }, "_MainLayer_UIPropVO27.initVisible");
            result[80] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MazeInfoPanel);
            }, function (_arg_1:Class):void
            {
                _MainLayer_UIPropVO28.cls = _arg_1;
            }, "_MainLayer_UIPropVO28.cls");
            result[81] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_MAZE_INFO);
            }, function (_arg_1:int):void
            {
                _MainLayer_UIPropVO28.vid = _arg_1;
            }, "_MainLayer_UIPropVO28.vid");
            result[82] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _MainLayer_UIPropVO28.initVisible = _arg_1;
            }, "_MainLayer_UIPropVO28.initVisible");
            result[83] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TripleTownTurnPanel);
            }, function (_arg_1:Class):void
            {
                _MainLayer_UIPropVO29.cls = _arg_1;
            }, "_MainLayer_UIPropVO29.cls");
            result[84] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_TRIPLE_TURN);
            }, function (_arg_1:int):void
            {
                _MainLayer_UIPropVO29.vid = _arg_1;
            }, "_MainLayer_UIPropVO29.vid");
            result[85] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _MainLayer_UIPropVO29.initVisible = _arg_1;
            }, "_MainLayer_UIPropVO29.initVisible");
            result[86] = binding;
            binding = new Binding(this, function ():Class
            {
                return (BloodyBattleInfoPanel);
            }, function (_arg_1:Class):void
            {
                _MainLayer_UIPropVO30.cls = _arg_1;
            }, "_MainLayer_UIPropVO30.cls");
            result[87] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_BLOODY_BATTLE_INFO);
            }, function (_arg_1:int):void
            {
                _MainLayer_UIPropVO30.vid = _arg_1;
            }, "_MainLayer_UIPropVO30.vid");
            result[88] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _MainLayer_UIPropVO30.initVisible = _arg_1;
            }, "_MainLayer_UIPropVO30.initVisible");
            result[89] = binding;
            return (result);
        }

        private function _MainLayer_UIPropVO8_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _MainLayer_UIPropVO8 = _local_1;
            _local_1.name = "日常活动";
            _local_1.style = {
                "right":190,
                "top":0
            };
            BindingManager.executeBindings(this, "_MainLayer_UIPropVO8", _MainLayer_UIPropVO8);
            return (_local_1);
        }

        private function _MainLayer_UIPropVO10_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _MainLayer_UIPropVO10 = _local_1;
            _local_1.name = "世界BOSS排行榜";
            _local_1.style = {
                "right":0,
                "top":140
            };
            BindingManager.executeBindings(this, "_MainLayer_UIPropVO10", _MainLayer_UIPropVO10);
            return (_local_1);
        }

        private function _MainLayer_UIPropVO14_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _MainLayer_UIPropVO14 = _local_1;
            _local_1.name = "目标头像";
            _local_1.style = {};
            BindingManager.executeBindings(this, "_MainLayer_UIPropVO14", _MainLayer_UIPropVO14);
            return (_local_1);
        }

        private function _MainLayer_UIPropVO18_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _MainLayer_UIPropVO18 = _local_1;
            _local_1.name = "宠物行动";
            _local_1.style = {
                "right":50,
                "top":218
            };
            BindingManager.executeBindings(this, "_MainLayer_UIPropVO18", _MainLayer_UIPropVO18);
            return (_local_1);
        }

        private function _MainLayer_UIPropVO21_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _MainLayer_UIPropVO21 = _local_1;
            _local_1.name = "任务引导";
            _local_1.prop = {
                "x":650,
                "y":140
            };
            BindingManager.executeBindings(this, "_MainLayer_UIPropVO21", _MainLayer_UIPropVO21);
            return (_local_1);
        }

        private function _MainLayer_UIPropVO25_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _MainLayer_UIPropVO25 = _local_1;
            _local_1.name = "采集进度层";
            _local_1.style = {
                "left":250,
                "top":100
            };
            BindingManager.executeBindings(this, "_MainLayer_UIPropVO25", _MainLayer_UIPropVO25);
            return (_local_1);
        }

        private function _MainLayer_UIPropVO3_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _MainLayer_UIPropVO3 = _local_1;
            _local_1.name = "角色头像";
            _local_1.style = {
                "left":2,
                "top":5
            };
            BindingManager.executeBindings(this, "_MainLayer_UIPropVO3", _MainLayer_UIPropVO3);
            return (_local_1);
        }

        private function _MainLayer_UIPropVO7_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _MainLayer_UIPropVO7 = _local_1;
            _local_1.name = "增益栏";
            _local_1.style = {
                "left":2,
                "top":115
            };
            BindingManager.executeBindings(this, "_MainLayer_UIPropVO7", _MainLayer_UIPropVO7);
            return (_local_1);
        }

        private function _MainLayer_UIPropVO29_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _MainLayer_UIPropVO29 = _local_1;
            _local_1.name = "转向信息";
            _local_1.style = {
                "right":0,
                "top":0
            };
            BindingManager.executeBindings(this, "_MainLayer_UIPropVO29", _MainLayer_UIPropVO29);
            return (_local_1);
        }

        override public function initialize():void
        {
            var target:MainLayer;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MainLayer_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_MainLayerWatcherSetupUtil");
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

        private function _MainLayer_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = SystemBarCanvas;
            _local_1 = ViewManager.MAIN_SYS;
            _local_1 = true;
            _local_1 = UserBarCanvas;
            _local_1 = ViewManager.MAIN_USER_BAR;
            _local_1 = true;
            _local_1 = PortraitCanvas;
            _local_1 = ViewManager.MAIN_SELF;
            _local_1 = true;
            _local_1 = PetCanvas;
            _local_1 = ViewManager.MAIN_PET;
            _local_1 = false;
            _local_1 = SysInfoPanel;
            _local_1 = ViewManager.MAIN_SYSTEM_INFO;
            _local_1 = false;
            _local_1 = GroupInfoCanvas;
            _local_1 = ViewManager.MAIN_GROUP;
            _local_1 = true;
            _local_1 = LongBuffCanvas;
            _local_1 = ViewManager.MAIN_LONGBUFF;
            _local_1 = true;
            _local_1 = ActivityCanvas;
            _local_1 = ViewManager.MAIN_ACTIVITY;
            _local_1 = true;
            _local_1 = MiniMapCanvas;
            _local_1 = ViewManager.MAIN_MINIMAP;
            _local_1 = true;
            _local_1 = WbRankCanvas;
            _local_1 = ViewManager.WB_RANK_CANVAS;
            _local_1 = false;
            _local_1 = WarnCanvas;
            _local_1 = ViewManager.MAIN_WARN;
            _local_1 = true;
            _local_1 = TemporaryBagWarnCanvas;
            _local_1 = ViewManager.MAIN_TEMP_BAG_WARN;
            _local_1 = false;
            _local_1 = AwardWarnCanvas;
            _local_1 = ViewManager.MAIN_AWARD_WARN;
            _local_1 = false;
            _local_1 = TargetCanvas;
            _local_1 = ViewManager.MAIN_TARGET;
            _local_1 = false;
            _local_1 = CenterNoticeCanvas;
            _local_1 = ViewManager.MAIN_CNOTICE;
            _local_1 = false;
            _local_1 = MidWarnCanvas;
            _local_1 = ViewManager.MID_MAIN_WARN;
            _local_1 = true;
            _local_1 = PlayerCmdCanvas;
            _local_1 = ViewManager.MAIN_BATTLE_PLAYER;
            _local_1 = false;
            _local_1 = PetCmdCanvas;
            _local_1 = ViewManager.MAIN_BATTLE_PET;
            _local_1 = false;
            _local_1 = AutoBattleCanva;
            _local_1 = ViewManager.MAIN_AUTOBATTLE_SET;
            _local_1 = false;
            _local_1 = WbAutoBattleCanva;
            _local_1 = ViewManager.PANEL_WB_BATTLEAUTO;
            _local_1 = false;
            _local_1 = QuestGuide;
            _local_1 = ViewManager.MAIN_QUEST_GUIDE;
            _local_1 = true;
            _local_1 = AntiAddictCanvas;
            _local_1 = ViewManager.MAIN_ADDICT_WARN;
            _local_1 = false;
            _local_1 = GuildwarScoreCanvas;
            _local_1 = ViewManager.MAIN_GW_SCORE;
            _local_1 = false;
            _local_1 = AdventureLayer;
            _local_1 = ViewManager.MAIN_ADVENTURE;
            _local_1 = true;
            _local_1 = GatherProgressCanvas;
            _local_1 = ViewManager.MAIN_GATHER_PROGRESS;
            _local_1 = false;
            _local_1 = DogFightCanvas;
            _local_1 = ViewManager.MAIN_DOG_FIGHT;
            _local_1 = false;
            _local_1 = AddItemEffectLayer;
            _local_1 = ViewManager.MAIN_ADD_ITEM_EFFECT;
            _local_1 = false;
            _local_1 = MazeInfoPanel;
            _local_1 = ViewManager.PANEL_MAZE_INFO;
            _local_1 = false;
            _local_1 = TripleTownTurnPanel;
            _local_1 = ViewManager.PANEL_TRIPLE_TURN;
            _local_1 = false;
            _local_1 = BloodyBattleInfoPanel;
            _local_1 = ViewManager.PANEL_BLOODY_BATTLE_INFO;
            _local_1 = false;
        }

        private function _MainLayer_UIPropVO13_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _MainLayer_UIPropVO13 = _local_1;
            _local_1.name = "奖励提示区";
            _local_1.style = {
                "right":80,
                "bottom":170
            };
            BindingManager.executeBindings(this, "_MainLayer_UIPropVO13", _MainLayer_UIPropVO13);
            return (_local_1);
        }

        private function _MainLayer_UIPropVO17_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _MainLayer_UIPropVO17 = _local_1;
            _local_1.name = "角色行动";
            _local_1.style = {
                "right":50,
                "top":100
            };
            BindingManager.executeBindings(this, "_MainLayer_UIPropVO17", _MainLayer_UIPropVO17);
            return (_local_1);
        }

        private function _MainLayer_UIPropVO28_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _MainLayer_UIPropVO28 = _local_1;
            _local_1.name = "迷阵信息";
            _local_1.style = {
                "right":0,
                "top":0
            };
            BindingManager.executeBindings(this, "_MainLayer_UIPropVO28", _MainLayer_UIPropVO28);
            return (_local_1);
        }

        private function _MainLayer_UIPropVO6_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _MainLayer_UIPropVO6 = _local_1;
            _local_1.name = "队伍栏";
            _local_1.style = {
                "left":2,
                "top":147
            };
            BindingManager.executeBindings(this, "_MainLayer_UIPropVO6", _MainLayer_UIPropVO6);
            return (_local_1);
        }

        private function _MainLayer_UIPropVO24_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _MainLayer_UIPropVO24 = _local_1;
            _local_1.name = "奇遇动画层";
            _local_1.style = {
                "left":0,
                "top":0
            };
            BindingManager.executeBindings(this, "_MainLayer_UIPropVO24", _MainLayer_UIPropVO24);
            return (_local_1);
        }

        private function _MainLayer_UIPropVO16_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _MainLayer_UIPropVO16 = _local_1;
            _local_1.name = "中间提示区";
            _local_1.style = {};
            BindingManager.executeBindings(this, "_MainLayer_UIPropVO16", _MainLayer_UIPropVO16);
            return (_local_1);
        }

        private function _MainLayer_UIPropVO20_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _MainLayer_UIPropVO20 = _local_1;
            _local_1.name = "自动参战";
            _local_1.style = {
                "right":400,
                "top":100
            };
            BindingManager.executeBindings(this, "_MainLayer_UIPropVO20", _MainLayer_UIPropVO20);
            return (_local_1);
        }

        private function _MainLayer_UIPropVO12_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _MainLayer_UIPropVO12 = _local_1;
            _local_1.name = "临时背包提示区";
            _local_1.style = {
                "horizontalCenter":100,
                "verticalCenter":100
            };
            BindingManager.executeBindings(this, "_MainLayer_UIPropVO12", _MainLayer_UIPropVO12);
            return (_local_1);
        }

        private function _MainLayer_UIPropVO2_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _MainLayer_UIPropVO2 = _local_1;
            _local_1.name = "用户栏";
            _local_1.style = {
                "right":0,
                "bottom":44
            };
            BindingManager.executeBindings(this, "_MainLayer_UIPropVO2", _MainLayer_UIPropVO2);
            return (_local_1);
        }


    }
}//package com.qeedoo.ui.view

