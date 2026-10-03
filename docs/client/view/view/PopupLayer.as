// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.PopupLayer

package com.qeedoo.ui.view
{
    import com.qeedoo.ui.view.comp.UIBase;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.game.vo.UIPropVO;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.binding.BindingManager;
    import com.qeedoo.ui.view.compDragable.NumPanel;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.view.compDragable.InputPanel;
    import com.qeedoo.ui.view.compMain.SystemMsgCanvas;
    import com.qeedoo.ui.view.comp.StarInstanceMap;
    import com.qeedoo.ui.view.compMain.PetSoulProductPanel;
    import com.qeedoo.ui.view.compDragable.SoulExchangePanel;
    import com.qeedoo.ui.view.compMain.NoticeMsgCanvas;
    import com.qeedoo.ui.view.compFore.LineSelectCanvas;
    import com.qeedoo.ui.view.compMain.WorldMap;
    import com.qeedoo.ui.view.compMain.UIHelp;
    import com.qeedoo.ui.view.compMain.WaitingPanel;
    import com.qeedoo.ui.view.compDragable.GuidePopPanel;
    import com.qeedoo.ui.view.compDragable.ConsumPanel;
    import com.qeedoo.ui.view.compDragable.MoneyItemPanel;
    import com.qeedoo.ui.view.compDragable.DPassPanel;
    import com.qeedoo.ui.view.compMain.NetEnvSelectCanvas;
    import com.qeedoo.ui.view.compDragable.ChatConfigPanel;
    import com.qeedoo.ui.view.compDragable.MarriageSeekingPanel;
    import com.qeedoo.ui.view.compDragable.GuideAlertPanel;
    import com.qeedoo.ui.view.compDragable.LocalAlertPanel;
    import com.qeedoo.ui.view.compDragable.GuidePanel;
    import com.qeedoo.ui.view.compDragable.SendQxWishPanel;
    import com.qeedoo.ui.view.compDragable.SendVDAYWishPanel;
    import com.qeedoo.ui.view.comp.AIConfPanel;
    import com.qeedoo.ui.view.comp.AIConfPetArenaActPanel;
    import com.qeedoo.ui.view.compDragable.FazendaShop;
    import com.qeedoo.ui.view.compDragable.FazendaBag;
    import com.qeedoo.ui.view.compDragable.FazendaLogPanel;
    import com.qeedoo.ui.view.compDragable.GroupRecruitUpdatePanel;
    import com.qeedoo.ui.view.comp.StarBattleReport;
    import com.qeedoo.ui.view.compDragable.TitleCustomPanel;
    import com.qeedoo.ui.view.compDragable.GuessNumberPanel;
    import com.qeedoo.ui.view.comp.PetPVEAIConfPanel;
    import com.qeedoo.ui.view.comp.MCZDPetAIConfPanel;
    import com.qeedoo.ui.view.comp.MCZDBattleReport;
    import mx.binding.Binding;
    import mx.events.FlexEvent;
    import flash.utils.getDefinitionByName;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.ui.view.comp.CustomMenu;
    import flash.events.*;
    import flash.display.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.text.*;
    import flash.media.*;
    import mx.binding.*;
    import flash.net.*;
    import flash.utils.*;
    import com.qeedoo.ui.view.comp.*;
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

    public class PopupLayer extends UIBase implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _PopupLayer_UIPropVO1:UIPropVO;
        public var _PopupLayer_UIPropVO2:UIPropVO;
        public var _PopupLayer_UIPropVO3:UIPropVO;
        public var _PopupLayer_UIPropVO4:UIPropVO;
        public var _PopupLayer_UIPropVO5:UIPropVO;
        public var _PopupLayer_UIPropVO6:UIPropVO;
        public var _PopupLayer_UIPropVO7:UIPropVO;
        public var _PopupLayer_UIPropVO8:UIPropVO;
        public var _PopupLayer_UIPropVO9:UIPropVO;
        public var _PopupLayer_UIPropVO10:UIPropVO;
        public var _PopupLayer_UIPropVO11:UIPropVO;
        public var _PopupLayer_UIPropVO12:UIPropVO;
        public var _PopupLayer_UIPropVO13:UIPropVO;
        public var _PopupLayer_UIPropVO14:UIPropVO;
        public var _PopupLayer_UIPropVO15:UIPropVO;
        public var _PopupLayer_UIPropVO16:UIPropVO;
        public var _PopupLayer_UIPropVO17:UIPropVO;
        public var _PopupLayer_UIPropVO18:UIPropVO;
        public var _PopupLayer_UIPropVO19:UIPropVO;
        public var _PopupLayer_UIPropVO20:UIPropVO;
        public var _PopupLayer_UIPropVO21:UIPropVO;
        public var _PopupLayer_UIPropVO22:UIPropVO;
        public var _PopupLayer_UIPropVO23:UIPropVO;
        public var _PopupLayer_UIPropVO24:UIPropVO;
        public var _PopupLayer_UIPropVO25:UIPropVO;
        public var _PopupLayer_UIPropVO26:UIPropVO;
        public var _PopupLayer_UIPropVO27:UIPropVO;
        public var _PopupLayer_UIPropVO28:UIPropVO;
        public var _PopupLayer_UIPropVO29:UIPropVO;
        public var _PopupLayer_UIPropVO30:UIPropVO;
        public var _PopupLayer_UIPropVO31:UIPropVO;
        public var _PopupLayer_UIPropVO32:UIPropVO;
        public var _PopupLayer_UIPropVO33:UIPropVO;
        public var _PopupLayer_UIPropVO35:UIPropVO;
        public var _PopupLayer_UIPropVO34:UIPropVO;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({"type":UIBase});
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PopupLayer()
        {
            mx_internal::_document = this;
            _PopupLayer_Array1_i();
            this.addEventListener("initialize", ___PopupLayer_UIBase1_initialize);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PopupLayer._watcherSetupUtil = _arg_1;
        }


        private function _PopupLayer_UIPropVO4_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PopupLayer_UIPropVO4 = _local_1;
            _local_1.name = "星宫推图副本";
            BindingManager.executeBindings(this, "_PopupLayer_UIPropVO4", _PopupLayer_UIPropVO4);
            return (_local_1);
        }

        private function _PopupLayer_UIPropVO8_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PopupLayer_UIPropVO8 = _local_1;
            _local_1.name = "线选择栏";
            _local_1.style = {
                "horizontalCenter":0,
                "verticalCenter":0
            };
            BindingManager.executeBindings(this, "_PopupLayer_UIPropVO8", _PopupLayer_UIPropVO8);
            return (_local_1);
        }

        private function _PopupLayer_UIPropVO21_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PopupLayer_UIPropVO21 = _local_1;
            _local_1.name = "新手指引气泡";
            BindingManager.executeBindings(this, "_PopupLayer_UIPropVO21", _PopupLayer_UIPropVO21);
            return (_local_1);
        }

        private function _PopupLayer_Array1_i():Array
        {
            var _local_1:Array;
            _local_1 = [_PopupLayer_UIPropVO1_i(), _PopupLayer_UIPropVO2_i(), _PopupLayer_UIPropVO3_i(), _PopupLayer_UIPropVO4_i(), _PopupLayer_UIPropVO5_i(), _PopupLayer_UIPropVO6_i(), _PopupLayer_UIPropVO7_i(), _PopupLayer_UIPropVO8_i(), _PopupLayer_UIPropVO9_i(), _PopupLayer_UIPropVO10_i(), _PopupLayer_UIPropVO11_i(), _PopupLayer_UIPropVO12_i(), _PopupLayer_UIPropVO13_i(), _PopupLayer_UIPropVO14_i(), _PopupLayer_UIPropVO15_i(), _PopupLayer_UIPropVO16_i(), _PopupLayer_UIPropVO17_i(), _PopupLayer_UIPropVO18_i(), _PopupLayer_UIPropVO19_i(), _PopupLayer_UIPropVO20_i(), _PopupLayer_UIPropVO21_i(), _PopupLayer_UIPropVO22_i(), _PopupLayer_UIPropVO23_i(), _PopupLayer_UIPropVO24_i(), _PopupLayer_UIPropVO25_i(), _PopupLayer_UIPropVO26_i(), _PopupLayer_UIPropVO27_i(), _PopupLayer_UIPropVO28_i(), _PopupLayer_UIPropVO29_i(), _PopupLayer_UIPropVO30_i(), _PopupLayer_UIPropVO31_i(), _PopupLayer_UIPropVO32_i(), _PopupLayer_UIPropVO33_i(), _PopupLayer_UIPropVO34_i(), _PopupLayer_UIPropVO35_i()];
            uiList = _local_1;
            return (_local_1);
        }

        private function _PopupLayer_UIPropVO25_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PopupLayer_UIPropVO25 = _local_1;
            _local_1.name = "宠物大PK配置详情";
            BindingManager.executeBindings(this, "_PopupLayer_UIPropVO25", _PopupLayer_UIPropVO25);
            return (_local_1);
        }

        private function _PopupLayer_UIPropVO29_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PopupLayer_UIPropVO29 = _local_1;
            _local_1.name = "更改招募";
            BindingManager.executeBindings(this, "_PopupLayer_UIPropVO29", _PopupLayer_UIPropVO29);
            return (_local_1);
        }

        private function _PopupLayer_UIPropVO32_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PopupLayer_UIPropVO32 = _local_1;
            _local_1.name = "猜数字面板";
            _local_1.style = {
                "horizontalCenter":0,
                "verticalCenter":0
            };
            BindingManager.executeBindings(this, "_PopupLayer_UIPropVO32", _PopupLayer_UIPropVO32);
            return (_local_1);
        }

        private function _PopupLayer_UIPropVO13_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PopupLayer_UIPropVO13 = _local_1;
            _local_1.name = "消费引导框";
            BindingManager.executeBindings(this, "_PopupLayer_UIPropVO13", _PopupLayer_UIPropVO13);
            return (_local_1);
        }

        private function _PopupLayer_UIPropVO17_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PopupLayer_UIPropVO17 = _local_1;
            _local_1.name = "聊天设置";
            _local_1.prop = {
                "dx":250,
                "dy":120
            };
            BindingManager.executeBindings(this, "_PopupLayer_UIPropVO17", _PopupLayer_UIPropVO17);
            return (_local_1);
        }

        private function _PopupLayer_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = NumPanel;
            _local_1 = ViewManager.PANEL_NUM;
            _local_1 = false;
            _local_1 = InputPanel;
            _local_1 = ViewManager.PANEL_INPUT;
            _local_1 = false;
            _local_1 = SystemMsgCanvas;
            _local_1 = ViewManager.POPU_SYS_MSG;
            _local_1 = false;
            _local_1 = StarInstanceMap;
            _local_1 = ViewManager.POPU_STAR_INSTACE_MAP;
            _local_1 = false;
            _local_1 = PetSoulProductPanel;
            _local_1 = ViewManager.POPU_SOUL_PRODUCT;
            _local_1 = false;
            _local_1 = SoulExchangePanel;
            _local_1 = ViewManager.PANEL_SOUL_EXCHANGE;
            _local_1 = false;
            _local_1 = NoticeMsgCanvas;
            _local_1 = ViewManager.POPU_SYS_NOTE;
            _local_1 = false;
            _local_1 = LineSelectCanvas;
            _local_1 = ViewManager.MAIN_LINE;
            _local_1 = false;
            _local_1 = WorldMap;
            _local_1 = ViewManager.POPU_WORLDMAP;
            _local_1 = false;
            _local_1 = UIHelp;
            _local_1 = ViewManager.POPU_UIHELP;
            _local_1 = false;
            _local_1 = WaitingPanel;
            _local_1 = ViewManager.POPU_WAIT;
            _local_1 = false;
            _local_1 = GuidePopPanel;
            _local_1 = ViewManager.POP_GUIDE;
            _local_1 = false;
            _local_1 = ConsumPanel;
            _local_1 = ViewManager.MAIN_CONSUMP;
            _local_1 = false;
            _local_1 = MoneyItemPanel;
            _local_1 = ViewManager.POPU_MONEYITEM;
            _local_1 = false;
            _local_1 = DPassPanel;
            _local_1 = ViewManager.D_PASS_PANEL;
            _local_1 = false;
            _local_1 = NetEnvSelectCanvas;
            _local_1 = ViewManager.POPU_NET_SELECT;
            _local_1 = false;
            _local_1 = ChatConfigPanel;
            _local_1 = ViewManager.PANEL_CHATCONFIG;
            _local_1 = false;
            _local_1 = MarriageSeekingPanel;
            _local_1 = ViewManager.POP_MARRIAGE_SEEKING;
            _local_1 = false;
            _local_1 = GuideAlertPanel;
            _local_1 = ViewManager.POP_NEW_PLAER_ALERT;
            _local_1 = false;
            _local_1 = LocalAlertPanel;
            _local_1 = ViewManager.POP_LOCAL_ALERT;
            _local_1 = false;
            _local_1 = true;
            _local_1 = GuidePanel;
            _local_1 = ViewManager.POP_NEW_PLAER_GUIDE;
            _local_1 = false;
            _local_1 = SendQxWishPanel;
            _local_1 = ViewManager.POP_SEND_LOVE;
            _local_1 = false;
            _local_1 = SendVDAYWishPanel;
            _local_1 = ViewManager.POP_SEND_VDAY;
            _local_1 = false;
            _local_1 = AIConfPanel;
            _local_1 = ViewManager.POP_AI_CONFIGURE;
            _local_1 = false;
            _local_1 = AIConfPetArenaActPanel;
            _local_1 = ViewManager.POP_AI_CONFIGURE_ACTIVITY;
            _local_1 = false;
            _local_1 = FazendaShop;
            _local_1 = ViewManager.PANEL_FAZENDA_SHOP;
            _local_1 = false;
            _local_1 = true;
            _local_1 = FazendaBag;
            _local_1 = ViewManager.PANEL_FAZENDA_BAG;
            _local_1 = false;
            _local_1 = true;
            _local_1 = FazendaLogPanel;
            _local_1 = ViewManager.POP_FAZENDA_LOG;
            _local_1 = false;
            _local_1 = true;
            _local_1 = GroupRecruitUpdatePanel;
            _local_1 = ViewManager.PANEL_GROUP_RECRUIT_UPDATE;
            _local_1 = false;
            _local_1 = StarBattleReport;
            _local_1 = ViewManager.POP_STAR_BATTLE_REPORT;
            _local_1 = TitleCustomPanel;
            _local_1 = ViewManager.PANEL_TITLE_CUSTOM;
            _local_1 = false;
            _local_1 = GuessNumberPanel;
            _local_1 = ViewManager.PANEL_GUESS_NUMBER;
            _local_1 = false;
            _local_1 = PetPVEAIConfPanel;
            _local_1 = ViewManager.POP_PET_PVE_AI_CONFIGURE;
            _local_1 = false;
            _local_1 = MCZDPetAIConfPanel;
            _local_1 = ViewManager.POP_MCZD_PET_PVE_AI_CONFIGURE;
            _local_1 = false;
            _local_1 = MCZDBattleReport;
            _local_1 = ViewManager.POP_MCZD_BATTLE_REPORT;
        }

        private function _PopupLayer_UIPropVO20_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PopupLayer_UIPropVO20 = _local_1;
            _local_1.name = "本地存储引导";
            _local_1.prop = {
                "dx":250,
                "dy":90
            };
            BindingManager.executeBindings(this, "_PopupLayer_UIPropVO20", _PopupLayer_UIPropVO20);
            return (_local_1);
        }

        private function _PopupLayer_UIPropVO24_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PopupLayer_UIPropVO24 = _local_1;
            _local_1.name = "宠物战斗配置详情";
            BindingManager.executeBindings(this, "_PopupLayer_UIPropVO24", _PopupLayer_UIPropVO24);
            return (_local_1);
        }

        private function _PopupLayer_UIPropVO3_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PopupLayer_UIPropVO3 = _local_1;
            _local_1.name = "系统信息";
            _local_1.style = {
                "horizontalCenter":0,
                "top":100
            };
            BindingManager.executeBindings(this, "_PopupLayer_UIPropVO3", _PopupLayer_UIPropVO3);
            return (_local_1);
        }

        private function _PopupLayer_UIPropVO28_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PopupLayer_UIPropVO28 = _local_1;
            _local_1.name = "庄园事件面板";
            _local_1.prop = {
                "dx":300,
                "dy":100
            };
            BindingManager.executeBindings(this, "_PopupLayer_UIPropVO28", _PopupLayer_UIPropVO28);
            return (_local_1);
        }

        private function _PopupLayer_UIPropVO7_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PopupLayer_UIPropVO7 = _local_1;
            _local_1.name = "系统提示";
            _local_1.style = {
                "horizontalCenter":0,
                "top":100
            };
            BindingManager.executeBindings(this, "_PopupLayer_UIPropVO7", _PopupLayer_UIPropVO7);
            return (_local_1);
        }

        private function _PopupLayer_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Class
            {
                return (NumPanel);
            }, function (_arg_1:Class):void
            {
                _PopupLayer_UIPropVO1.cls = _arg_1;
            }, "_PopupLayer_UIPropVO1.cls");
            result[0] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_NUM);
            }, function (_arg_1:int):void
            {
                _PopupLayer_UIPropVO1.vid = _arg_1;
            }, "_PopupLayer_UIPropVO1.vid");
            result[1] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO1.initVisible = _arg_1;
            }, "_PopupLayer_UIPropVO1.initVisible");
            result[2] = binding;
            binding = new Binding(this, function ():Class
            {
                return (InputPanel);
            }, function (_arg_1:Class):void
            {
                _PopupLayer_UIPropVO2.cls = _arg_1;
            }, "_PopupLayer_UIPropVO2.cls");
            result[3] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_INPUT);
            }, function (_arg_1:int):void
            {
                _PopupLayer_UIPropVO2.vid = _arg_1;
            }, "_PopupLayer_UIPropVO2.vid");
            result[4] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO2.initVisible = _arg_1;
            }, "_PopupLayer_UIPropVO2.initVisible");
            result[5] = binding;
            binding = new Binding(this, function ():Class
            {
                return (SystemMsgCanvas);
            }, function (_arg_1:Class):void
            {
                _PopupLayer_UIPropVO3.cls = _arg_1;
            }, "_PopupLayer_UIPropVO3.cls");
            result[6] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.POPU_SYS_MSG);
            }, function (_arg_1:int):void
            {
                _PopupLayer_UIPropVO3.vid = _arg_1;
            }, "_PopupLayer_UIPropVO3.vid");
            result[7] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO3.initVisible = _arg_1;
            }, "_PopupLayer_UIPropVO3.initVisible");
            result[8] = binding;
            binding = new Binding(this, function ():Class
            {
                return (StarInstanceMap);
            }, function (_arg_1:Class):void
            {
                _PopupLayer_UIPropVO4.cls = _arg_1;
            }, "_PopupLayer_UIPropVO4.cls");
            result[9] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.POPU_STAR_INSTACE_MAP);
            }, function (_arg_1:int):void
            {
                _PopupLayer_UIPropVO4.vid = _arg_1;
            }, "_PopupLayer_UIPropVO4.vid");
            result[10] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO4.initVisible = _arg_1;
            }, "_PopupLayer_UIPropVO4.initVisible");
            result[11] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PetSoulProductPanel);
            }, function (_arg_1:Class):void
            {
                _PopupLayer_UIPropVO5.cls = _arg_1;
            }, "_PopupLayer_UIPropVO5.cls");
            result[12] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.POPU_SOUL_PRODUCT);
            }, function (_arg_1:int):void
            {
                _PopupLayer_UIPropVO5.vid = _arg_1;
            }, "_PopupLayer_UIPropVO5.vid");
            result[13] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO5.initVisible = _arg_1;
            }, "_PopupLayer_UIPropVO5.initVisible");
            result[14] = binding;
            binding = new Binding(this, function ():Class
            {
                return (SoulExchangePanel);
            }, function (_arg_1:Class):void
            {
                _PopupLayer_UIPropVO6.cls = _arg_1;
            }, "_PopupLayer_UIPropVO6.cls");
            result[15] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_SOUL_EXCHANGE);
            }, function (_arg_1:int):void
            {
                _PopupLayer_UIPropVO6.vid = _arg_1;
            }, "_PopupLayer_UIPropVO6.vid");
            result[16] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO6.initVisible = _arg_1;
            }, "_PopupLayer_UIPropVO6.initVisible");
            result[17] = binding;
            binding = new Binding(this, function ():Class
            {
                return (NoticeMsgCanvas);
            }, function (_arg_1:Class):void
            {
                _PopupLayer_UIPropVO7.cls = _arg_1;
            }, "_PopupLayer_UIPropVO7.cls");
            result[18] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.POPU_SYS_NOTE);
            }, function (_arg_1:int):void
            {
                _PopupLayer_UIPropVO7.vid = _arg_1;
            }, "_PopupLayer_UIPropVO7.vid");
            result[19] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO7.initVisible = _arg_1;
            }, "_PopupLayer_UIPropVO7.initVisible");
            result[20] = binding;
            binding = new Binding(this, function ():Class
            {
                return (LineSelectCanvas);
            }, function (_arg_1:Class):void
            {
                _PopupLayer_UIPropVO8.cls = _arg_1;
            }, "_PopupLayer_UIPropVO8.cls");
            result[21] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.MAIN_LINE);
            }, function (_arg_1:int):void
            {
                _PopupLayer_UIPropVO8.vid = _arg_1;
            }, "_PopupLayer_UIPropVO8.vid");
            result[22] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO8.initVisible = _arg_1;
            }, "_PopupLayer_UIPropVO8.initVisible");
            result[23] = binding;
            binding = new Binding(this, function ():Class
            {
                return (WorldMap);
            }, function (_arg_1:Class):void
            {
                _PopupLayer_UIPropVO9.cls = _arg_1;
            }, "_PopupLayer_UIPropVO9.cls");
            result[24] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.POPU_WORLDMAP);
            }, function (_arg_1:int):void
            {
                _PopupLayer_UIPropVO9.vid = _arg_1;
            }, "_PopupLayer_UIPropVO9.vid");
            result[25] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO9.initVisible = _arg_1;
            }, "_PopupLayer_UIPropVO9.initVisible");
            result[26] = binding;
            binding = new Binding(this, function ():Class
            {
                return (UIHelp);
            }, function (_arg_1:Class):void
            {
                _PopupLayer_UIPropVO10.cls = _arg_1;
            }, "_PopupLayer_UIPropVO10.cls");
            result[27] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.POPU_UIHELP);
            }, function (_arg_1:int):void
            {
                _PopupLayer_UIPropVO10.vid = _arg_1;
            }, "_PopupLayer_UIPropVO10.vid");
            result[28] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO10.initVisible = _arg_1;
            }, "_PopupLayer_UIPropVO10.initVisible");
            result[29] = binding;
            binding = new Binding(this, function ():Class
            {
                return (WaitingPanel);
            }, function (_arg_1:Class):void
            {
                _PopupLayer_UIPropVO11.cls = _arg_1;
            }, "_PopupLayer_UIPropVO11.cls");
            result[30] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.POPU_WAIT);
            }, function (_arg_1:int):void
            {
                _PopupLayer_UIPropVO11.vid = _arg_1;
            }, "_PopupLayer_UIPropVO11.vid");
            result[31] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO11.initVisible = _arg_1;
            }, "_PopupLayer_UIPropVO11.initVisible");
            result[32] = binding;
            binding = new Binding(this, function ():Class
            {
                return (GuidePopPanel);
            }, function (_arg_1:Class):void
            {
                _PopupLayer_UIPropVO12.cls = _arg_1;
            }, "_PopupLayer_UIPropVO12.cls");
            result[33] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.POP_GUIDE);
            }, function (_arg_1:int):void
            {
                _PopupLayer_UIPropVO12.vid = _arg_1;
            }, "_PopupLayer_UIPropVO12.vid");
            result[34] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO12.initVisible = _arg_1;
            }, "_PopupLayer_UIPropVO12.initVisible");
            result[35] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ConsumPanel);
            }, function (_arg_1:Class):void
            {
                _PopupLayer_UIPropVO13.cls = _arg_1;
            }, "_PopupLayer_UIPropVO13.cls");
            result[36] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.MAIN_CONSUMP);
            }, function (_arg_1:int):void
            {
                _PopupLayer_UIPropVO13.vid = _arg_1;
            }, "_PopupLayer_UIPropVO13.vid");
            result[37] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO13.initVisible = _arg_1;
            }, "_PopupLayer_UIPropVO13.initVisible");
            result[38] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MoneyItemPanel);
            }, function (_arg_1:Class):void
            {
                _PopupLayer_UIPropVO14.cls = _arg_1;
            }, "_PopupLayer_UIPropVO14.cls");
            result[39] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.POPU_MONEYITEM);
            }, function (_arg_1:int):void
            {
                _PopupLayer_UIPropVO14.vid = _arg_1;
            }, "_PopupLayer_UIPropVO14.vid");
            result[40] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO14.initVisible = _arg_1;
            }, "_PopupLayer_UIPropVO14.initVisible");
            result[41] = binding;
            binding = new Binding(this, function ():Class
            {
                return (DPassPanel);
            }, function (_arg_1:Class):void
            {
                _PopupLayer_UIPropVO15.cls = _arg_1;
            }, "_PopupLayer_UIPropVO15.cls");
            result[42] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.D_PASS_PANEL);
            }, function (_arg_1:int):void
            {
                _PopupLayer_UIPropVO15.vid = _arg_1;
            }, "_PopupLayer_UIPropVO15.vid");
            result[43] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO15.initVisible = _arg_1;
            }, "_PopupLayer_UIPropVO15.initVisible");
            result[44] = binding;
            binding = new Binding(this, function ():Class
            {
                return (NetEnvSelectCanvas);
            }, function (_arg_1:Class):void
            {
                _PopupLayer_UIPropVO16.cls = _arg_1;
            }, "_PopupLayer_UIPropVO16.cls");
            result[45] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.POPU_NET_SELECT);
            }, function (_arg_1:int):void
            {
                _PopupLayer_UIPropVO16.vid = _arg_1;
            }, "_PopupLayer_UIPropVO16.vid");
            result[46] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO16.initVisible = _arg_1;
            }, "_PopupLayer_UIPropVO16.initVisible");
            result[47] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ChatConfigPanel);
            }, function (_arg_1:Class):void
            {
                _PopupLayer_UIPropVO17.cls = _arg_1;
            }, "_PopupLayer_UIPropVO17.cls");
            result[48] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_CHATCONFIG);
            }, function (_arg_1:int):void
            {
                _PopupLayer_UIPropVO17.vid = _arg_1;
            }, "_PopupLayer_UIPropVO17.vid");
            result[49] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO17.initVisible = _arg_1;
            }, "_PopupLayer_UIPropVO17.initVisible");
            result[50] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MarriageSeekingPanel);
            }, function (_arg_1:Class):void
            {
                _PopupLayer_UIPropVO18.cls = _arg_1;
            }, "_PopupLayer_UIPropVO18.cls");
            result[51] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.POP_MARRIAGE_SEEKING);
            }, function (_arg_1:int):void
            {
                _PopupLayer_UIPropVO18.vid = _arg_1;
            }, "_PopupLayer_UIPropVO18.vid");
            result[52] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO18.initVisible = _arg_1;
            }, "_PopupLayer_UIPropVO18.initVisible");
            result[53] = binding;
            binding = new Binding(this, function ():Class
            {
                return (GuideAlertPanel);
            }, function (_arg_1:Class):void
            {
                _PopupLayer_UIPropVO19.cls = _arg_1;
            }, "_PopupLayer_UIPropVO19.cls");
            result[54] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.POP_NEW_PLAER_ALERT);
            }, function (_arg_1:int):void
            {
                _PopupLayer_UIPropVO19.vid = _arg_1;
            }, "_PopupLayer_UIPropVO19.vid");
            result[55] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO19.initVisible = _arg_1;
            }, "_PopupLayer_UIPropVO19.initVisible");
            result[56] = binding;
            binding = new Binding(this, function ():Class
            {
                return (LocalAlertPanel);
            }, function (_arg_1:Class):void
            {
                _PopupLayer_UIPropVO20.cls = _arg_1;
            }, "_PopupLayer_UIPropVO20.cls");
            result[57] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.POP_LOCAL_ALERT);
            }, function (_arg_1:int):void
            {
                _PopupLayer_UIPropVO20.vid = _arg_1;
            }, "_PopupLayer_UIPropVO20.vid");
            result[58] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO20.initVisible = _arg_1;
            }, "_PopupLayer_UIPropVO20.initVisible");
            result[59] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO20.createLater = _arg_1;
            }, "_PopupLayer_UIPropVO20.createLater");
            result[60] = binding;
            binding = new Binding(this, function ():Class
            {
                return (GuidePanel);
            }, function (_arg_1:Class):void
            {
                _PopupLayer_UIPropVO21.cls = _arg_1;
            }, "_PopupLayer_UIPropVO21.cls");
            result[61] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.POP_NEW_PLAER_GUIDE);
            }, function (_arg_1:int):void
            {
                _PopupLayer_UIPropVO21.vid = _arg_1;
            }, "_PopupLayer_UIPropVO21.vid");
            result[62] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO21.initVisible = _arg_1;
            }, "_PopupLayer_UIPropVO21.initVisible");
            result[63] = binding;
            binding = new Binding(this, function ():Class
            {
                return (SendQxWishPanel);
            }, function (_arg_1:Class):void
            {
                _PopupLayer_UIPropVO22.cls = _arg_1;
            }, "_PopupLayer_UIPropVO22.cls");
            result[64] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.POP_SEND_LOVE);
            }, function (_arg_1:int):void
            {
                _PopupLayer_UIPropVO22.vid = _arg_1;
            }, "_PopupLayer_UIPropVO22.vid");
            result[65] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO22.initVisible = _arg_1;
            }, "_PopupLayer_UIPropVO22.initVisible");
            result[66] = binding;
            binding = new Binding(this, function ():Class
            {
                return (SendVDAYWishPanel);
            }, function (_arg_1:Class):void
            {
                _PopupLayer_UIPropVO23.cls = _arg_1;
            }, "_PopupLayer_UIPropVO23.cls");
            result[67] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.POP_SEND_VDAY);
            }, function (_arg_1:int):void
            {
                _PopupLayer_UIPropVO23.vid = _arg_1;
            }, "_PopupLayer_UIPropVO23.vid");
            result[68] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO23.initVisible = _arg_1;
            }, "_PopupLayer_UIPropVO23.initVisible");
            result[69] = binding;
            binding = new Binding(this, function ():Class
            {
                return (AIConfPanel);
            }, function (_arg_1:Class):void
            {
                _PopupLayer_UIPropVO24.cls = _arg_1;
            }, "_PopupLayer_UIPropVO24.cls");
            result[70] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.POP_AI_CONFIGURE);
            }, function (_arg_1:int):void
            {
                _PopupLayer_UIPropVO24.vid = _arg_1;
            }, "_PopupLayer_UIPropVO24.vid");
            result[71] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO24.initVisible = _arg_1;
            }, "_PopupLayer_UIPropVO24.initVisible");
            result[72] = binding;
            binding = new Binding(this, function ():Class
            {
                return (AIConfPetArenaActPanel);
            }, function (_arg_1:Class):void
            {
                _PopupLayer_UIPropVO25.cls = _arg_1;
            }, "_PopupLayer_UIPropVO25.cls");
            result[73] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.POP_AI_CONFIGURE_ACTIVITY);
            }, function (_arg_1:int):void
            {
                _PopupLayer_UIPropVO25.vid = _arg_1;
            }, "_PopupLayer_UIPropVO25.vid");
            result[74] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO25.initVisible = _arg_1;
            }, "_PopupLayer_UIPropVO25.initVisible");
            result[75] = binding;
            binding = new Binding(this, function ():Class
            {
                return (FazendaShop);
            }, function (_arg_1:Class):void
            {
                _PopupLayer_UIPropVO26.cls = _arg_1;
            }, "_PopupLayer_UIPropVO26.cls");
            result[76] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_FAZENDA_SHOP);
            }, function (_arg_1:int):void
            {
                _PopupLayer_UIPropVO26.vid = _arg_1;
            }, "_PopupLayer_UIPropVO26.vid");
            result[77] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO26.initVisible = _arg_1;
            }, "_PopupLayer_UIPropVO26.initVisible");
            result[78] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO26.createLater = _arg_1;
            }, "_PopupLayer_UIPropVO26.createLater");
            result[79] = binding;
            binding = new Binding(this, function ():Class
            {
                return (FazendaBag);
            }, function (_arg_1:Class):void
            {
                _PopupLayer_UIPropVO27.cls = _arg_1;
            }, "_PopupLayer_UIPropVO27.cls");
            result[80] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_FAZENDA_BAG);
            }, function (_arg_1:int):void
            {
                _PopupLayer_UIPropVO27.vid = _arg_1;
            }, "_PopupLayer_UIPropVO27.vid");
            result[81] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO27.initVisible = _arg_1;
            }, "_PopupLayer_UIPropVO27.initVisible");
            result[82] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO27.createLater = _arg_1;
            }, "_PopupLayer_UIPropVO27.createLater");
            result[83] = binding;
            binding = new Binding(this, function ():Class
            {
                return (FazendaLogPanel);
            }, function (_arg_1:Class):void
            {
                _PopupLayer_UIPropVO28.cls = _arg_1;
            }, "_PopupLayer_UIPropVO28.cls");
            result[84] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.POP_FAZENDA_LOG);
            }, function (_arg_1:int):void
            {
                _PopupLayer_UIPropVO28.vid = _arg_1;
            }, "_PopupLayer_UIPropVO28.vid");
            result[85] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO28.initVisible = _arg_1;
            }, "_PopupLayer_UIPropVO28.initVisible");
            result[86] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO28.createLater = _arg_1;
            }, "_PopupLayer_UIPropVO28.createLater");
            result[87] = binding;
            binding = new Binding(this, function ():Class
            {
                return (GroupRecruitUpdatePanel);
            }, function (_arg_1:Class):void
            {
                _PopupLayer_UIPropVO29.cls = _arg_1;
            }, "_PopupLayer_UIPropVO29.cls");
            result[88] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_GROUP_RECRUIT_UPDATE);
            }, function (_arg_1:int):void
            {
                _PopupLayer_UIPropVO29.vid = _arg_1;
            }, "_PopupLayer_UIPropVO29.vid");
            result[89] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO29.initVisible = _arg_1;
            }, "_PopupLayer_UIPropVO29.initVisible");
            result[90] = binding;
            binding = new Binding(this, function ():Class
            {
                return (StarBattleReport);
            }, function (_arg_1:Class):void
            {
                _PopupLayer_UIPropVO30.cls = _arg_1;
            }, "_PopupLayer_UIPropVO30.cls");
            result[91] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.POP_STAR_BATTLE_REPORT);
            }, function (_arg_1:int):void
            {
                _PopupLayer_UIPropVO30.vid = _arg_1;
            }, "_PopupLayer_UIPropVO30.vid");
            result[92] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TitleCustomPanel);
            }, function (_arg_1:Class):void
            {
                _PopupLayer_UIPropVO31.cls = _arg_1;
            }, "_PopupLayer_UIPropVO31.cls");
            result[93] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_TITLE_CUSTOM);
            }, function (_arg_1:int):void
            {
                _PopupLayer_UIPropVO31.vid = _arg_1;
            }, "_PopupLayer_UIPropVO31.vid");
            result[94] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO31.initVisible = _arg_1;
            }, "_PopupLayer_UIPropVO31.initVisible");
            result[95] = binding;
            binding = new Binding(this, function ():Class
            {
                return (GuessNumberPanel);
            }, function (_arg_1:Class):void
            {
                _PopupLayer_UIPropVO32.cls = _arg_1;
            }, "_PopupLayer_UIPropVO32.cls");
            result[96] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_GUESS_NUMBER);
            }, function (_arg_1:int):void
            {
                _PopupLayer_UIPropVO32.vid = _arg_1;
            }, "_PopupLayer_UIPropVO32.vid");
            result[97] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO32.initVisible = _arg_1;
            }, "_PopupLayer_UIPropVO32.initVisible");
            result[98] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PetPVEAIConfPanel);
            }, function (_arg_1:Class):void
            {
                _PopupLayer_UIPropVO33.cls = _arg_1;
            }, "_PopupLayer_UIPropVO33.cls");
            result[99] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.POP_PET_PVE_AI_CONFIGURE);
            }, function (_arg_1:int):void
            {
                _PopupLayer_UIPropVO33.vid = _arg_1;
            }, "_PopupLayer_UIPropVO33.vid");
            result[100] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO33.initVisible = _arg_1;
            }, "_PopupLayer_UIPropVO33.initVisible");
            result[101] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MCZDPetAIConfPanel);
            }, function (_arg_1:Class):void
            {
                _PopupLayer_UIPropVO34.cls = _arg_1;
            }, "_PopupLayer_UIPropVO34.cls");
            result[102] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.POP_MCZD_PET_PVE_AI_CONFIGURE);
            }, function (_arg_1:int):void
            {
                _PopupLayer_UIPropVO34.vid = _arg_1;
            }, "_PopupLayer_UIPropVO34.vid");
            result[103] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PopupLayer_UIPropVO34.initVisible = _arg_1;
            }, "_PopupLayer_UIPropVO34.initVisible");
            result[104] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MCZDBattleReport);
            }, function (_arg_1:Class):void
            {
                _PopupLayer_UIPropVO35.cls = _arg_1;
            }, "_PopupLayer_UIPropVO35.cls");
            result[105] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.POP_MCZD_BATTLE_REPORT);
            }, function (_arg_1:int):void
            {
                _PopupLayer_UIPropVO35.vid = _arg_1;
            }, "_PopupLayer_UIPropVO35.vid");
            result[106] = binding;
            return (result);
        }

        private function _PopupLayer_UIPropVO31_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PopupLayer_UIPropVO31 = _local_1;
            _local_1.name = "称号自定义面板";
            _local_1.prop = {
                "dx":330,
                "dy":100
            };
            BindingManager.executeBindings(this, "_PopupLayer_UIPropVO31", _PopupLayer_UIPropVO31);
            return (_local_1);
        }

        private function _PopupLayer_UIPropVO12_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PopupLayer_UIPropVO12 = _local_1;
            _local_1.name = "新手引导弹出";
            BindingManager.executeBindings(this, "_PopupLayer_UIPropVO12", _PopupLayer_UIPropVO12);
            return (_local_1);
        }

        private function _PopupLayer_UIPropVO35_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PopupLayer_UIPropVO35 = _local_1;
            _local_1.name = "萌宠智斗战报面板";
            _local_1.initVisible = false;
            _local_1.prop = {
                "dx":330,
                "dy":100
            };
            BindingManager.executeBindings(this, "_PopupLayer_UIPropVO35", _PopupLayer_UIPropVO35);
            return (_local_1);
        }

        private function _PopupLayer_UIPropVO16_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PopupLayer_UIPropVO16 = _local_1;
            _local_1.name = "网络环境设置";
            BindingManager.executeBindings(this, "_PopupLayer_UIPropVO16", _PopupLayer_UIPropVO16);
            return (_local_1);
        }

        private function _PopupLayer_UIPropVO6_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PopupLayer_UIPropVO6 = _local_1;
            _local_1.name = "宠物炼命兑换面板";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PopupLayer_UIPropVO6", _PopupLayer_UIPropVO6);
            return (_local_1);
        }

        private function _PopupLayer_UIPropVO23_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PopupLayer_UIPropVO23 = _local_1;
            _local_1.name = "情人节告白";
            _local_1.prop = {
                "dx":320,
                "dy":240
            };
            BindingManager.executeBindings(this, "_PopupLayer_UIPropVO23", _PopupLayer_UIPropVO23);
            return (_local_1);
        }

        public function ___PopupLayer_UIBase1_initialize(_arg_1:FlexEvent):void
        {
            addView();
        }

        override public function initialize():void
        {
            var target:PopupLayer;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PopupLayer_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_PopupLayerWatcherSetupUtil");
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

        private function _PopupLayer_UIPropVO2_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PopupLayer_UIPropVO2 = _local_1;
            _local_1.name = "输入面板";
            BindingManager.executeBindings(this, "_PopupLayer_UIPropVO2", _PopupLayer_UIPropVO2);
            return (_local_1);
        }

        private function _PopupLayer_UIPropVO27_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PopupLayer_UIPropVO27 = _local_1;
            _local_1.name = "庄园背包面板";
            _local_1.prop = {
                "dx":300,
                "dy":100
            };
            BindingManager.executeBindings(this, "_PopupLayer_UIPropVO27", _PopupLayer_UIPropVO27);
            return (_local_1);
        }

        private function _PopupLayer_UIPropVO11_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PopupLayer_UIPropVO11 = _local_1;
            _local_1.name = "提示界面";
            BindingManager.executeBindings(this, "_PopupLayer_UIPropVO11", _PopupLayer_UIPropVO11);
            return (_local_1);
        }

        private function _PopupLayer_UIPropVO34_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PopupLayer_UIPropVO34 = _local_1;
            _local_1.name = "萌宠智斗ai配置面板";
            _local_1.style = {
                "horizontalCenter":0,
                "verticalCenter":0
            };
            BindingManager.executeBindings(this, "_PopupLayer_UIPropVO34", _PopupLayer_UIPropVO34);
            return (_local_1);
        }

        private function _PopupLayer_UIPropVO15_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PopupLayer_UIPropVO15 = _local_1;
            _local_1.name = "二级密码面板";
            BindingManager.executeBindings(this, "_PopupLayer_UIPropVO15", _PopupLayer_UIPropVO15);
            return (_local_1);
        }

        private function _PopupLayer_UIPropVO19_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PopupLayer_UIPropVO19 = _local_1;
            _local_1.name = "新手指引弹窗";
            _local_1.prop = {
                "dx":250,
                "dy":90
            };
            BindingManager.executeBindings(this, "_PopupLayer_UIPropVO19", _PopupLayer_UIPropVO19);
            return (_local_1);
        }

        private function _PopupLayer_UIPropVO30_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PopupLayer_UIPropVO30 = _local_1;
            _local_1.name = "战报面板";
            _local_1.initVisible = false;
            _local_1.prop = {
                "dx":330,
                "dy":100
            };
            BindingManager.executeBindings(this, "_PopupLayer_UIPropVO30", _PopupLayer_UIPropVO30);
            return (_local_1);
        }

        private function _PopupLayer_UIPropVO5_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PopupLayer_UIPropVO5 = _local_1;
            _local_1.name = "炼命面板";
            BindingManager.executeBindings(this, "_PopupLayer_UIPropVO5", _PopupLayer_UIPropVO5);
            return (_local_1);
        }

        private function _PopupLayer_UIPropVO22_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PopupLayer_UIPropVO22 = _local_1;
            _local_1.name = "告白/许愿";
            _local_1.prop = {
                "dx":320,
                "dy":240
            };
            BindingManager.executeBindings(this, "_PopupLayer_UIPropVO22", _PopupLayer_UIPropVO22);
            return (_local_1);
        }

        private function _PopupLayer_UIPropVO1_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PopupLayer_UIPropVO1 = _local_1;
            _local_1.name = "购买面板";
            BindingManager.executeBindings(this, "_PopupLayer_UIPropVO1", _PopupLayer_UIPropVO1);
            return (_local_1);
        }

        private function _PopupLayer_UIPropVO26_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PopupLayer_UIPropVO26 = _local_1;
            _local_1.name = "庄园商店面板";
            _local_1.prop = {
                "dx":300,
                "dy":100
            };
            BindingManager.executeBindings(this, "_PopupLayer_UIPropVO26", _PopupLayer_UIPropVO26);
            return (_local_1);
        }

        private function _PopupLayer_UIPropVO9_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PopupLayer_UIPropVO9 = _local_1;
            _local_1.name = "世界地图";
            BindingManager.executeBindings(this, "_PopupLayer_UIPropVO9", _PopupLayer_UIPropVO9);
            return (_local_1);
        }

        private function addView():void
        {
            var _local_1:Core = Core.getInstance();
            _local_1.view.addUI(ViewManager.MENU_POPUP, CustomMenu.createMenu(this, null));
        }

        private function _PopupLayer_UIPropVO10_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PopupLayer_UIPropVO10 = _local_1;
            _local_1.name = "界面帮助";
            BindingManager.executeBindings(this, "_PopupLayer_UIPropVO10", _PopupLayer_UIPropVO10);
            return (_local_1);
        }

        private function _PopupLayer_UIPropVO33_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PopupLayer_UIPropVO33 = _local_1;
            _local_1.name = "雕刻空间ai配置面板";
            _local_1.style = {
                "horizontalCenter":0,
                "verticalCenter":0
            };
            BindingManager.executeBindings(this, "_PopupLayer_UIPropVO33", _PopupLayer_UIPropVO33);
            return (_local_1);
        }

        private function _PopupLayer_UIPropVO14_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PopupLayer_UIPropVO14 = _local_1;
            _local_1.name = "消费引导框2";
            BindingManager.executeBindings(this, "_PopupLayer_UIPropVO14", _PopupLayer_UIPropVO14);
            return (_local_1);
        }

        private function _PopupLayer_UIPropVO18_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PopupLayer_UIPropVO18 = _local_1;
            _local_1.name = "发布征婚/求婚信息";
            _local_1.prop = {
                "dx":250,
                "dy":120
            };
            BindingManager.executeBindings(this, "_PopupLayer_UIPropVO18", _PopupLayer_UIPropVO18);
            return (_local_1);
        }


    }
}//package com.qeedoo.ui.view

