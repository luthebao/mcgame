// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.TooltipLayer

package com.qeedoo.ui.view
{
    import com.qeedoo.ui.view.comp.UIBase;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.game.vo.UIPropVO;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.binding.BindingManager;
    import com.qeedoo.ui.view.comp.TipSkill;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.view.comp.TipQuest;
    import com.qeedoo.ui.view.comp.TipCre;
    import com.qeedoo.ui.view.comp.TipEquip;
    import com.qeedoo.ui.view.comp.TipWing;
    import com.qeedoo.ui.view.comp.TipSoul;
    import com.qeedoo.ui.view.comp.TipSoulAll;
    import com.qeedoo.ui.view.comp.TipBattle;
    import com.qeedoo.ui.view.comp.TipMap;
    import com.qeedoo.ui.view.comp.TipItem;
    import com.qeedoo.ui.view.comp.TipReqSkill;
    import com.qeedoo.ui.view.comp.TipDevSkill;
    import com.qeedoo.ui.view.comp.TipBuilding;
    import com.qeedoo.ui.view.comp.TipNpc;
    import com.qeedoo.ui.view.comp.TipAchieve;
    import com.qeedoo.ui.view.comp.TipStarReq;
    import com.qeedoo.ui.view.comp.TipEvent;
    import com.qeedoo.ui.view.comp.TipTitle;
    import com.qeedoo.ui.view.comp.TipMount;
    import com.qeedoo.ui.view.comp.TipMedal;
    import com.qeedoo.ui.view.comp.TipTalent;
    import com.qeedoo.ui.view.comp.TipRecipe;
    import com.qeedoo.ui.view.comp.TipDecoShow;
    import com.qeedoo.ui.view.comp.TipDecoRune;
    import com.qeedoo.ui.view.comp.TipRuneChip;
    import com.qeedoo.ui.view.comp.TipMysTreasure;
    import com.qeedoo.ui.view.comp.TipPRSChip;
    import com.qeedoo.ui.view.comp.TipMonsterHeart;
    import com.qeedoo.ui.view.comp.TipPetStone;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
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
    import flash.ui.*;
    import flash.filters.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    use namespace mx_internal;

    public class TooltipLayer extends UIBase implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _TooltipLayer_UIPropVO1:UIPropVO;
        public var _TooltipLayer_UIPropVO2:UIPropVO;
        public var _TooltipLayer_UIPropVO3:UIPropVO;
        public var _TooltipLayer_UIPropVO4:UIPropVO;
        public var _TooltipLayer_UIPropVO6:UIPropVO;
        public var _TooltipLayer_UIPropVO7:UIPropVO;
        public var _TooltipLayer_UIPropVO8:UIPropVO;
        public var _TooltipLayer_UIPropVO9:UIPropVO;
        public var _TooltipLayer_UIPropVO5:UIPropVO;
        public var _TooltipLayer_UIPropVO10:UIPropVO;
        public var _TooltipLayer_UIPropVO11:UIPropVO;
        public var _TooltipLayer_UIPropVO12:UIPropVO;
        public var _TooltipLayer_UIPropVO13:UIPropVO;
        public var _TooltipLayer_UIPropVO14:UIPropVO;
        public var _TooltipLayer_UIPropVO15:UIPropVO;
        public var _TooltipLayer_UIPropVO16:UIPropVO;
        public var _TooltipLayer_UIPropVO17:UIPropVO;
        public var _TooltipLayer_UIPropVO18:UIPropVO;
        public var _TooltipLayer_UIPropVO19:UIPropVO;
        public var _TooltipLayer_UIPropVO20:UIPropVO;
        public var _TooltipLayer_UIPropVO21:UIPropVO;
        public var _TooltipLayer_UIPropVO22:UIPropVO;
        public var _TooltipLayer_UIPropVO23:UIPropVO;
        public var _TooltipLayer_UIPropVO24:UIPropVO;
        public var _TooltipLayer_UIPropVO25:UIPropVO;
        public var _TooltipLayer_UIPropVO26:UIPropVO;
        public var _TooltipLayer_UIPropVO27:UIPropVO;
        public var _TooltipLayer_UIPropVO28:UIPropVO;
        public var _TooltipLayer_UIPropVO29:UIPropVO;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({"type":UIBase});
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TooltipLayer()
        {
            mx_internal::_document = this;
            _TooltipLayer_Array1_i();
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TooltipLayer._watcherSetupUtil = _arg_1;
        }


        private function _TooltipLayer_UIPropVO11_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _TooltipLayer_UIPropVO11 = _local_1;
            _local_1.name = "技能升级提示";
            BindingManager.executeBindings(this, "_TooltipLayer_UIPropVO11", _TooltipLayer_UIPropVO11);
            return (_local_1);
        }

        private function _TooltipLayer_UIPropVO15_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _TooltipLayer_UIPropVO15 = _local_1;
            _local_1.name = "成就提示";
            BindingManager.executeBindings(this, "_TooltipLayer_UIPropVO15", _TooltipLayer_UIPropVO15);
            return (_local_1);
        }

        private function _TooltipLayer_UIPropVO19_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _TooltipLayer_UIPropVO19 = _local_1;
            _local_1.name = "坐骑样式提示";
            BindingManager.executeBindings(this, "_TooltipLayer_UIPropVO19", _TooltipLayer_UIPropVO19);
            return (_local_1);
        }

        private function _TooltipLayer_UIPropVO3_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _TooltipLayer_UIPropVO3 = _local_1;
            _local_1.name = "宠物提示";
            BindingManager.executeBindings(this, "_TooltipLayer_UIPropVO3", _TooltipLayer_UIPropVO3);
            return (_local_1);
        }

        private function _TooltipLayer_UIPropVO7_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _TooltipLayer_UIPropVO7 = _local_1;
            _local_1.name = "命魂总览";
            BindingManager.executeBindings(this, "_TooltipLayer_UIPropVO7", _TooltipLayer_UIPropVO7);
            return (_local_1);
        }

        private function _TooltipLayer_UIPropVO22_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _TooltipLayer_UIPropVO22 = _local_1;
            _local_1.name = "装扮图鉴提示";
            BindingManager.executeBindings(this, "_TooltipLayer_UIPropVO22", _TooltipLayer_UIPropVO22);
            return (_local_1);
        }

        private function _TooltipLayer_UIPropVO26_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _TooltipLayer_UIPropVO26 = _local_1;
            _local_1.name = "符文碎片提示";
            BindingManager.executeBindings(this, "_TooltipLayer_UIPropVO26", _TooltipLayer_UIPropVO26);
            return (_local_1);
        }

        private function _TooltipLayer_UIPropVO10_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _TooltipLayer_UIPropVO10 = _local_1;
            _local_1.name = "物品提示";
            BindingManager.executeBindings(this, "_TooltipLayer_UIPropVO10", _TooltipLayer_UIPropVO10);
            return (_local_1);
        }

        private function _TooltipLayer_UIPropVO14_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _TooltipLayer_UIPropVO14 = _local_1;
            _local_1.name = "NPC提示";
            BindingManager.executeBindings(this, "_TooltipLayer_UIPropVO14", _TooltipLayer_UIPropVO14);
            return (_local_1);
        }

        private function _TooltipLayer_UIPropVO18_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _TooltipLayer_UIPropVO18 = _local_1;
            _local_1.name = "称号提示";
            BindingManager.executeBindings(this, "_TooltipLayer_UIPropVO18", _TooltipLayer_UIPropVO18);
            return (_local_1);
        }

        private function _TooltipLayer_UIPropVO2_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _TooltipLayer_UIPropVO2 = _local_1;
            _local_1.name = "任务提示";
            BindingManager.executeBindings(this, "_TooltipLayer_UIPropVO2", _TooltipLayer_UIPropVO2);
            return (_local_1);
        }

        private function _TooltipLayer_UIPropVO6_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _TooltipLayer_UIPropVO6 = _local_1;
            _local_1.name = "炼命提示";
            BindingManager.executeBindings(this, "_TooltipLayer_UIPropVO6", _TooltipLayer_UIPropVO6);
            return (_local_1);
        }

        private function _TooltipLayer_UIPropVO21_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _TooltipLayer_UIPropVO21 = _local_1;
            _local_1.name = "天赋样式";
            BindingManager.executeBindings(this, "_TooltipLayer_UIPropVO21", _TooltipLayer_UIPropVO21);
            return (_local_1);
        }

        private function _TooltipLayer_UIPropVO29_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _TooltipLayer_UIPropVO29 = _local_1;
            _local_1.name = "宠装宝石提示";
            BindingManager.executeBindings(this, "_TooltipLayer_UIPropVO29", _TooltipLayer_UIPropVO29);
            return (_local_1);
        }

        private function _TooltipLayer_UIPropVO25_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _TooltipLayer_UIPropVO25 = _local_1;
            _local_1.name = "符文碎片提示";
            BindingManager.executeBindings(this, "_TooltipLayer_UIPropVO25", _TooltipLayer_UIPropVO25);
            return (_local_1);
        }

        private function _TooltipLayer_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = TipSkill;
            _local_1 = ViewManager.TOOLTIP_SKILL;
            _local_1 = false;
            _local_1 = TipQuest;
            _local_1 = ViewManager.TOOLTIP_QUEST;
            _local_1 = false;
            _local_1 = TipCre;
            _local_1 = ViewManager.TOOLTIP_PET;
            _local_1 = false;
            _local_1 = TipEquip;
            _local_1 = ViewManager.TOOLTIP_EQUIP;
            _local_1 = false;
            _local_1 = TipWing;
            _local_1 = ViewManager.TOOLTIP_WING;
            _local_1 = false;
            _local_1 = TipSoul;
            _local_1 = ViewManager.TOOLTIP_PET_SOUL;
            _local_1 = false;
            _local_1 = TipSoulAll;
            _local_1 = ViewManager.TOOLTIP_ALL_SOUL;
            _local_1 = false;
            _local_1 = TipBattle;
            _local_1 = ViewManager.TOOLTIP_BATTLE;
            _local_1 = false;
            _local_1 = TipMap;
            _local_1 = ViewManager.TOOLTIP_MAP;
            _local_1 = false;
            _local_1 = TipItem;
            _local_1 = ViewManager.TOOLTIP_ITEM;
            _local_1 = false;
            _local_1 = true;
            _local_1 = TipReqSkill;
            _local_1 = ViewManager.TOOLTIP_REQSKILL;
            _local_1 = false;
            _local_1 = TipDevSkill;
            _local_1 = ViewManager.TOOLTIP_DEVSKILL;
            _local_1 = false;
            _local_1 = TipBuilding;
            _local_1 = ViewManager.TOOLTIP_BUILDING;
            _local_1 = false;
            _local_1 = TipNpc;
            _local_1 = ViewManager.TOOLTIP_NPC;
            _local_1 = false;
            _local_1 = TipAchieve;
            _local_1 = ViewManager.TOOLTIP_ACHIEVEMENT;
            _local_1 = false;
            _local_1 = TipStarReq;
            _local_1 = ViewManager.TOOLTIP_REQSTAR;
            _local_1 = false;
            _local_1 = TipEvent;
            _local_1 = ViewManager.TOOLTIP_EVENT;
            _local_1 = false;
            _local_1 = TipTitle;
            _local_1 = ViewManager.TOOLTIP_TITLE;
            _local_1 = false;
            _local_1 = TipMount;
            _local_1 = ViewManager.TOOLTIP_MOUNT;
            _local_1 = false;
            _local_1 = TipMedal;
            _local_1 = ViewManager.TOOLTIP_MEDAL;
            _local_1 = false;
            _local_1 = TipTalent;
            _local_1 = ViewManager.TOOLTIP_TALENT;
            _local_1 = false;
            _local_1 = TipRecipe;
            _local_1 = ViewManager.TOOLTIP_RECIPE;
            _local_1 = false;
            _local_1 = TipDecoShow;
            _local_1 = ViewManager.TOOLTIP_DECO_SHOW;
            _local_1 = false;
            _local_1 = TipDecoRune;
            _local_1 = ViewManager.TOOLTIP_DECO_RUNE;
            _local_1 = false;
            _local_1 = TipRuneChip;
            _local_1 = ViewManager.TOOLTIP_RUNE_CHIP;
            _local_1 = false;
            _local_1 = TipMysTreasure;
            _local_1 = ViewManager.TOOLTIP_MYS_TREASURE;
            _local_1 = false;
            _local_1 = TipPRSChip;
            _local_1 = ViewManager.TOOLTIP_PRS_CHIP;
            _local_1 = false;
            _local_1 = TipMonsterHeart;
            _local_1 = ViewManager.TOOLTIP_MONSTERHEART;
            _local_1 = false;
            _local_1 = TipPetStone;
            _local_1 = ViewManager.TOOLTIP_PET_STONE;
            _local_1 = false;
        }

        private function _TooltipLayer_UIPropVO13_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _TooltipLayer_UIPropVO13 = _local_1;
            _local_1.name = "建筑提示";
            BindingManager.executeBindings(this, "_TooltipLayer_UIPropVO13", _TooltipLayer_UIPropVO13);
            return (_local_1);
        }

        override public function initialize():void
        {
            var target:TooltipLayer;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TooltipLayer_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_TooltipLayerWatcherSetupUtil");
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

        private function _TooltipLayer_UIPropVO1_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _TooltipLayer_UIPropVO1 = _local_1;
            _local_1.name = "技能提示";
            BindingManager.executeBindings(this, "_TooltipLayer_UIPropVO1", _TooltipLayer_UIPropVO1);
            return (_local_1);
        }

        private function _TooltipLayer_UIPropVO5_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _TooltipLayer_UIPropVO5 = _local_1;
            _local_1.name = "翅膀提示";
            BindingManager.executeBindings(this, "_TooltipLayer_UIPropVO5", _TooltipLayer_UIPropVO5);
            return (_local_1);
        }

        private function _TooltipLayer_UIPropVO24_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _TooltipLayer_UIPropVO24 = _local_1;
            _local_1.name = "魂器形象提示";
            BindingManager.executeBindings(this, "_TooltipLayer_UIPropVO24", _TooltipLayer_UIPropVO24);
            return (_local_1);
        }

        private function _TooltipLayer_UIPropVO9_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _TooltipLayer_UIPropVO9 = _local_1;
            _local_1.name = "地图提示";
            BindingManager.executeBindings(this, "_TooltipLayer_UIPropVO9", _TooltipLayer_UIPropVO9);
            return (_local_1);
        }

        private function _TooltipLayer_UIPropVO20_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _TooltipLayer_UIPropVO20 = _local_1;
            _local_1.name = "勋章提示";
            BindingManager.executeBindings(this, "_TooltipLayer_UIPropVO20", _TooltipLayer_UIPropVO20);
            return (_local_1);
        }

        private function _TooltipLayer_UIPropVO28_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _TooltipLayer_UIPropVO28 = _local_1;
            _local_1.name = "魔物之心提示";
            BindingManager.executeBindings(this, "_TooltipLayer_UIPropVO28", _TooltipLayer_UIPropVO28);
            return (_local_1);
        }

        private function _TooltipLayer_UIPropVO17_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _TooltipLayer_UIPropVO17 = _local_1;
            _local_1.name = "活动提示";
            BindingManager.executeBindings(this, "_TooltipLayer_UIPropVO17", _TooltipLayer_UIPropVO17);
            return (_local_1);
        }

        private function _TooltipLayer_UIPropVO12_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _TooltipLayer_UIPropVO12 = _local_1;
            _local_1.name = "技能开发提示";
            BindingManager.executeBindings(this, "_TooltipLayer_UIPropVO12", _TooltipLayer_UIPropVO12);
            return (_local_1);
        }

        private function _TooltipLayer_UIPropVO16_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _TooltipLayer_UIPropVO16 = _local_1;
            _local_1.name = "星宫提示";
            BindingManager.executeBindings(this, "_TooltipLayer_UIPropVO16", _TooltipLayer_UIPropVO16);
            return (_local_1);
        }

        private function _TooltipLayer_UIPropVO4_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _TooltipLayer_UIPropVO4 = _local_1;
            _local_1.name = "装备提示";
            BindingManager.executeBindings(this, "_TooltipLayer_UIPropVO4", _TooltipLayer_UIPropVO4);
            return (_local_1);
        }

        private function _TooltipLayer_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Class
            {
                return (TipSkill);
            }, function (_arg_1:Class):void
            {
                _TooltipLayer_UIPropVO1.cls = _arg_1;
            }, "_TooltipLayer_UIPropVO1.cls");
            result[0] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.TOOLTIP_SKILL);
            }, function (_arg_1:int):void
            {
                _TooltipLayer_UIPropVO1.vid = _arg_1;
            }, "_TooltipLayer_UIPropVO1.vid");
            result[1] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _TooltipLayer_UIPropVO1.initVisible = _arg_1;
            }, "_TooltipLayer_UIPropVO1.initVisible");
            result[2] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TipQuest);
            }, function (_arg_1:Class):void
            {
                _TooltipLayer_UIPropVO2.cls = _arg_1;
            }, "_TooltipLayer_UIPropVO2.cls");
            result[3] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.TOOLTIP_QUEST);
            }, function (_arg_1:int):void
            {
                _TooltipLayer_UIPropVO2.vid = _arg_1;
            }, "_TooltipLayer_UIPropVO2.vid");
            result[4] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _TooltipLayer_UIPropVO2.initVisible = _arg_1;
            }, "_TooltipLayer_UIPropVO2.initVisible");
            result[5] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TipCre);
            }, function (_arg_1:Class):void
            {
                _TooltipLayer_UIPropVO3.cls = _arg_1;
            }, "_TooltipLayer_UIPropVO3.cls");
            result[6] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.TOOLTIP_PET);
            }, function (_arg_1:int):void
            {
                _TooltipLayer_UIPropVO3.vid = _arg_1;
            }, "_TooltipLayer_UIPropVO3.vid");
            result[7] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _TooltipLayer_UIPropVO3.initVisible = _arg_1;
            }, "_TooltipLayer_UIPropVO3.initVisible");
            result[8] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TipEquip);
            }, function (_arg_1:Class):void
            {
                _TooltipLayer_UIPropVO4.cls = _arg_1;
            }, "_TooltipLayer_UIPropVO4.cls");
            result[9] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.TOOLTIP_EQUIP);
            }, function (_arg_1:int):void
            {
                _TooltipLayer_UIPropVO4.vid = _arg_1;
            }, "_TooltipLayer_UIPropVO4.vid");
            result[10] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _TooltipLayer_UIPropVO4.initVisible = _arg_1;
            }, "_TooltipLayer_UIPropVO4.initVisible");
            result[11] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TipWing);
            }, function (_arg_1:Class):void
            {
                _TooltipLayer_UIPropVO5.cls = _arg_1;
            }, "_TooltipLayer_UIPropVO5.cls");
            result[12] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.TOOLTIP_WING);
            }, function (_arg_1:int):void
            {
                _TooltipLayer_UIPropVO5.vid = _arg_1;
            }, "_TooltipLayer_UIPropVO5.vid");
            result[13] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _TooltipLayer_UIPropVO5.initVisible = _arg_1;
            }, "_TooltipLayer_UIPropVO5.initVisible");
            result[14] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TipSoul);
            }, function (_arg_1:Class):void
            {
                _TooltipLayer_UIPropVO6.cls = _arg_1;
            }, "_TooltipLayer_UIPropVO6.cls");
            result[15] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.TOOLTIP_PET_SOUL);
            }, function (_arg_1:int):void
            {
                _TooltipLayer_UIPropVO6.vid = _arg_1;
            }, "_TooltipLayer_UIPropVO6.vid");
            result[16] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _TooltipLayer_UIPropVO6.initVisible = _arg_1;
            }, "_TooltipLayer_UIPropVO6.initVisible");
            result[17] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TipSoulAll);
            }, function (_arg_1:Class):void
            {
                _TooltipLayer_UIPropVO7.cls = _arg_1;
            }, "_TooltipLayer_UIPropVO7.cls");
            result[18] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.TOOLTIP_ALL_SOUL);
            }, function (_arg_1:int):void
            {
                _TooltipLayer_UIPropVO7.vid = _arg_1;
            }, "_TooltipLayer_UIPropVO7.vid");
            result[19] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _TooltipLayer_UIPropVO7.initVisible = _arg_1;
            }, "_TooltipLayer_UIPropVO7.initVisible");
            result[20] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TipBattle);
            }, function (_arg_1:Class):void
            {
                _TooltipLayer_UIPropVO8.cls = _arg_1;
            }, "_TooltipLayer_UIPropVO8.cls");
            result[21] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.TOOLTIP_BATTLE);
            }, function (_arg_1:int):void
            {
                _TooltipLayer_UIPropVO8.vid = _arg_1;
            }, "_TooltipLayer_UIPropVO8.vid");
            result[22] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _TooltipLayer_UIPropVO8.initVisible = _arg_1;
            }, "_TooltipLayer_UIPropVO8.initVisible");
            result[23] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TipMap);
            }, function (_arg_1:Class):void
            {
                _TooltipLayer_UIPropVO9.cls = _arg_1;
            }, "_TooltipLayer_UIPropVO9.cls");
            result[24] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.TOOLTIP_MAP);
            }, function (_arg_1:int):void
            {
                _TooltipLayer_UIPropVO9.vid = _arg_1;
            }, "_TooltipLayer_UIPropVO9.vid");
            result[25] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _TooltipLayer_UIPropVO9.initVisible = _arg_1;
            }, "_TooltipLayer_UIPropVO9.initVisible");
            result[26] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TipItem);
            }, function (_arg_1:Class):void
            {
                _TooltipLayer_UIPropVO10.cls = _arg_1;
            }, "_TooltipLayer_UIPropVO10.cls");
            result[27] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.TOOLTIP_ITEM);
            }, function (_arg_1:int):void
            {
                _TooltipLayer_UIPropVO10.vid = _arg_1;
            }, "_TooltipLayer_UIPropVO10.vid");
            result[28] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _TooltipLayer_UIPropVO10.initVisible = _arg_1;
            }, "_TooltipLayer_UIPropVO10.initVisible");
            result[29] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _TooltipLayer_UIPropVO10.isLast = _arg_1;
            }, "_TooltipLayer_UIPropVO10.isLast");
            result[30] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TipReqSkill);
            }, function (_arg_1:Class):void
            {
                _TooltipLayer_UIPropVO11.cls = _arg_1;
            }, "_TooltipLayer_UIPropVO11.cls");
            result[31] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.TOOLTIP_REQSKILL);
            }, function (_arg_1:int):void
            {
                _TooltipLayer_UIPropVO11.vid = _arg_1;
            }, "_TooltipLayer_UIPropVO11.vid");
            result[32] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _TooltipLayer_UIPropVO11.initVisible = _arg_1;
            }, "_TooltipLayer_UIPropVO11.initVisible");
            result[33] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TipDevSkill);
            }, function (_arg_1:Class):void
            {
                _TooltipLayer_UIPropVO12.cls = _arg_1;
            }, "_TooltipLayer_UIPropVO12.cls");
            result[34] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.TOOLTIP_DEVSKILL);
            }, function (_arg_1:int):void
            {
                _TooltipLayer_UIPropVO12.vid = _arg_1;
            }, "_TooltipLayer_UIPropVO12.vid");
            result[35] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _TooltipLayer_UIPropVO12.initVisible = _arg_1;
            }, "_TooltipLayer_UIPropVO12.initVisible");
            result[36] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TipBuilding);
            }, function (_arg_1:Class):void
            {
                _TooltipLayer_UIPropVO13.cls = _arg_1;
            }, "_TooltipLayer_UIPropVO13.cls");
            result[37] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.TOOLTIP_BUILDING);
            }, function (_arg_1:int):void
            {
                _TooltipLayer_UIPropVO13.vid = _arg_1;
            }, "_TooltipLayer_UIPropVO13.vid");
            result[38] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _TooltipLayer_UIPropVO13.initVisible = _arg_1;
            }, "_TooltipLayer_UIPropVO13.initVisible");
            result[39] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TipNpc);
            }, function (_arg_1:Class):void
            {
                _TooltipLayer_UIPropVO14.cls = _arg_1;
            }, "_TooltipLayer_UIPropVO14.cls");
            result[40] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.TOOLTIP_NPC);
            }, function (_arg_1:int):void
            {
                _TooltipLayer_UIPropVO14.vid = _arg_1;
            }, "_TooltipLayer_UIPropVO14.vid");
            result[41] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _TooltipLayer_UIPropVO14.initVisible = _arg_1;
            }, "_TooltipLayer_UIPropVO14.initVisible");
            result[42] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TipAchieve);
            }, function (_arg_1:Class):void
            {
                _TooltipLayer_UIPropVO15.cls = _arg_1;
            }, "_TooltipLayer_UIPropVO15.cls");
            result[43] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.TOOLTIP_ACHIEVEMENT);
            }, function (_arg_1:int):void
            {
                _TooltipLayer_UIPropVO15.vid = _arg_1;
            }, "_TooltipLayer_UIPropVO15.vid");
            result[44] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _TooltipLayer_UIPropVO15.initVisible = _arg_1;
            }, "_TooltipLayer_UIPropVO15.initVisible");
            result[45] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TipStarReq);
            }, function (_arg_1:Class):void
            {
                _TooltipLayer_UIPropVO16.cls = _arg_1;
            }, "_TooltipLayer_UIPropVO16.cls");
            result[46] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.TOOLTIP_REQSTAR);
            }, function (_arg_1:int):void
            {
                _TooltipLayer_UIPropVO16.vid = _arg_1;
            }, "_TooltipLayer_UIPropVO16.vid");
            result[47] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _TooltipLayer_UIPropVO16.initVisible = _arg_1;
            }, "_TooltipLayer_UIPropVO16.initVisible");
            result[48] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TipEvent);
            }, function (_arg_1:Class):void
            {
                _TooltipLayer_UIPropVO17.cls = _arg_1;
            }, "_TooltipLayer_UIPropVO17.cls");
            result[49] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.TOOLTIP_EVENT);
            }, function (_arg_1:int):void
            {
                _TooltipLayer_UIPropVO17.vid = _arg_1;
            }, "_TooltipLayer_UIPropVO17.vid");
            result[50] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _TooltipLayer_UIPropVO17.initVisible = _arg_1;
            }, "_TooltipLayer_UIPropVO17.initVisible");
            result[51] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TipTitle);
            }, function (_arg_1:Class):void
            {
                _TooltipLayer_UIPropVO18.cls = _arg_1;
            }, "_TooltipLayer_UIPropVO18.cls");
            result[52] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.TOOLTIP_TITLE);
            }, function (_arg_1:int):void
            {
                _TooltipLayer_UIPropVO18.vid = _arg_1;
            }, "_TooltipLayer_UIPropVO18.vid");
            result[53] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _TooltipLayer_UIPropVO18.initVisible = _arg_1;
            }, "_TooltipLayer_UIPropVO18.initVisible");
            result[54] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TipMount);
            }, function (_arg_1:Class):void
            {
                _TooltipLayer_UIPropVO19.cls = _arg_1;
            }, "_TooltipLayer_UIPropVO19.cls");
            result[55] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.TOOLTIP_MOUNT);
            }, function (_arg_1:int):void
            {
                _TooltipLayer_UIPropVO19.vid = _arg_1;
            }, "_TooltipLayer_UIPropVO19.vid");
            result[56] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _TooltipLayer_UIPropVO19.initVisible = _arg_1;
            }, "_TooltipLayer_UIPropVO19.initVisible");
            result[57] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TipMedal);
            }, function (_arg_1:Class):void
            {
                _TooltipLayer_UIPropVO20.cls = _arg_1;
            }, "_TooltipLayer_UIPropVO20.cls");
            result[58] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.TOOLTIP_MEDAL);
            }, function (_arg_1:int):void
            {
                _TooltipLayer_UIPropVO20.vid = _arg_1;
            }, "_TooltipLayer_UIPropVO20.vid");
            result[59] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _TooltipLayer_UIPropVO20.initVisible = _arg_1;
            }, "_TooltipLayer_UIPropVO20.initVisible");
            result[60] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TipTalent);
            }, function (_arg_1:Class):void
            {
                _TooltipLayer_UIPropVO21.cls = _arg_1;
            }, "_TooltipLayer_UIPropVO21.cls");
            result[61] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.TOOLTIP_TALENT);
            }, function (_arg_1:int):void
            {
                _TooltipLayer_UIPropVO21.vid = _arg_1;
            }, "_TooltipLayer_UIPropVO21.vid");
            result[62] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _TooltipLayer_UIPropVO21.initVisible = _arg_1;
            }, "_TooltipLayer_UIPropVO21.initVisible");
            result[63] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TipRecipe);
            }, function (_arg_1:Class):void
            {
                _TooltipLayer_UIPropVO22.cls = _arg_1;
            }, "_TooltipLayer_UIPropVO22.cls");
            result[64] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.TOOLTIP_RECIPE);
            }, function (_arg_1:int):void
            {
                _TooltipLayer_UIPropVO22.vid = _arg_1;
            }, "_TooltipLayer_UIPropVO22.vid");
            result[65] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _TooltipLayer_UIPropVO22.initVisible = _arg_1;
            }, "_TooltipLayer_UIPropVO22.initVisible");
            result[66] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TipDecoShow);
            }, function (_arg_1:Class):void
            {
                _TooltipLayer_UIPropVO23.cls = _arg_1;
            }, "_TooltipLayer_UIPropVO23.cls");
            result[67] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.TOOLTIP_DECO_SHOW);
            }, function (_arg_1:int):void
            {
                _TooltipLayer_UIPropVO23.vid = _arg_1;
            }, "_TooltipLayer_UIPropVO23.vid");
            result[68] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _TooltipLayer_UIPropVO23.initVisible = _arg_1;
            }, "_TooltipLayer_UIPropVO23.initVisible");
            result[69] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TipDecoRune);
            }, function (_arg_1:Class):void
            {
                _TooltipLayer_UIPropVO24.cls = _arg_1;
            }, "_TooltipLayer_UIPropVO24.cls");
            result[70] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.TOOLTIP_DECO_RUNE);
            }, function (_arg_1:int):void
            {
                _TooltipLayer_UIPropVO24.vid = _arg_1;
            }, "_TooltipLayer_UIPropVO24.vid");
            result[71] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _TooltipLayer_UIPropVO24.initVisible = _arg_1;
            }, "_TooltipLayer_UIPropVO24.initVisible");
            result[72] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TipRuneChip);
            }, function (_arg_1:Class):void
            {
                _TooltipLayer_UIPropVO25.cls = _arg_1;
            }, "_TooltipLayer_UIPropVO25.cls");
            result[73] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.TOOLTIP_RUNE_CHIP);
            }, function (_arg_1:int):void
            {
                _TooltipLayer_UIPropVO25.vid = _arg_1;
            }, "_TooltipLayer_UIPropVO25.vid");
            result[74] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _TooltipLayer_UIPropVO25.initVisible = _arg_1;
            }, "_TooltipLayer_UIPropVO25.initVisible");
            result[75] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TipMysTreasure);
            }, function (_arg_1:Class):void
            {
                _TooltipLayer_UIPropVO26.cls = _arg_1;
            }, "_TooltipLayer_UIPropVO26.cls");
            result[76] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.TOOLTIP_MYS_TREASURE);
            }, function (_arg_1:int):void
            {
                _TooltipLayer_UIPropVO26.vid = _arg_1;
            }, "_TooltipLayer_UIPropVO26.vid");
            result[77] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _TooltipLayer_UIPropVO26.initVisible = _arg_1;
            }, "_TooltipLayer_UIPropVO26.initVisible");
            result[78] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TipPRSChip);
            }, function (_arg_1:Class):void
            {
                _TooltipLayer_UIPropVO27.cls = _arg_1;
            }, "_TooltipLayer_UIPropVO27.cls");
            result[79] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.TOOLTIP_PRS_CHIP);
            }, function (_arg_1:int):void
            {
                _TooltipLayer_UIPropVO27.vid = _arg_1;
            }, "_TooltipLayer_UIPropVO27.vid");
            result[80] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _TooltipLayer_UIPropVO27.initVisible = _arg_1;
            }, "_TooltipLayer_UIPropVO27.initVisible");
            result[81] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TipMonsterHeart);
            }, function (_arg_1:Class):void
            {
                _TooltipLayer_UIPropVO28.cls = _arg_1;
            }, "_TooltipLayer_UIPropVO28.cls");
            result[82] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.TOOLTIP_MONSTERHEART);
            }, function (_arg_1:int):void
            {
                _TooltipLayer_UIPropVO28.vid = _arg_1;
            }, "_TooltipLayer_UIPropVO28.vid");
            result[83] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _TooltipLayer_UIPropVO28.initVisible = _arg_1;
            }, "_TooltipLayer_UIPropVO28.initVisible");
            result[84] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TipPetStone);
            }, function (_arg_1:Class):void
            {
                _TooltipLayer_UIPropVO29.cls = _arg_1;
            }, "_TooltipLayer_UIPropVO29.cls");
            result[85] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.TOOLTIP_PET_STONE);
            }, function (_arg_1:int):void
            {
                _TooltipLayer_UIPropVO29.vid = _arg_1;
            }, "_TooltipLayer_UIPropVO29.vid");
            result[86] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _TooltipLayer_UIPropVO29.initVisible = _arg_1;
            }, "_TooltipLayer_UIPropVO29.initVisible");
            result[87] = binding;
            return (result);
        }

        private function _TooltipLayer_UIPropVO8_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _TooltipLayer_UIPropVO8 = _local_1;
            _local_1.name = "战斗提示";
            BindingManager.executeBindings(this, "_TooltipLayer_UIPropVO8", _TooltipLayer_UIPropVO8);
            return (_local_1);
        }

        private function _TooltipLayer_UIPropVO23_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _TooltipLayer_UIPropVO23 = _local_1;
            _local_1.name = "魂器形象提示";
            BindingManager.executeBindings(this, "_TooltipLayer_UIPropVO23", _TooltipLayer_UIPropVO23);
            return (_local_1);
        }

        private function _TooltipLayer_UIPropVO27_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _TooltipLayer_UIPropVO27 = _local_1;
            _local_1.name = "神谕碎片提示";
            BindingManager.executeBindings(this, "_TooltipLayer_UIPropVO27", _TooltipLayer_UIPropVO27);
            return (_local_1);
        }

        private function _TooltipLayer_Array1_i():Array
        {
            var _local_1:Array = [_TooltipLayer_UIPropVO1_i(), _TooltipLayer_UIPropVO2_i(), _TooltipLayer_UIPropVO3_i(), _TooltipLayer_UIPropVO4_i(), _TooltipLayer_UIPropVO5_i(), _TooltipLayer_UIPropVO6_i(), _TooltipLayer_UIPropVO7_i(), _TooltipLayer_UIPropVO8_i(), _TooltipLayer_UIPropVO9_i(), _TooltipLayer_UIPropVO10_i(), _TooltipLayer_UIPropVO11_i(), _TooltipLayer_UIPropVO12_i(), _TooltipLayer_UIPropVO13_i(), _TooltipLayer_UIPropVO14_i(), _TooltipLayer_UIPropVO15_i(), _TooltipLayer_UIPropVO16_i(), _TooltipLayer_UIPropVO17_i(), _TooltipLayer_UIPropVO18_i(), _TooltipLayer_UIPropVO19_i(), _TooltipLayer_UIPropVO20_i(), _TooltipLayer_UIPropVO21_i(), _TooltipLayer_UIPropVO22_i(), _TooltipLayer_UIPropVO23_i(), _TooltipLayer_UIPropVO24_i(), _TooltipLayer_UIPropVO25_i(), _TooltipLayer_UIPropVO26_i(), _TooltipLayer_UIPropVO27_i(), _TooltipLayer_UIPropVO28_i(), _TooltipLayer_UIPropVO29_i()];
            uiList = _local_1;
            return (_local_1);
        }


    }
}//package com.qeedoo.ui.view

