// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.PanelLayer

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
    import com.qeedoo.ui.view.compDragable.BagPanel;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.view.compDragable.ShopPanel;
    import com.qeedoo.ui.view.compDragable.AwardPanelAll;
    import com.qeedoo.ui.view.compDragable.BankPanel;
    import com.qeedoo.ui.view.compDragable.CharactorPanel;
    import com.qeedoo.ui.view.compDragable.ChatPanelManager;
    import com.qeedoo.ui.view.compDragable.GuildPanel;
    import com.qeedoo.ui.view.compDragable.AddGuildPanel;
    import com.qeedoo.ui.view.compDragable.HelpPanel;
    import com.qeedoo.ui.view.compDragable.MailManagerPanel;
    import com.qeedoo.ui.view.compDragable.MailPanel;
    import com.qeedoo.ui.view.compDragable.MapPanel;
    import com.qeedoo.ui.view.compDragable.CharactorInfoPanel;
    import com.qeedoo.ui.view.compDragable.PetManagerPanel;
    import com.qeedoo.ui.view.compDragable.PetPanel;
    import com.qeedoo.ui.view.compDragable.NpcFuncPanel;
    import com.qeedoo.ui.view.compDragable.NpcFuncOther;
    import com.qeedoo.ui.view.compDragable.NpcScriptPanel;
    import com.qeedoo.ui.view.compDragable.QuestPanel;
    import com.qeedoo.ui.view.compDragable.QuestManager;
    import com.qeedoo.ui.view.compDragable.SkillManager;
    import com.qeedoo.ui.view.compDragable.TextPanel;
    import com.qeedoo.ui.view.compDragable.TradePanel;
    import com.qeedoo.ui.view.compDragable.UserSystemSetPanel;
    import com.qeedoo.ui.view.compDragable.EquiptFuncPanel;
    import com.qeedoo.ui.view.compDragable.PetFuncPanel;
    import com.qeedoo.ui.view.compDragable.PetAdvancedPanel;
    import com.qeedoo.ui.view.compDragable.SkillLearningPanel;
    import com.qeedoo.ui.view.compDragable.AuctionPanel;
    import com.qeedoo.ui.view.compDragable.PMAuctionPanel;
    import com.qeedoo.ui.view.compDragable.IMPanel;
    import com.qeedoo.ui.view.compDragable.SystemShopPanel;
    import com.qeedoo.ui.view.compDragable.SystemShopTrolleyPanel;
    import com.qeedoo.ui.view.compDragable.GroupPanel;
    import com.qeedoo.ui.view.compDragable.GroupRecruitPanel;
    import com.qeedoo.ui.view.compDragable.GroupRecruitNewPanel;
    import com.qeedoo.ui.view.compDragable.GroupRecruitDetailPanel;
    import com.qeedoo.ui.view.compDragable.Treasure;
    import com.qeedoo.ui.view.compDragable.ExchangePanel;
    import com.qeedoo.ui.view.compDragable.ProductPanel;
    import com.qeedoo.ui.view.compDragable.BattleSettingPanel;
    import com.qeedoo.ui.view.compDragable.TitleSelectPanel;
    import com.qeedoo.ui.view.compDragable.CallBoardPanel;
    import com.qeedoo.ui.view.compDragable.AnswerPanel;
    import com.qeedoo.ui.view.compBattle.AutoBattleCanvas;
    import com.qeedoo.ui.view.compDragable.AwardPanel;
    import com.qeedoo.ui.view.compDragable.AutoExpPanel;
    import com.qeedoo.ui.view.compDragable.BloodAddPanel;
    import com.qeedoo.ui.view.compDragable.ActivePanel;
    import com.qeedoo.ui.view.compDragable.GuildContribPanel;
    import com.qeedoo.ui.view.compDragable.GuildWarehousePanel;
    import com.qeedoo.ui.view.compDragable.ConstructionManager;
    import com.qeedoo.ui.view.compDragable.BuildInfoPanel;
    import com.qeedoo.ui.view.compDragable.GuildSkillDevPanel;
    import com.qeedoo.ui.view.compDragable.GuildBuildProcess;
    import com.qeedoo.ui.view.compDragable.GuildHelpPanel;
    import com.qeedoo.ui.view.compDragable.NpcShowMsgPanel;
    import com.qeedoo.ui.view.compDragable.NpcShowRankPanel;
    import com.qeedoo.ui.view.compDragable.LifeSkillPanel;
    import com.qeedoo.ui.view.compDragable.LottoPanel;
    import com.qeedoo.ui.view.compDragable.LottoBagPanel;
    import com.qeedoo.ui.view.compDragable.TemporaryBagPanel;
    import com.qeedoo.ui.view.compDragable.ChangeColorPanel;
    import com.qeedoo.ui.view.compDragable.ChangeWingColorPanel;
    import com.qeedoo.ui.view.compDragable.MarriageManagerPanel;
    import com.qeedoo.ui.view.compDragable.WeddingBookPanel;
    import com.qeedoo.ui.view.compDragable.AchievementPanel;
    import com.qeedoo.ui.view.compDragable.AchievementComparePanel;
    import com.qeedoo.ui.view.compDragable.CrossBattleRank;
    import com.qeedoo.ui.view.compDragable.GameIntroPanel;
    import com.qeedoo.ui.view.compDragable.DailyActPanel;
    import com.qeedoo.ui.view.compDragable.WingFuncPanel;
    import com.qeedoo.ui.view.compDragable.FairyManagerPanel;
    import com.qeedoo.ui.view.compDragable.WingAdvancedPanel;
    import com.qeedoo.ui.view.compDragable.TempBagSlot;
    import com.qeedoo.ui.view.compDragable.DetailPropPanel;
    import com.qeedoo.ui.view.compDragable.QuestioningPanel;
    import com.qeedoo.ui.view.compDragable.QxWishesPanel;
    import com.qeedoo.ui.view.compDragable.VDAYPanel;
    import com.qeedoo.ui.view.compDragable.FazendaPanel;
    import com.qeedoo.ui.view.compDragable.PetFightConf;
    import com.qeedoo.ui.view.compDragable.PetArenaPanel;
    import com.qeedoo.ui.view.compDragable.PetArenaRankPanel;
    import com.qeedoo.ui.view.compDragable.PetArenaPrevRankPanel;
    import com.qeedoo.ui.view.compDragable.MultiItemPanel;
    import com.qeedoo.ui.view.compDragable.AddictEnterPanel;
    import com.qeedoo.ui.view.compDragable.StarAdditionPanel;
    import com.qeedoo.ui.view.compDragable.StarEffectPanel;
    import com.qeedoo.ui.view.compDragable.StarSpeedUpPanel;
    import com.qeedoo.ui.view.compDragable.MailNoticePanel;
    import com.qeedoo.ui.view.compDragable.WbResult;
    import com.qeedoo.ui.view.compDragable.WbTimerCanvas;
    import com.qeedoo.ui.view.compDragable.WelfarePanel;
    import com.qeedoo.ui.view.compDragable.TaskSweepPanel;
    import com.qeedoo.ui.view.compDragable.NewServerActPanel;
    import com.qeedoo.ui.view.compDragable.NineBossPanel;
    import com.qeedoo.ui.view.compDragable.SendCombineActPanel;
    import com.qeedoo.ui.view.compDragable.PetSoulPanel;
    import com.qeedoo.ui.view.compDragable.SoulExpPanel;
    import com.qeedoo.ui.view.compDragable.CardGamePanel;
    import com.qeedoo.ui.view.compDragable.PmPanel;
    import com.qeedoo.ui.view.compDragable.PmInfoPanel;
    import com.qeedoo.ui.view.compDragable.JewelExchagePanel;
    import com.qeedoo.ui.view.compDragable.VipShopPanel;
    import com.qeedoo.ui.view.compDragable.LotteryPanel;
    import com.qeedoo.ui.view.compDragable.DoubleElevenPanel;
    import com.qeedoo.ui.view.compDragable.LotteryBagPanel;
    import com.qeedoo.ui.view.compDragable.VipSuccinctPanel;
    import com.qeedoo.ui.view.compDragable.SignInPanel;
    import com.qeedoo.ui.view.compDragable.PVPResultPanel;
    import com.qeedoo.ui.view.compDragable.MountPanel;
    import com.qeedoo.ui.view.compDragable.ChangeRbResPanel;
    import com.qeedoo.ui.view.compDragable.LuckDrawPanel;
    import com.qeedoo.ui.view.compDragable.LuckDrawBagPanel;
    import com.qeedoo.ui.view.compDragable.MagicArrayPanel;
    import com.qeedoo.ui.view.compDragable.MilitaryPanel;
    import com.qeedoo.ui.view.compDragable.MazePanel;
    import com.qeedoo.ui.view.compDragable.MazeQuestionPanel;
    import com.qeedoo.ui.view.compDragable.MazeShopPanel;
    import com.qeedoo.ui.view.compDragable.MazeLotteryPanel;
    import com.qeedoo.ui.view.compDragable.MazeEventInfoPanel;
    import com.qeedoo.ui.view.compDragable.MazePlayRulePanel;
    import com.qeedoo.ui.view.compDragable.MazeDiscPanel;
    import com.qeedoo.ui.view.compDragable.SmallGamePanel;
    import com.qeedoo.ui.view.compDragable.SmallGameHideSeekPanel;
    import com.qeedoo.ui.view.compDragable.SmallGameTwoSamePanel;
    import com.qeedoo.ui.view.compDragable.SmallGameMagicPowerPanel;
    import com.qeedoo.ui.view.compDragable.SmallGameSpeedPanel;
    import com.qeedoo.ui.view.compDragable.MedalPanel;
    import com.qeedoo.ui.view.compDragable.AstrologicPanel;
    import com.qeedoo.ui.view.compDragable.PetHandbook;
    import com.qeedoo.ui.view.compDragable.PetEvolutionPanel;
    import com.qeedoo.ui.view.compDragable.FindBackPanel;
    import com.qeedoo.ui.view.compDragable.CrossFightPanel;
    import com.qeedoo.ui.view.compDragable.CrossFightTeamInfo;
    import com.qeedoo.ui.view.compDragable.FairySkillConfigCanvas;
    import com.qeedoo.ui.view.compBattle.BattleInfoCanvas;
    import com.qeedoo.ui.view.compDragable.CrossTeamFightPanel;
    import com.qeedoo.ui.view.compDragable.CrossTeamFightBetPanel;
    import com.qeedoo.ui.view.compDragable.CrossContentionTotalPanel;
    import com.qeedoo.ui.view.compDragable.CrossContentionSinglePanel;
    import com.qeedoo.ui.view.compDragable.CrossContentionSingleInfoPanel;
    import com.qeedoo.ui.view.compDragable.CrossContentionAreaPanel;
    import com.qeedoo.ui.view.compDragable.CrossContentionBossAreaPanel;
    import com.qeedoo.ui.view.compDragable.CrossContentionFightPanel;
    import com.qeedoo.ui.view.compDragable.CrossContentionFirstAward;
    import com.qeedoo.ui.view.compDragable.CrossContentionScoreAward;
    import com.qeedoo.ui.view.compDragable.CrossContentionTimeAward;
    import com.qeedoo.ui.view.compDragable.CrossContentionBattleInfo;
    import com.qeedoo.ui.view.compDragable.CrossContentionRank;
    import com.qeedoo.ui.view.compDragable.PetTalentPanel;
    import com.qeedoo.ui.view.compDragable.PetTalentFuncPanel;
    import com.qeedoo.ui.view.compDragable.TreasurePanel;
    import com.qeedoo.ui.view.compDragable.ExtractCardActivity;
    import com.qeedoo.ui.view.compDragable.StoneSealPanel;
    import com.qeedoo.ui.view.compDragable.StoneSealBoreCanvas;
    import com.qeedoo.ui.view.compDragable.StarExchange;
    import com.qeedoo.ui.view.compDragable.FlopPassPanel;
    import com.qeedoo.ui.view.compDragable.HulaPanel;
    import com.qeedoo.ui.view.compDragable.ReturnRewardPanel;
    import com.qeedoo.ui.view.compDragable.TrialsPassMainPanel;
    import com.qeedoo.ui.view.compDragable.TrialsPassAwardPanel;
    import com.qeedoo.ui.view.compDragable.DotaPanel;
    import com.qeedoo.ui.view.compDragable.GrouponPanel;
    import com.qeedoo.ui.view.compDragable.SummerGames;
    import com.qeedoo.ui.view.compDragable.Wasteland;
    import com.qeedoo.ui.view.compDragable.ThreeDiabetes;
    import com.qeedoo.ui.view.compDragable.HorseRace;
    import com.qeedoo.ui.view.compDragable.WorldCupPanel;
    import com.qeedoo.ui.view.compDragable.WorldCupVSPanel;
    import com.qeedoo.ui.view.compDragable.DressPanel;
    import com.qeedoo.ui.view.compDragable.DecoratePanel;
    import com.qeedoo.ui.view.compDragable.AutoTaskPanel;
    import com.qeedoo.ui.view.compDragable.RecipeExchangePanel;
    import com.qeedoo.ui.view.compDragable.WorldCupChangePanel;
    import com.qeedoo.ui.view.compDragable.NpcShopPanel;
    import com.qeedoo.ui.view.compDragable.BossDailyPanel;
    import com.qeedoo.ui.view.compDragable.AwakenPanel;
    import com.qeedoo.ui.view.compDragable.WaWaGamePanel;
    import com.qeedoo.ui.view.compDragable.WaWaChangePanel;
    import com.qeedoo.ui.view.compDragable.ChargeNoticePanel;
    import com.qeedoo.ui.view.compDragable.MysteryFurnace;
    import com.qeedoo.ui.view.compDragable.TrainSoulPanel;
    import com.qeedoo.ui.view.compDragable.JuHuaSuanAlertPanel;
    import com.qeedoo.ui.view.compDragable.JuHuaSuanPanel;
    import com.qeedoo.ui.view.compDragable.ManJiuJianPanel;
    import com.qeedoo.ui.view.compDragable.RebateEverydayPanel;
    import com.qeedoo.ui.view.compDragable.RebateEverydayAlertPanel;
    import com.qeedoo.ui.view.compDragable.TripleTownPanel;
    import com.qeedoo.ui.view.compDragable.MonthWelfarePanel;
    import com.qeedoo.ui.view.compDragable.MonthWelfareAlertPanel;
    import com.qeedoo.ui.view.compDragable.MonthWelfareBagPanel;
    import com.qeedoo.ui.view.compDragable.HeiYaoShiPanel;
    import com.qeedoo.ui.view.compDragable.HeiyaoshiAlertPanel;
    import com.qeedoo.ui.view.compDragable.PRSPanel;
    import com.qeedoo.ui.view.compDragable.SecretTreasureHuntPanel;
    import com.qeedoo.ui.view.compDragable.SecretTreasureHuntAlertPanel;
    import com.qeedoo.ui.view.compDragable.SecretTreasureHuntAlertOne;
    import com.qeedoo.ui.view.compDragable.SecretTreasureHuntEnd;
    import com.qeedoo.ui.view.compDragable.SecretTreasureHuntAutoPlay;
    import com.qeedoo.ui.view.compDragable.WarSpritePanel;
    import com.qeedoo.ui.view.compDragable.HappyFrontLinePanel;
    import com.qeedoo.ui.view.compDragable.AnniversaryPanel;
    import com.qeedoo.ui.view.compDragable.FarmMaster;
    import com.qeedoo.ui.view.compDragable.StoneMaster;
    import com.qeedoo.ui.view.compDragable.CubeMaster;
    import com.qeedoo.ui.view.compDragable.MonsterHeartPanel;
    import com.qeedoo.ui.view.compDragable.PetGuardPanel;
    import com.qeedoo.ui.view.compDragable.PetGuardInSidePanel;
    import com.qeedoo.ui.view.compDragable.DailySignInPanel;
    import com.qeedoo.ui.view.compDragable.MagicCrystalPanel;
    import com.qeedoo.ui.view.compDragable.StoneToGoldActPanel;
    import com.qeedoo.ui.view.compDragable.QiLingPanel;
    import com.qeedoo.ui.view.compDragable.MoJinActPanel;
    import com.qeedoo.ui.view.compDragable.PetStonePanel;
    import com.qeedoo.ui.view.compDragable.AddOpePanel;
    import com.qeedoo.ui.view.compDragable.ExplorerMedalPanel;
    import com.qeedoo.ui.view.compDragable.Sudoku;
    import com.qeedoo.ui.view.compDragable.DuiduiPeng;
    import com.qeedoo.ui.view.compDragable.ShowTimePnael;
    import com.qeedoo.ui.view.compDragable.AnniversaryTurntable;
    import com.qeedoo.ui.view.compDragable.PetPVESystem;
    import com.qeedoo.ui.view.compDragable.PetPVEConfigPanel;
    import com.qeedoo.ui.view.compDragable.PetArenaActivityPanel;
    import com.qeedoo.ui.view.compDragable.PetArenaActivityRankPanel;
    import com.qeedoo.ui.view.compDragable.PetFightConfActivity;
    import com.qeedoo.ui.view.compDragable.PetArenaPrevRankActivityPanel;
    import com.qeedoo.ui.view.compDragable.PKGamePanel;
    import com.qeedoo.ui.view.compDragable.ConsumeNoticePanel;
    import com.qeedoo.ui.view.compDragable.XiaochudasaiPanel;
    import com.qeedoo.ui.view.compDragable.PrePurchasePanel;
    import com.qeedoo.ui.view.compDragable.texunkecheng;
    import com.qeedoo.ui.view.compDragable.TXKCEXPPanel;
    import com.qeedoo.ui.view.compDragable.XiulianshiPanel;
    import com.qeedoo.ui.view.compDragable.Moyintuce;
    import com.qeedoo.ui.view.compDragable.RedEnvelopePanel;
    import com.qeedoo.ui.view.compDragable.MCZD;
    import com.qeedoo.ui.view.compDragable.MCZDPetFightConf;
    import com.qeedoo.ui.view.compDragable.MCZDTotalRankPanel;
    import com.qeedoo.ui.view.compDragable.JXHD;
    import com.qeedoo.ui.view.compDragable.MQDTPanel;
    import com.qeedoo.ui.view.compDragable.TKYYHInfoPanel;
    import com.qeedoo.ui.view.compDragable.AnniversarySignInPanel;
    import flash.utils.getDefinitionByName;
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

    public class PanelLayer extends UIBase implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _PanelLayer_UIPropVO1:UIPropVO;
        public var _PanelLayer_UIPropVO2:UIPropVO;
        public var _PanelLayer_UIPropVO4:UIPropVO;
        public var _PanelLayer_UIPropVO6:UIPropVO;
        public var _PanelLayer_UIPropVO9:UIPropVO;
        public var _PanelLayer_UIPropVO3:UIPropVO;
        public var _PanelLayer_UIPropVO5:UIPropVO;
        public var _PanelLayer_UIPropVO7:UIPropVO;
        public var _PanelLayer_UIPropVO8:UIPropVO;
        public var _PanelLayer_UIPropVO10:UIPropVO;
        public var _PanelLayer_UIPropVO11:UIPropVO;
        public var _PanelLayer_UIPropVO12:UIPropVO;
        public var _PanelLayer_UIPropVO13:UIPropVO;
        public var _PanelLayer_UIPropVO15:UIPropVO;
        public var _PanelLayer_UIPropVO18:UIPropVO;
        public var _PanelLayer_UIPropVO19:UIPropVO;
        public var _PanelLayer_UIPropVO14:UIPropVO;
        public var _PanelLayer_UIPropVO16:UIPropVO;
        public var _PanelLayer_UIPropVO17:UIPropVO;
        public var _PanelLayer_UIPropVO20:UIPropVO;
        public var _PanelLayer_UIPropVO21:UIPropVO;
        public var _PanelLayer_UIPropVO22:UIPropVO;
        public var _PanelLayer_UIPropVO23:UIPropVO;
        public var _PanelLayer_UIPropVO24:UIPropVO;
        public var _PanelLayer_UIPropVO25:UIPropVO;
        public var _PanelLayer_UIPropVO26:UIPropVO;
        public var _PanelLayer_UIPropVO27:UIPropVO;
        public var _PanelLayer_UIPropVO28:UIPropVO;
        public var _PanelLayer_UIPropVO29:UIPropVO;
        public var _PanelLayer_UIPropVO31:UIPropVO;
        public var _PanelLayer_UIPropVO33:UIPropVO;
        public var _PanelLayer_UIPropVO35:UIPropVO;
        public var _PanelLayer_UIPropVO37:UIPropVO;
        public var _PanelLayer_UIPropVO38:UIPropVO;
        public var _PanelLayer_UIPropVO32:UIPropVO;
        public var _PanelLayer_UIPropVO34:UIPropVO;
        public var _PanelLayer_UIPropVO36:UIPropVO;
        public var _PanelLayer_UIPropVO30:UIPropVO;
        public var _PanelLayer_UIPropVO39:UIPropVO;
        public var _PanelLayer_UIPropVO40:UIPropVO;
        public var _PanelLayer_UIPropVO41:UIPropVO;
        public var _PanelLayer_UIPropVO42:UIPropVO;
        public var _PanelLayer_UIPropVO43:UIPropVO;
        public var _PanelLayer_UIPropVO44:UIPropVO;
        public var _PanelLayer_UIPropVO45:UIPropVO;
        public var _PanelLayer_UIPropVO46:UIPropVO;
        public var _PanelLayer_UIPropVO47:UIPropVO;
        public var _PanelLayer_UIPropVO48:UIPropVO;
        public var _PanelLayer_UIPropVO49:UIPropVO;
        public var _PanelLayer_UIPropVO200:UIPropVO;
        public var _PanelLayer_UIPropVO201:UIPropVO;
        public var _PanelLayer_UIPropVO202:UIPropVO;
        public var _PanelLayer_UIPropVO204:UIPropVO;
        public var _PanelLayer_UIPropVO206:UIPropVO;
        public var _PanelLayer_UIPropVO208:UIPropVO;
        public var _PanelLayer_UIPropVO203:UIPropVO;
        public var _PanelLayer_UIPropVO205:UIPropVO;
        public var _PanelLayer_UIPropVO207:UIPropVO;
        public var _PanelLayer_UIPropVO209:UIPropVO;
        public var _PanelLayer_UIPropVO53:UIPropVO;
        public var _PanelLayer_UIPropVO55:UIPropVO;
        public var _PanelLayer_UIPropVO50:UIPropVO;
        public var _PanelLayer_UIPropVO51:UIPropVO;
        public var _PanelLayer_UIPropVO52:UIPropVO;
        public var _PanelLayer_UIPropVO54:UIPropVO;
        public var _PanelLayer_UIPropVO56:UIPropVO;
        public var _PanelLayer_UIPropVO57:UIPropVO;
        public var _PanelLayer_UIPropVO58:UIPropVO;
        public var _PanelLayer_UIPropVO210:UIPropVO;
        public var _PanelLayer_UIPropVO211:UIPropVO;
        public var _PanelLayer_UIPropVO212:UIPropVO;
        public var _PanelLayer_UIPropVO213:UIPropVO;
        public var _PanelLayer_UIPropVO214:UIPropVO;
        public var _PanelLayer_UIPropVO215:UIPropVO;
        public var _PanelLayer_UIPropVO216:UIPropVO;
        public var _PanelLayer_UIPropVO217:UIPropVO;
        public var _PanelLayer_UIPropVO218:UIPropVO;
        public var _PanelLayer_UIPropVO219:UIPropVO;
        public var _PanelLayer_UIPropVO60:UIPropVO;
        public var _PanelLayer_UIPropVO61:UIPropVO;
        public var _PanelLayer_UIPropVO59:UIPropVO;
        public var _PanelLayer_UIPropVO63:UIPropVO;
        public var _PanelLayer_UIPropVO64:UIPropVO;
        public var _PanelLayer_UIPropVO65:UIPropVO;
        public var _PanelLayer_UIPropVO66:UIPropVO;
        public var _PanelLayer_UIPropVO67:UIPropVO;
        public var _PanelLayer_UIPropVO68:UIPropVO;
        public var _PanelLayer_UIPropVO62:UIPropVO;
        public var _PanelLayer_UIPropVO220:UIPropVO;
        public var _PanelLayer_UIPropVO100:UIPropVO;
        public var _PanelLayer_UIPropVO101:UIPropVO;
        public var _PanelLayer_UIPropVO102:UIPropVO;
        public var _PanelLayer_UIPropVO103:UIPropVO;
        public var _PanelLayer_UIPropVO104:UIPropVO;
        public var _PanelLayer_UIPropVO105:UIPropVO;
        public var _PanelLayer_UIPropVO106:UIPropVO;
        public var _PanelLayer_UIPropVO107:UIPropVO;
        public var _PanelLayer_UIPropVO108:UIPropVO;
        public var _PanelLayer_UIPropVO109:UIPropVO;
        public var _PanelLayer_UIPropVO225:UIPropVO;
        public var _PanelLayer_UIPropVO227:UIPropVO;
        public var _PanelLayer_UIPropVO228:UIPropVO;
        public var _PanelLayer_UIPropVO229:UIPropVO;
        public var _PanelLayer_UIPropVO221:UIPropVO;
        public var _PanelLayer_UIPropVO222:UIPropVO;
        public var _PanelLayer_UIPropVO223:UIPropVO;
        public var _PanelLayer_UIPropVO224:UIPropVO;
        public var _PanelLayer_UIPropVO77:UIPropVO;
        public var _PanelLayer_UIPropVO226:UIPropVO;
        public var _PanelLayer_UIPropVO230:UIPropVO;
        public var _PanelLayer_UIPropVO110:UIPropVO;
        public var _PanelLayer_UIPropVO111:UIPropVO;
        public var _PanelLayer_UIPropVO112:UIPropVO;
        public var _PanelLayer_UIPropVO113:UIPropVO;
        public var _PanelLayer_UIPropVO114:UIPropVO;
        public var _PanelLayer_UIPropVO115:UIPropVO;
        public var _PanelLayer_UIPropVO116:UIPropVO;
        public var _PanelLayer_UIPropVO117:UIPropVO;
        public var _PanelLayer_UIPropVO118:UIPropVO;
        public var _PanelLayer_UIPropVO119:UIPropVO;
        public var _PanelLayer_UIPropVO234:UIPropVO;
        public var _PanelLayer_UIPropVO235:UIPropVO;
        public var _PanelLayer_UIPropVO236:UIPropVO;
        public var _PanelLayer_UIPropVO237:UIPropVO;
        public var _PanelLayer_UIPropVO238:UIPropVO;
        public var _PanelLayer_UIPropVO231:UIPropVO;
        public var _PanelLayer_UIPropVO232:UIPropVO;
        public var _PanelLayer_UIPropVO233:UIPropVO;
        public var _PanelLayer_UIPropVO69:UIPropVO;
        public var _PanelLayer_UIPropVO72:UIPropVO;
        public var _PanelLayer_UIPropVO73:UIPropVO;
        public var _PanelLayer_UIPropVO74:UIPropVO;
        public var _PanelLayer_UIPropVO75:UIPropVO;
        public var _PanelLayer_UIPropVO239:UIPropVO;
        public var _PanelLayer_UIPropVO83:UIPropVO;
        public var _PanelLayer_UIPropVO78:UIPropVO;
        public var _PanelLayer_UIPropVO79:UIPropVO;
        public var _PanelLayer_UIPropVO86:UIPropVO;
        public var _PanelLayer_UIPropVO70:UIPropVO;
        public var _PanelLayer_UIPropVO71:UIPropVO;
        public var _PanelLayer_UIPropVO240:UIPropVO;
        public var _PanelLayer_UIPropVO120:UIPropVO;
        public var _PanelLayer_UIPropVO121:UIPropVO;
        public var _PanelLayer_UIPropVO122:UIPropVO;
        public var _PanelLayer_UIPropVO123:UIPropVO;
        public var _PanelLayer_UIPropVO124:UIPropVO;
        public var _PanelLayer_UIPropVO125:UIPropVO;
        public var _PanelLayer_UIPropVO126:UIPropVO;
        public var _PanelLayer_UIPropVO127:UIPropVO;
        public var _PanelLayer_UIPropVO128:UIPropVO;
        public var _PanelLayer_UIPropVO129:UIPropVO;
        public var _PanelLayer_UIPropVO82:UIPropVO;
        public var _PanelLayer_UIPropVO84:UIPropVO;
        public var _PanelLayer_UIPropVO85:UIPropVO;
        public var _PanelLayer_UIPropVO92:UIPropVO;
        public var _PanelLayer_UIPropVO241:UIPropVO;
        public var _PanelLayer_UIPropVO242:UIPropVO;
        public var _PanelLayer_UIPropVO243:UIPropVO;
        public var _PanelLayer_UIPropVO244:UIPropVO;
        public var _PanelLayer_UIPropVO76:UIPropVO;
        public var _PanelLayer_UIPropVO81:UIPropVO;
        public var _PanelLayer_UIPropVO91:UIPropVO;
        public var _PanelLayer_UIPropVO130:UIPropVO;
        public var _PanelLayer_UIPropVO131:UIPropVO;
        public var _PanelLayer_UIPropVO132:UIPropVO;
        public var _PanelLayer_UIPropVO133:UIPropVO;
        public var _PanelLayer_UIPropVO134:UIPropVO;
        public var _PanelLayer_UIPropVO135:UIPropVO;
        public var _PanelLayer_UIPropVO136:UIPropVO;
        public var _PanelLayer_UIPropVO137:UIPropVO;
        public var _PanelLayer_UIPropVO138:UIPropVO;
        public var _PanelLayer_UIPropVO139:UIPropVO;
        public var _PanelLayer_UIPropVO93:UIPropVO;
        public var _PanelLayer_UIPropVO94:UIPropVO;
        public var _PanelLayer_UIPropVO95:UIPropVO;
        public var _PanelLayer_UIPropVO96:UIPropVO;
        public var _PanelLayer_UIPropVO97:UIPropVO;
        public var _PanelLayer_UIPropVO98:UIPropVO;
        public var _PanelLayer_UIPropVO87:UIPropVO;
        public var _PanelLayer_UIPropVO88:UIPropVO;
        public var _PanelLayer_UIPropVO89:UIPropVO;
        public var _PanelLayer_UIPropVO80:UIPropVO;
        public var _PanelLayer_UIPropVO99:UIPropVO;
        public var _PanelLayer_UIPropVO90:UIPropVO;
        public var _PanelLayer_UIPropVO140:UIPropVO;
        public var _PanelLayer_UIPropVO141:UIPropVO;
        public var _PanelLayer_UIPropVO142:UIPropVO;
        public var _PanelLayer_UIPropVO143:UIPropVO;
        public var _PanelLayer_UIPropVO144:UIPropVO;
        public var _PanelLayer_UIPropVO145:UIPropVO;
        public var _PanelLayer_UIPropVO146:UIPropVO;
        public var _PanelLayer_UIPropVO147:UIPropVO;
        public var _PanelLayer_UIPropVO148:UIPropVO;
        public var _PanelLayer_UIPropVO149:UIPropVO;
        public var _PanelLayer_UIPropVO150:UIPropVO;
        public var _PanelLayer_UIPropVO151:UIPropVO;
        public var _PanelLayer_UIPropVO152:UIPropVO;
        public var _PanelLayer_UIPropVO153:UIPropVO;
        public var _PanelLayer_UIPropVO154:UIPropVO;
        public var _PanelLayer_UIPropVO155:UIPropVO;
        public var _PanelLayer_UIPropVO156:UIPropVO;
        public var _PanelLayer_UIPropVO157:UIPropVO;
        public var _PanelLayer_UIPropVO158:UIPropVO;
        public var _PanelLayer_UIPropVO159:UIPropVO;
        public var _PanelLayer_UIPropVO160:UIPropVO;
        public var _PanelLayer_UIPropVO161:UIPropVO;
        public var _PanelLayer_UIPropVO162:UIPropVO;
        public var _PanelLayer_UIPropVO163:UIPropVO;
        public var _PanelLayer_UIPropVO164:UIPropVO;
        public var _PanelLayer_UIPropVO165:UIPropVO;
        public var _PanelLayer_UIPropVO166:UIPropVO;
        public var _PanelLayer_UIPropVO167:UIPropVO;
        public var _PanelLayer_UIPropVO168:UIPropVO;
        public var _PanelLayer_UIPropVO169:UIPropVO;
        public var _PanelLayer_UIPropVO170:UIPropVO;
        public var _PanelLayer_UIPropVO171:UIPropVO;
        public var _PanelLayer_UIPropVO172:UIPropVO;
        public var _PanelLayer_UIPropVO173:UIPropVO;
        public var _PanelLayer_UIPropVO174:UIPropVO;
        public var _PanelLayer_UIPropVO175:UIPropVO;
        public var _PanelLayer_UIPropVO176:UIPropVO;
        public var _PanelLayer_UIPropVO177:UIPropVO;
        public var _PanelLayer_UIPropVO178:UIPropVO;
        public var _PanelLayer_UIPropVO179:UIPropVO;
        public var _PanelLayer_UIPropVO180:UIPropVO;
        public var _PanelLayer_UIPropVO181:UIPropVO;
        public var _PanelLayer_UIPropVO182:UIPropVO;
        public var _PanelLayer_UIPropVO183:UIPropVO;
        public var _PanelLayer_UIPropVO184:UIPropVO;
        public var _PanelLayer_UIPropVO185:UIPropVO;
        public var _PanelLayer_UIPropVO186:UIPropVO;
        public var _PanelLayer_UIPropVO187:UIPropVO;
        public var _PanelLayer_UIPropVO188:UIPropVO;
        public var _PanelLayer_UIPropVO189:UIPropVO;
        public var _PanelLayer_UIPropVO190:UIPropVO;
        public var _PanelLayer_UIPropVO191:UIPropVO;
        public var _PanelLayer_UIPropVO192:UIPropVO;
        public var _PanelLayer_UIPropVO193:UIPropVO;
        public var _PanelLayer_UIPropVO194:UIPropVO;
        public var _PanelLayer_UIPropVO195:UIPropVO;
        public var _PanelLayer_UIPropVO196:UIPropVO;
        public var _PanelLayer_UIPropVO197:UIPropVO;
        public var _PanelLayer_UIPropVO198:UIPropVO;
        public var _PanelLayer_UIPropVO199:UIPropVO;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({"type":UIBase});
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PanelLayer()
        {
            mx_internal::_document = this;
            _PanelLayer_Array1_i();
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PanelLayer._watcherSetupUtil = _arg_1;
        }


        private function _PanelLayer_UIPropVO91_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO91 = _local_1;
            _local_1.name = "邮件通知";
            _local_1.prop = {
                "dx":200,
                "dy":150
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO91", _PanelLayer_UIPropVO91);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO15_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO15 = _local_1;
            _local_1.name = "宠物信息面板";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO15", _PanelLayer_UIPropVO15);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO153_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO153 = _local_1;
            _local_1.name = "宠物天赋背包面板";
            _local_1.prop = {
                "dx":133,
                "dy":64
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO153", _PanelLayer_UIPropVO153);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO199_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO199 = _local_1;
            _local_1.name = "秘境寻宝单买弹窗";
            _local_1.prop = {
                "dx":307,
                "dy":178
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO199", _PanelLayer_UIPropVO199);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO38_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO38 = _local_1;
            _local_1.name = "开宝箱";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO38", _PanelLayer_UIPropVO38);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO176_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO176 = _local_1;
            _local_1.name = "世界杯足球币填充";
            _local_1.prop = {
                "dx":200,
                "dy":100
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO176", _PanelLayer_UIPropVO176);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO26_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO26 = _local_1;
            _local_1.name = "宠物炼化";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO26", _PanelLayer_UIPropVO26);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO49_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO49 = _local_1;
            _local_1.name = "活动面板";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO49", _PanelLayer_UIPropVO49);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO141_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO141 = _local_1;
            _local_1.name = "魔力远征总览面板";
            _local_1.prop = {
                "dx":50,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO141", _PanelLayer_UIPropVO141);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO164_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO164 = _local_1;
            _local_1.name = "草裙DOTA";
            _local_1.prop = {
                "dx":100,
                "dy":30
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO164", _PanelLayer_UIPropVO164);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO130_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO130 = _local_1;
            _local_1.name = "功勋背包面板";
            _local_1.prop = {
                "dx":100,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO130", _PanelLayer_UIPropVO130);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO2_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO2 = _local_1;
            _local_1.name = "商店面板";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO2", _PanelLayer_UIPropVO2);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO187_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO187 = _local_1;
            _local_1.name = "满就减";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO187", _PanelLayer_UIPropVO187);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO209_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO209 = _local_1;
            _local_1.name = "宠物护卫";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO209", _PanelLayer_UIPropVO209);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO90_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO90 = _local_1;
            _local_1.name = "星宫-加速吸收";
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO90", _PanelLayer_UIPropVO90);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO37_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO37 = _local_1;
            _local_1.name = "我的招募";
            _local_1.prop = {
                "dx":100,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO37", _PanelLayer_UIPropVO37);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO152_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO152 = _local_1;
            _local_1.name = "宠物天赋面板";
            _local_1.prop = {
                "dx":123,
                "dy":64
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO152", _PanelLayer_UIPropVO152);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO175_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO175 = _local_1;
            _local_1.name = "积分兑换";
            _local_1.prop = {
                "dx":100,
                "dy":30
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO175", _PanelLayer_UIPropVO175);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO14_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO14 = _local_1;
            _local_1.name = "宠物管理面板";
            _local_1.prop = {
                "dx":80,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO14", _PanelLayer_UIPropVO14);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO198_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO198 = _local_1;
            _local_1.name = "秘境寻宝弹窗";
            _local_1.prop = {
                "dx":307,
                "dy":178
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO198", _PanelLayer_UIPropVO198);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO25_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO25 = _local_1;
            _local_1.name = "制作面板";
            _local_1.prop = {
                "dx":100,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO25", _PanelLayer_UIPropVO25);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO48_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO48 = _local_1;
            _local_1.name = "加血面板";
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO48", _PanelLayer_UIPropVO48);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO140_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO140 = _local_1;
            _local_1.name = "组队跨服战下注面板";
            _local_1.prop = {
                "dx":300,
                "dy":200
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO140", _PanelLayer_UIPropVO140);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO163_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO163 = _local_1;
            _local_1.name = "试炼之地奖励";
            _local_1.prop = {
                "dx":133,
                "dy":64
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO163", _PanelLayer_UIPropVO163);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO186_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO186 = _local_1;
            _local_1.name = "聚划算";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO186", _PanelLayer_UIPropVO186);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO1_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO1 = _local_1;
            _local_1.name = "背包面板";
            _local_1.prop = {
                "dx":300,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO1", _PanelLayer_UIPropVO1);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO208_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO208 = _local_1;
            _local_1.name = "魔物之心";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO208", _PanelLayer_UIPropVO208);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO13_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO13 = _local_1;
            _local_1.name = "角色信息面板";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO13", _PanelLayer_UIPropVO13);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO59_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO59 = _local_1;
            _local_1.name = "生活技能";
            _local_1.prop = {
                "dx":100,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO59", _PanelLayer_UIPropVO59);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO151_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO151 = _local_1;
            _local_1.name = "远征排行榜面板";
            _local_1.prop = {
                "dx":200,
                "dy":100
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO151", _PanelLayer_UIPropVO151);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO174_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO174 = _local_1;
            _local_1.name = "自动副本面板";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO174", _PanelLayer_UIPropVO174);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO197_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO197 = _local_1;
            _local_1.name = "秘境寻宝";
            _local_1.prop = {
                "dx":0,
                "dy":0
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO197", _PanelLayer_UIPropVO197);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO36_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO36 = _local_1;
            _local_1.name = "发布招募";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO36", _PanelLayer_UIPropVO36);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO219_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO219 = _local_1;
            _local_1.name = "暑期游戏九宫格";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO219", _PanelLayer_UIPropVO219);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO24_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO24 = _local_1;
            _local_1.name = "用户设置面板";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO24", _PanelLayer_UIPropVO24);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO162_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO162 = _local_1;
            _local_1.name = "试炼之地";
            _local_1.prop = {
                "dx":133,
                "dy":64
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO162", _PanelLayer_UIPropVO162);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO185_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO185 = _local_1;
            _local_1.name = "聚划算弹框";
            _local_1.prop = {
                "dx":307,
                "dy":178
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO185", _PanelLayer_UIPropVO185);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO47_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO47 = _local_1;
            _local_1.name = "自动挂机";
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO47", _PanelLayer_UIPropVO47);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO109_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO109 = _local_1;
            _local_1.name = "VIP批量洗练面板";
            _local_1.prop = {
                "dx":100,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO109", _PanelLayer_UIPropVO109);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO207_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO207 = _local_1;
            _local_1.name = "魔法方块";
            _local_1.prop = {
                "dx":70,
                "dy":10
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO207", _PanelLayer_UIPropVO207);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO35_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO35 = _local_1;
            _local_1.name = "队伍招募";
            _local_1.prop = {
                "dx":100,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO35", _PanelLayer_UIPropVO35);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO58_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO58 = _local_1;
            _local_1.name = "NPC显示排行榜";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO58", _PanelLayer_UIPropVO58);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO150_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO150 = _local_1;
            _local_1.name = "远征战斗信息面板";
            _local_1.prop = {
                "dx":200,
                "dy":100
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO150", _PanelLayer_UIPropVO150);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO173_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO173 = _local_1;
            _local_1.name = "王族魂器";
            _local_1.prop = {
                "dx":100,
                "dy":30
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO173", _PanelLayer_UIPropVO173);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO12_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO12 = _local_1;
            _local_1.name = "地图面板";
            _local_1.prop = {
                "dx":260,
                "dy":30
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO12", _PanelLayer_UIPropVO12);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO218_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO218 = _local_1;
            _local_1.name = "探险勋章";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO218", _PanelLayer_UIPropVO218);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO196_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO196 = _local_1;
            _local_1.name = "宠物真魂";
            _local_1.prop = {
                "dx":100,
                "dy":30
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO196", _PanelLayer_UIPropVO196);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO46_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO46 = _local_1;
            _local_1.name = "奖励面板";
            _local_1.prop = {
                "dx":300,
                "dy":200
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO46", _PanelLayer_UIPropVO46);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO69_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO69 = _local_1;
            _local_1.name = "跨服战英雄榜";
            _local_1.prop = {
                "dx":100,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO69", _PanelLayer_UIPropVO69);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO161_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO161 = _local_1;
            _local_1.name = "无忧回归面板";
            _local_1.prop = {
                "dx":125,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO161", _PanelLayer_UIPropVO161);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO184_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO184 = _local_1;
            _local_1.name = "炼魂";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO184", _PanelLayer_UIPropVO184);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO23_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO23 = _local_1;
            _local_1.name = "交易面板";
            _local_1.prop = {
                "dx":100,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO23", _PanelLayer_UIPropVO23);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO206_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO206 = _local_1;
            _local_1.name = "称重大师";
            _local_1.prop = {
                "dx":70,
                "dy":10
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO206", _PanelLayer_UIPropVO206);
            return (_local_1);
        }

        private function _PanelLayer_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Class
            {
                return (BagPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO1.cls = _arg_1;
            }, "_PanelLayer_UIPropVO1.cls");
            result[0] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_BAG);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO1.vid = _arg_1;
            }, "_PanelLayer_UIPropVO1.vid");
            result[1] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO1.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO1.initVisible");
            result[2] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO1.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO1.createLater");
            result[3] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ShopPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO2.cls = _arg_1;
            }, "_PanelLayer_UIPropVO2.cls");
            result[4] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_SHOP);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO2.vid = _arg_1;
            }, "_PanelLayer_UIPropVO2.vid");
            result[5] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO2.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO2.initVisible");
            result[6] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO2.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO2.createLater");
            result[7] = binding;
            binding = new Binding(this, function ():Class
            {
                return (AwardPanelAll);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO3.cls = _arg_1;
            }, "_PanelLayer_UIPropVO3.cls");
            result[8] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_AWARD_ALL);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO3.vid = _arg_1;
            }, "_PanelLayer_UIPropVO3.vid");
            result[9] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO3.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO3.initVisible");
            result[10] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO3.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO3.createLater");
            result[11] = binding;
            binding = new Binding(this, function ():Class
            {
                return (BankPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO4.cls = _arg_1;
            }, "_PanelLayer_UIPropVO4.cls");
            result[12] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_BANK);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO4.vid = _arg_1;
            }, "_PanelLayer_UIPropVO4.vid");
            result[13] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO4.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO4.initVisible");
            result[14] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO4.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO4.createLater");
            result[15] = binding;
            binding = new Binding(this, function ():Class
            {
                return (CharactorPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO5.cls = _arg_1;
            }, "_PanelLayer_UIPropVO5.cls");
            result[16] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_CHARACTOR);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO5.vid = _arg_1;
            }, "_PanelLayer_UIPropVO5.vid");
            result[17] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO5.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO5.initVisible");
            result[18] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO5.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO5.createLater");
            result[19] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ChatPanelManager);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO6.cls = _arg_1;
            }, "_PanelLayer_UIPropVO6.cls");
            result[20] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_CHATMANAGER);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO6.vid = _arg_1;
            }, "_PanelLayer_UIPropVO6.vid");
            result[21] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO6.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO6.initVisible");
            result[22] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO6.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO6.createLater");
            result[23] = binding;
            binding = new Binding(this, function ():Class
            {
                return (GuildPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO7.cls = _arg_1;
            }, "_PanelLayer_UIPropVO7.cls");
            result[24] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_GUILD);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO7.vid = _arg_1;
            }, "_PanelLayer_UIPropVO7.vid");
            result[25] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO7.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO7.initVisible");
            result[26] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO7.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO7.createLater");
            result[27] = binding;
            binding = new Binding(this, function ():Class
            {
                return (AddGuildPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO8.cls = _arg_1;
            }, "_PanelLayer_UIPropVO8.cls");
            result[28] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_ADDGUILD);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO8.vid = _arg_1;
            }, "_PanelLayer_UIPropVO8.vid");
            result[29] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO8.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO8.initVisible");
            result[30] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO8.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO8.createLater");
            result[31] = binding;
            binding = new Binding(this, function ():Class
            {
                return (HelpPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO9.cls = _arg_1;
            }, "_PanelLayer_UIPropVO9.cls");
            result[32] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_HELP);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO9.vid = _arg_1;
            }, "_PanelLayer_UIPropVO9.vid");
            result[33] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO9.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO9.initVisible");
            result[34] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO9.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO9.createLater");
            result[35] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MailManagerPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO10.cls = _arg_1;
            }, "_PanelLayer_UIPropVO10.cls");
            result[36] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_MAILMANAGER);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO10.vid = _arg_1;
            }, "_PanelLayer_UIPropVO10.vid");
            result[37] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO10.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO10.initVisible");
            result[38] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO10.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO10.createLater");
            result[39] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MailPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO11.cls = _arg_1;
            }, "_PanelLayer_UIPropVO11.cls");
            result[40] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_MAIL);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO11.vid = _arg_1;
            }, "_PanelLayer_UIPropVO11.vid");
            result[41] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO11.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO11.initVisible");
            result[42] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO11.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO11.createLater");
            result[43] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MapPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO12.cls = _arg_1;
            }, "_PanelLayer_UIPropVO12.cls");
            result[44] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_MAP);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO12.vid = _arg_1;
            }, "_PanelLayer_UIPropVO12.vid");
            result[45] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO12.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO12.initVisible");
            result[46] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO12.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO12.createLater");
            result[47] = binding;
            binding = new Binding(this, function ():Class
            {
                return (CharactorInfoPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO13.cls = _arg_1;
            }, "_PanelLayer_UIPropVO13.cls");
            result[48] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_CHARACTORINFO);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO13.vid = _arg_1;
            }, "_PanelLayer_UIPropVO13.vid");
            result[49] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO13.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO13.initVisible");
            result[50] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO13.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO13.createLater");
            result[51] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PetManagerPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO14.cls = _arg_1;
            }, "_PanelLayer_UIPropVO14.cls");
            result[52] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_PETMANAGER);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO14.vid = _arg_1;
            }, "_PanelLayer_UIPropVO14.vid");
            result[53] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO14.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO14.initVisible");
            result[54] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO14.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO14.createLater");
            result[55] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PetPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO15.cls = _arg_1;
            }, "_PanelLayer_UIPropVO15.cls");
            result[56] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_PET);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO15.vid = _arg_1;
            }, "_PanelLayer_UIPropVO15.vid");
            result[57] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO15.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO15.initVisible");
            result[58] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO15.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO15.createLater");
            result[59] = binding;
            binding = new Binding(this, function ():Class
            {
                return (NpcFuncPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO16.cls = _arg_1;
            }, "_PanelLayer_UIPropVO16.cls");
            result[60] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_NPCFUNC);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO16.vid = _arg_1;
            }, "_PanelLayer_UIPropVO16.vid");
            result[61] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO16.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO16.initVisible");
            result[62] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO16.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO16.createLater");
            result[63] = binding;
            binding = new Binding(this, function ():Class
            {
                return (NpcFuncOther);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO17.cls = _arg_1;
            }, "_PanelLayer_UIPropVO17.cls");
            result[64] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_NPCFUNCOTHER);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO17.vid = _arg_1;
            }, "_PanelLayer_UIPropVO17.vid");
            result[65] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO17.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO17.initVisible");
            result[66] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO17.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO17.createLater");
            result[67] = binding;
            binding = new Binding(this, function ():Class
            {
                return (NpcScriptPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO18.cls = _arg_1;
            }, "_PanelLayer_UIPropVO18.cls");
            result[68] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_NPCSCRIPT);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO18.vid = _arg_1;
            }, "_PanelLayer_UIPropVO18.vid");
            result[69] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO18.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO18.initVisible");
            result[70] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO18.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO18.createLater");
            result[71] = binding;
            binding = new Binding(this, function ():Class
            {
                return (QuestPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO19.cls = _arg_1;
            }, "_PanelLayer_UIPropVO19.cls");
            result[72] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_QUEST);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO19.vid = _arg_1;
            }, "_PanelLayer_UIPropVO19.vid");
            result[73] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO19.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO19.initVisible");
            result[74] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO19.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO19.createLater");
            result[75] = binding;
            binding = new Binding(this, function ():Class
            {
                return (QuestManager);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO20.cls = _arg_1;
            }, "_PanelLayer_UIPropVO20.cls");
            result[76] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_QUESTMANAGER);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO20.vid = _arg_1;
            }, "_PanelLayer_UIPropVO20.vid");
            result[77] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO20.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO20.initVisible");
            result[78] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO20.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO20.createLater");
            result[79] = binding;
            binding = new Binding(this, function ():Class
            {
                return (SkillManager);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO21.cls = _arg_1;
            }, "_PanelLayer_UIPropVO21.cls");
            result[80] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_SKILLMANAGER);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO21.vid = _arg_1;
            }, "_PanelLayer_UIPropVO21.vid");
            result[81] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO21.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO21.initVisible");
            result[82] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO21.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO21.createLater");
            result[83] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TextPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO22.cls = _arg_1;
            }, "_PanelLayer_UIPropVO22.cls");
            result[84] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_TXT);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO22.vid = _arg_1;
            }, "_PanelLayer_UIPropVO22.vid");
            result[85] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO22.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO22.initVisible");
            result[86] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO22.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO22.createLater");
            result[87] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TradePanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO23.cls = _arg_1;
            }, "_PanelLayer_UIPropVO23.cls");
            result[88] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_TRADE);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO23.vid = _arg_1;
            }, "_PanelLayer_UIPropVO23.vid");
            result[89] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO23.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO23.initVisible");
            result[90] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO23.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO23.createLater");
            result[91] = binding;
            binding = new Binding(this, function ():Class
            {
                return (UserSystemSetPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO24.cls = _arg_1;
            }, "_PanelLayer_UIPropVO24.cls");
            result[92] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_SYSTEM);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO24.vid = _arg_1;
            }, "_PanelLayer_UIPropVO24.vid");
            result[93] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO24.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO24.initVisible");
            result[94] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO24.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO24.createLater");
            result[95] = binding;
            binding = new Binding(this, function ():Class
            {
                return (EquiptFuncPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO25.cls = _arg_1;
            }, "_PanelLayer_UIPropVO25.cls");
            result[96] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_EQUIPTFUNC);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO25.vid = _arg_1;
            }, "_PanelLayer_UIPropVO25.vid");
            result[97] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO25.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO25.initVisible");
            result[98] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO25.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO25.createLater");
            result[99] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PetFuncPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO26.cls = _arg_1;
            }, "_PanelLayer_UIPropVO26.cls");
            result[100] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_PETFUNC);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO26.vid = _arg_1;
            }, "_PanelLayer_UIPropVO26.vid");
            result[101] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO26.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO26.initVisible");
            result[102] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO26.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO26.createLater");
            result[103] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PetAdvancedPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO27.cls = _arg_1;
            }, "_PanelLayer_UIPropVO27.cls");
            result[104] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_PETADVANCED);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO27.vid = _arg_1;
            }, "_PanelLayer_UIPropVO27.vid");
            result[105] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO27.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO27.initVisible");
            result[106] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO27.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO27.createLater");
            result[107] = binding;
            binding = new Binding(this, function ():Class
            {
                return (SkillLearningPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO28.cls = _arg_1;
            }, "_PanelLayer_UIPropVO28.cls");
            result[108] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_LEARNSKILL);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO28.vid = _arg_1;
            }, "_PanelLayer_UIPropVO28.vid");
            result[109] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO28.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO28.initVisible");
            result[110] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO28.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO28.createLater");
            result[111] = binding;
            binding = new Binding(this, function ():Class
            {
                return (AuctionPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO29.cls = _arg_1;
            }, "_PanelLayer_UIPropVO29.cls");
            result[112] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_AUCTION);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO29.vid = _arg_1;
            }, "_PanelLayer_UIPropVO29.vid");
            result[113] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO29.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO29.initVisible");
            result[114] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO29.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO29.createLater");
            result[115] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PMAuctionPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO30.cls = _arg_1;
            }, "_PanelLayer_UIPropVO30.cls");
            result[116] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_PM_AUCTION);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO30.vid = _arg_1;
            }, "_PanelLayer_UIPropVO30.vid");
            result[117] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO30.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO30.initVisible");
            result[118] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO30.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO30.createLater");
            result[119] = binding;
            binding = new Binding(this, function ():Class
            {
                return (IMPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO31.cls = _arg_1;
            }, "_PanelLayer_UIPropVO31.cls");
            result[120] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_IM);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO31.vid = _arg_1;
            }, "_PanelLayer_UIPropVO31.vid");
            result[121] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO31.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO31.initVisible");
            result[122] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO31.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO31.createLater");
            result[123] = binding;
            binding = new Binding(this, function ():Class
            {
                return (SystemShopPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO32.cls = _arg_1;
            }, "_PanelLayer_UIPropVO32.cls");
            result[124] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_SYSTEM_SHOP);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO32.vid = _arg_1;
            }, "_PanelLayer_UIPropVO32.vid");
            result[125] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO32.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO32.initVisible");
            result[126] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO32.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO32.createLater");
            result[127] = binding;
            binding = new Binding(this, function ():Class
            {
                return (SystemShopTrolleyPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO33.cls = _arg_1;
            }, "_PanelLayer_UIPropVO33.cls");
            result[128] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_SYSTEM_SHOP_TROLLEY);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO33.vid = _arg_1;
            }, "_PanelLayer_UIPropVO33.vid");
            result[129] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO33.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO33.initVisible");
            result[130] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO33.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO33.createLater");
            result[131] = binding;
            binding = new Binding(this, function ():Class
            {
                return (GroupPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO34.cls = _arg_1;
            }, "_PanelLayer_UIPropVO34.cls");
            result[132] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_GROUP);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO34.vid = _arg_1;
            }, "_PanelLayer_UIPropVO34.vid");
            result[133] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO34.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO34.initVisible");
            result[134] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO34.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO34.createLater");
            result[135] = binding;
            binding = new Binding(this, function ():Class
            {
                return (GroupRecruitPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO35.cls = _arg_1;
            }, "_PanelLayer_UIPropVO35.cls");
            result[136] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_GROUP_RECRUIT);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO35.vid = _arg_1;
            }, "_PanelLayer_UIPropVO35.vid");
            result[137] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO35.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO35.initVisible");
            result[138] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO35.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO35.createLater");
            result[139] = binding;
            binding = new Binding(this, function ():Class
            {
                return (GroupRecruitNewPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO36.cls = _arg_1;
            }, "_PanelLayer_UIPropVO36.cls");
            result[140] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_GROUP_RECRUIT_NEW);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO36.vid = _arg_1;
            }, "_PanelLayer_UIPropVO36.vid");
            result[141] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO36.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO36.initVisible");
            result[142] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO36.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO36.createLater");
            result[143] = binding;
            binding = new Binding(this, function ():Class
            {
                return (GroupRecruitDetailPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO37.cls = _arg_1;
            }, "_PanelLayer_UIPropVO37.cls");
            result[144] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_GROUP_RECRUIT_DETAIL);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO37.vid = _arg_1;
            }, "_PanelLayer_UIPropVO37.vid");
            result[145] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO37.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO37.initVisible");
            result[146] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO37.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO37.createLater");
            result[147] = binding;
            binding = new Binding(this, function ():Class
            {
                return (Treasure);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO38.cls = _arg_1;
            }, "_PanelLayer_UIPropVO38.cls");
            result[148] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_TREASURE);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO38.vid = _arg_1;
            }, "_PanelLayer_UIPropVO38.vid");
            result[149] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO38.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO38.initVisible");
            result[150] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO38.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO38.createLater");
            result[151] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ExchangePanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO39.cls = _arg_1;
            }, "_PanelLayer_UIPropVO39.cls");
            result[152] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_EXCHANGE);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO39.vid = _arg_1;
            }, "_PanelLayer_UIPropVO39.vid");
            result[153] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO39.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO39.initVisible");
            result[154] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO39.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO39.createLater");
            result[155] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ProductPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO40.cls = _arg_1;
            }, "_PanelLayer_UIPropVO40.cls");
            result[156] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_PRODUCT);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO40.vid = _arg_1;
            }, "_PanelLayer_UIPropVO40.vid");
            result[157] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO40.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO40.initVisible");
            result[158] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO40.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO40.createLater");
            result[159] = binding;
            binding = new Binding(this, function ():Class
            {
                return (BattleSettingPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO41.cls = _arg_1;
            }, "_PanelLayer_UIPropVO41.cls");
            result[160] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_BATTLESET);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO41.vid = _arg_1;
            }, "_PanelLayer_UIPropVO41.vid");
            result[161] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO41.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO41.initVisible");
            result[162] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO41.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO41.createLater");
            result[163] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TitleSelectPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO42.cls = _arg_1;
            }, "_PanelLayer_UIPropVO42.cls");
            result[164] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_TITLE);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO42.vid = _arg_1;
            }, "_PanelLayer_UIPropVO42.vid");
            result[165] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO42.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO42.initVisible");
            result[166] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO42.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO42.createLater");
            result[167] = binding;
            binding = new Binding(this, function ():Class
            {
                return (CallBoardPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO43.cls = _arg_1;
            }, "_PanelLayer_UIPropVO43.cls");
            result[168] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_CALLBOARD);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO43.vid = _arg_1;
            }, "_PanelLayer_UIPropVO43.vid");
            result[169] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO43.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO43.initVisible");
            result[170] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO43.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO43.createLater");
            result[171] = binding;
            binding = new Binding(this, function ():Class
            {
                return (AnswerPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO44.cls = _arg_1;
            }, "_PanelLayer_UIPropVO44.cls");
            result[172] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_ANSWER);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO44.vid = _arg_1;
            }, "_PanelLayer_UIPropVO44.vid");
            result[173] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO44.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO44.initVisible");
            result[174] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO44.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO44.createLater");
            result[175] = binding;
            binding = new Binding(this, function ():Class
            {
                return (AutoBattleCanvas);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO45.cls = _arg_1;
            }, "_PanelLayer_UIPropVO45.cls");
            result[176] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_BATTLEAUTO);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO45.vid = _arg_1;
            }, "_PanelLayer_UIPropVO45.vid");
            result[177] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO45.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO45.initVisible");
            result[178] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO45.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO45.createLater");
            result[179] = binding;
            binding = new Binding(this, function ():Class
            {
                return (AwardPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO46.cls = _arg_1;
            }, "_PanelLayer_UIPropVO46.cls");
            result[180] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_AWARD);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO46.vid = _arg_1;
            }, "_PanelLayer_UIPropVO46.vid");
            result[181] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO46.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO46.initVisible");
            result[182] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO46.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO46.createLater");
            result[183] = binding;
            binding = new Binding(this, function ():Class
            {
                return (AutoExpPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO47.cls = _arg_1;
            }, "_PanelLayer_UIPropVO47.cls");
            result[184] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.MAIN_AUTO_EXP);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO47.vid = _arg_1;
            }, "_PanelLayer_UIPropVO47.vid");
            result[185] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO47.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO47.initVisible");
            result[186] = binding;
            binding = new Binding(this, function ():Class
            {
                return (BloodAddPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO48.cls = _arg_1;
            }, "_PanelLayer_UIPropVO48.cls");
            result[187] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_BLOODADD);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO48.vid = _arg_1;
            }, "_PanelLayer_UIPropVO48.vid");
            result[188] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO48.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO48.initVisible");
            result[189] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ActivePanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO49.cls = _arg_1;
            }, "_PanelLayer_UIPropVO49.cls");
            result[190] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_ACTIVE);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO49.vid = _arg_1;
            }, "_PanelLayer_UIPropVO49.vid");
            result[191] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO49.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO49.initVisible");
            result[192] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO49.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO49.createLater");
            result[193] = binding;
            binding = new Binding(this, function ():Class
            {
                return (GuildContribPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO50.cls = _arg_1;
            }, "_PanelLayer_UIPropVO50.cls");
            result[194] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_GUILDCONTRIB);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO50.vid = _arg_1;
            }, "_PanelLayer_UIPropVO50.vid");
            result[195] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO50.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO50.initVisible");
            result[196] = binding;
            binding = new Binding(this, function ():Class
            {
                return (GuildWarehousePanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO51.cls = _arg_1;
            }, "_PanelLayer_UIPropVO51.cls");
            result[197] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_GUILDWAREHOUSE);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO51.vid = _arg_1;
            }, "_PanelLayer_UIPropVO51.vid");
            result[198] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO51.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO51.initVisible");
            result[199] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ConstructionManager);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO52.cls = _arg_1;
            }, "_PanelLayer_UIPropVO52.cls");
            result[200] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_CONSTRUCTIONMANAGER);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO52.vid = _arg_1;
            }, "_PanelLayer_UIPropVO52.vid");
            result[201] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO52.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO52.initVisible");
            result[202] = binding;
            binding = new Binding(this, function ():Class
            {
                return (BuildInfoPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO53.cls = _arg_1;
            }, "_PanelLayer_UIPropVO53.cls");
            result[203] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_BUILDINFO);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO53.vid = _arg_1;
            }, "_PanelLayer_UIPropVO53.vid");
            result[204] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO53.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO53.initVisible");
            result[205] = binding;
            binding = new Binding(this, function ():Class
            {
                return (GuildSkillDevPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO54.cls = _arg_1;
            }, "_PanelLayer_UIPropVO54.cls");
            result[206] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_GUILD_SKILL_DEV);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO54.vid = _arg_1;
            }, "_PanelLayer_UIPropVO54.vid");
            result[207] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO54.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO54.initVisible");
            result[208] = binding;
            binding = new Binding(this, function ():Class
            {
                return (GuildBuildProcess);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO55.cls = _arg_1;
            }, "_PanelLayer_UIPropVO55.cls");
            result[209] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_BUILDPROCESS);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO55.vid = _arg_1;
            }, "_PanelLayer_UIPropVO55.vid");
            result[210] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO55.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO55.initVisible");
            result[211] = binding;
            binding = new Binding(this, function ():Class
            {
                return (GuildHelpPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO56.cls = _arg_1;
            }, "_PanelLayer_UIPropVO56.cls");
            result[212] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_GUILDHELP);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO56.vid = _arg_1;
            }, "_PanelLayer_UIPropVO56.vid");
            result[213] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO56.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO56.initVisible");
            result[214] = binding;
            binding = new Binding(this, function ():Class
            {
                return (NpcShowMsgPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO57.cls = _arg_1;
            }, "_PanelLayer_UIPropVO57.cls");
            result[215] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_NPCSHOWMSG);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO57.vid = _arg_1;
            }, "_PanelLayer_UIPropVO57.vid");
            result[216] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO57.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO57.initVisible");
            result[217] = binding;
            binding = new Binding(this, function ():Class
            {
                return (NpcShowRankPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO58.cls = _arg_1;
            }, "_PanelLayer_UIPropVO58.cls");
            result[218] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_NPCSHOWRANK);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO58.vid = _arg_1;
            }, "_PanelLayer_UIPropVO58.vid");
            result[219] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO58.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO58.initVisible");
            result[220] = binding;
            binding = new Binding(this, function ():Class
            {
                return (LifeSkillPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO59.cls = _arg_1;
            }, "_PanelLayer_UIPropVO59.cls");
            result[221] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_LIFESKILL);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO59.vid = _arg_1;
            }, "_PanelLayer_UIPropVO59.vid");
            result[222] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO59.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO59.initVisible");
            result[223] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO59.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO59.createLater");
            result[224] = binding;
            binding = new Binding(this, function ():Class
            {
                return (LottoPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO60.cls = _arg_1;
            }, "_PanelLayer_UIPropVO60.cls");
            result[225] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_LOTTO);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO60.vid = _arg_1;
            }, "_PanelLayer_UIPropVO60.vid");
            result[226] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO60.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO60.initVisible");
            result[227] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO60.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO60.createLater");
            result[228] = binding;
            binding = new Binding(this, function ():Class
            {
                return (LottoBagPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO61.cls = _arg_1;
            }, "_PanelLayer_UIPropVO61.cls");
            result[229] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_LOTTO_BAG);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO61.vid = _arg_1;
            }, "_PanelLayer_UIPropVO61.vid");
            result[230] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO61.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO61.initVisible");
            result[231] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO61.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO61.createLater");
            result[232] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TemporaryBagPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO62.cls = _arg_1;
            }, "_PanelLayer_UIPropVO62.cls");
            result[233] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_TEMPORARY_BAG);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO62.vid = _arg_1;
            }, "_PanelLayer_UIPropVO62.vid");
            result[234] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO62.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO62.initVisible");
            result[235] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO62.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO62.createLater");
            result[236] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ChangeColorPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO63.cls = _arg_1;
            }, "_PanelLayer_UIPropVO63.cls");
            result[237] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_CHANGE_COLOR);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO63.vid = _arg_1;
            }, "_PanelLayer_UIPropVO63.vid");
            result[238] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO63.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO63.initVisible");
            result[239] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO63.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO63.createLater");
            result[240] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ChangeWingColorPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO64.cls = _arg_1;
            }, "_PanelLayer_UIPropVO64.cls");
            result[241] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_WING_COLOR);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO64.vid = _arg_1;
            }, "_PanelLayer_UIPropVO64.vid");
            result[242] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO64.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO64.initVisible");
            result[243] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO64.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO64.createLater");
            result[244] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MarriageManagerPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO65.cls = _arg_1;
            }, "_PanelLayer_UIPropVO65.cls");
            result[245] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_MARRIAGE);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO65.vid = _arg_1;
            }, "_PanelLayer_UIPropVO65.vid");
            result[246] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO65.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO65.initVisible");
            result[247] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO65.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO65.createLater");
            result[248] = binding;
            binding = new Binding(this, function ():Class
            {
                return (WeddingBookPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO66.cls = _arg_1;
            }, "_PanelLayer_UIPropVO66.cls");
            result[249] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_WEDDING_BOOK);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO66.vid = _arg_1;
            }, "_PanelLayer_UIPropVO66.vid");
            result[250] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO66.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO66.initVisible");
            result[251] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO66.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO66.createLater");
            result[252] = binding;
            binding = new Binding(this, function ():Class
            {
                return (AchievementPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO67.cls = _arg_1;
            }, "_PanelLayer_UIPropVO67.cls");
            result[253] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_ACHIEVE);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO67.vid = _arg_1;
            }, "_PanelLayer_UIPropVO67.vid");
            result[254] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO67.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO67.initVisible");
            result[0xFF] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO67.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO67.createLater");
            result[0x0100] = binding;
            binding = new Binding(this, function ():Class
            {
                return (AchievementComparePanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO68.cls = _arg_1;
            }, "_PanelLayer_UIPropVO68.cls");
            result[0x0101] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_ACHIEVE_WATCHING);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO68.vid = _arg_1;
            }, "_PanelLayer_UIPropVO68.vid");
            result[258] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO68.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO68.initVisible");
            result[259] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO68.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO68.createLater");
            result[260] = binding;
            binding = new Binding(this, function ():Class
            {
                return (CrossBattleRank);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO69.cls = _arg_1;
            }, "_PanelLayer_UIPropVO69.cls");
            result[261] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_CROSS_BATTLE_RANK);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO69.vid = _arg_1;
            }, "_PanelLayer_UIPropVO69.vid");
            result[262] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO69.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO69.initVisible");
            result[263] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO69.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO69.createLater");
            result[264] = binding;
            binding = new Binding(this, function ():Class
            {
                return (GameIntroPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO70.cls = _arg_1;
            }, "_PanelLayer_UIPropVO70.cls");
            result[265] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_GAMEINTRO);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO70.vid = _arg_1;
            }, "_PanelLayer_UIPropVO70.vid");
            result[266] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO70.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO70.initVisible");
            result[267] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO70.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO70.createLater");
            result[268] = binding;
            binding = new Binding(this, function ():Class
            {
                return (DailyActPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO71.cls = _arg_1;
            }, "_PanelLayer_UIPropVO71.cls");
            result[269] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.DAILY_ACTIVITY);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO71.vid = _arg_1;
            }, "_PanelLayer_UIPropVO71.vid");
            result[270] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO71.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO71.initVisible");
            result[271] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO71.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO71.createLater");
            result[272] = binding;
            binding = new Binding(this, function ():Class
            {
                return (WingFuncPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO72.cls = _arg_1;
            }, "_PanelLayer_UIPropVO72.cls");
            result[273] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_WING_FUNC);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO72.vid = _arg_1;
            }, "_PanelLayer_UIPropVO72.vid");
            result[274] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO72.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO72.initVisible");
            result[275] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO72.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO72.createLater");
            result[276] = binding;
            binding = new Binding(this, function ():Class
            {
                return (FairyManagerPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO73.cls = _arg_1;
            }, "_PanelLayer_UIPropVO73.cls");
            result[277] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_FAIRY_MANAGER);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO73.vid = _arg_1;
            }, "_PanelLayer_UIPropVO73.vid");
            result[278] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO73.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO73.initVisible");
            result[279] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO73.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO73.createLater");
            result[280] = binding;
            binding = new Binding(this, function ():Class
            {
                return (WingAdvancedPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO74.cls = _arg_1;
            }, "_PanelLayer_UIPropVO74.cls");
            result[281] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_WING_ADVANCED);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO74.vid = _arg_1;
            }, "_PanelLayer_UIPropVO74.vid");
            result[282] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO74.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO74.initVisible");
            result[283] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO74.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO74.createLater");
            result[284] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TempBagSlot);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO75.cls = _arg_1;
            }, "_PanelLayer_UIPropVO75.cls");
            result[285] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.POP_TEMP_BAG_SLOT);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO75.vid = _arg_1;
            }, "_PanelLayer_UIPropVO75.vid");
            result[286] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO75.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO75.initVisible");
            result[287] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO75.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO75.createLater");
            result[288] = binding;
            binding = new Binding(this, function ():Class
            {
                return (DetailPropPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO76.cls = _arg_1;
            }, "_PanelLayer_UIPropVO76.cls");
            result[289] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.DETAIL_PROP_PANEL);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO76.vid = _arg_1;
            }, "_PanelLayer_UIPropVO76.vid");
            result[290] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO76.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO76.initVisible");
            result[291] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO76.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO76.createLater");
            result[292] = binding;
            binding = new Binding(this, function ():Class
            {
                return (DetailPropPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO77.cls = _arg_1;
            }, "_PanelLayer_UIPropVO77.cls");
            result[293] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.DETAIL_PROP_PANEL_PET);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO77.vid = _arg_1;
            }, "_PanelLayer_UIPropVO77.vid");
            result[294] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO77.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO77.initVisible");
            result[295] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO77.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO77.createLater");
            result[296] = binding;
            binding = new Binding(this, function ():Class
            {
                return (QuestioningPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO78.cls = _arg_1;
            }, "_PanelLayer_UIPropVO78.cls");
            result[297] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_QUESTIONING);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO78.vid = _arg_1;
            }, "_PanelLayer_UIPropVO78.vid");
            result[298] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO78.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO78.initVisible");
            result[299] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO78.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO78.createLater");
            result[300] = binding;
            binding = new Binding(this, function ():Class
            {
                return (QxWishesPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO79.cls = _arg_1;
            }, "_PanelLayer_UIPropVO79.cls");
            result[301] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_SHOW_LOVE);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO79.vid = _arg_1;
            }, "_PanelLayer_UIPropVO79.vid");
            result[302] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO79.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO79.initVisible");
            result[303] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO79.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO79.createLater");
            result[304] = binding;
            binding = new Binding(this, function ():Class
            {
                return (VDAYPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO80.cls = _arg_1;
            }, "_PanelLayer_UIPropVO80.cls");
            result[305] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_VDAY);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO80.vid = _arg_1;
            }, "_PanelLayer_UIPropVO80.vid");
            result[306] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO80.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO80.initVisible");
            result[307] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO80.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO80.createLater");
            result[308] = binding;
            binding = new Binding(this, function ():Class
            {
                return (FazendaPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO81.cls = _arg_1;
            }, "_PanelLayer_UIPropVO81.cls");
            result[309] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_FAZENDA);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO81.vid = _arg_1;
            }, "_PanelLayer_UIPropVO81.vid");
            result[310] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO81.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO81.initVisible");
            result[311] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO81.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO81.createLater");
            result[312] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PetFightConf);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO82.cls = _arg_1;
            }, "_PanelLayer_UIPropVO82.cls");
            result[313] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_PETFIGHT_CONF);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO82.vid = _arg_1;
            }, "_PanelLayer_UIPropVO82.vid");
            result[314] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO82.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO82.initVisible");
            result[315] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO82.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO82.createLater");
            result[316] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PetArenaPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO83.cls = _arg_1;
            }, "_PanelLayer_UIPropVO83.cls");
            result[317] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_PET_ARENA);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO83.vid = _arg_1;
            }, "_PanelLayer_UIPropVO83.vid");
            result[318] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO83.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO83.initVisible");
            result[319] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO83.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO83.createLater");
            result[320] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PetArenaRankPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO84.cls = _arg_1;
            }, "_PanelLayer_UIPropVO84.cls");
            result[321] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_PET_ARENA_RANK);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO84.vid = _arg_1;
            }, "_PanelLayer_UIPropVO84.vid");
            result[322] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO84.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO84.initVisible");
            result[323] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO84.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO84.createLater");
            result[324] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PetArenaPrevRankPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO85.cls = _arg_1;
            }, "_PanelLayer_UIPropVO85.cls");
            result[325] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_PET_ARENA_PREV_RANK);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO85.vid = _arg_1;
            }, "_PanelLayer_UIPropVO85.vid");
            result[326] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO85.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO85.initVisible");
            result[327] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO85.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO85.createLater");
            result[328] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MultiItemPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO86.cls = _arg_1;
            }, "_PanelLayer_UIPropVO86.cls");
            result[329] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_MULITI_ITEM);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO86.vid = _arg_1;
            }, "_PanelLayer_UIPropVO86.vid");
            result[330] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO86.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO86.initVisible");
            result[331] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO86.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO86.createLater");
            result[332] = binding;
            binding = new Binding(this, function ():Class
            {
                return (AddictEnterPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO87.cls = _arg_1;
            }, "_PanelLayer_UIPropVO87.cls");
            result[333] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.MAIN_ADDICT_INFO);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO87.vid = _arg_1;
            }, "_PanelLayer_UIPropVO87.vid");
            result[334] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO87.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO87.initVisible");
            result[335] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO87.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO87.createLater");
            result[336] = binding;
            binding = new Binding(this, function ():Class
            {
                return (StarAdditionPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO88.cls = _arg_1;
            }, "_PanelLayer_UIPropVO88.cls");
            result[337] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_STAR_ADDITION);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO88.vid = _arg_1;
            }, "_PanelLayer_UIPropVO88.vid");
            result[338] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO88.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO88.initVisible");
            result[339] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO88.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO88.createLater");
            result[340] = binding;
            binding = new Binding(this, function ():Class
            {
                return (StarEffectPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO89.cls = _arg_1;
            }, "_PanelLayer_UIPropVO89.cls");
            result[341] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_STAR_EFFECT);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO89.vid = _arg_1;
            }, "_PanelLayer_UIPropVO89.vid");
            result[342] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO89.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO89.initVisible");
            result[343] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO89.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO89.createLater");
            result[344] = binding;
            binding = new Binding(this, function ():Class
            {
                return (StarSpeedUpPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO90.cls = _arg_1;
            }, "_PanelLayer_UIPropVO90.cls");
            result[345] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_STAR_SPEED_UP);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO90.vid = _arg_1;
            }, "_PanelLayer_UIPropVO90.vid");
            result[346] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO90.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO90.initVisible");
            result[347] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO90.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO90.createLater");
            result[348] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MailNoticePanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO91.cls = _arg_1;
            }, "_PanelLayer_UIPropVO91.cls");
            result[349] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_MAIL_NOTICE);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO91.vid = _arg_1;
            }, "_PanelLayer_UIPropVO91.vid");
            result[350] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO91.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO91.initVisible");
            result[351] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO91.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO91.createLater");
            result[352] = binding;
            binding = new Binding(this, function ():Class
            {
                return (WbResult);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO92.cls = _arg_1;
            }, "_PanelLayer_UIPropVO92.cls");
            result[353] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_WB_RESULT);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO92.vid = _arg_1;
            }, "_PanelLayer_UIPropVO92.vid");
            result[354] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO92.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO92.initVisible");
            result[355] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO92.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO92.createLater");
            result[356] = binding;
            binding = new Binding(this, function ():Class
            {
                return (WbTimerCanvas);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO93.cls = _arg_1;
            }, "_PanelLayer_UIPropVO93.cls");
            result[357] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_WB_TIMER);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO93.vid = _arg_1;
            }, "_PanelLayer_UIPropVO93.vid");
            result[358] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO93.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO93.initVisible");
            result[359] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO93.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO93.createLater");
            result[360] = binding;
            binding = new Binding(this, function ():Class
            {
                return (WelfarePanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO94.cls = _arg_1;
            }, "_PanelLayer_UIPropVO94.cls");
            result[361] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_WELFARE);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO94.vid = _arg_1;
            }, "_PanelLayer_UIPropVO94.vid");
            result[362] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO94.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO94.initVisible");
            result[363] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO94.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO94.createLater");
            result[364] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TaskSweepPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO95.cls = _arg_1;
            }, "_PanelLayer_UIPropVO95.cls");
            result[365] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_TASKSWEEP);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO95.vid = _arg_1;
            }, "_PanelLayer_UIPropVO95.vid");
            result[366] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO95.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO95.initVisible");
            result[367] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO95.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO95.createLater");
            result[368] = binding;
            binding = new Binding(this, function ():Class
            {
                return (NewServerActPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO96.cls = _arg_1;
            }, "_PanelLayer_UIPropVO96.cls");
            result[369] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_NEWSERVER);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO96.vid = _arg_1;
            }, "_PanelLayer_UIPropVO96.vid");
            result[370] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO96.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO96.initVisible");
            result[371] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO96.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO96.createLater");
            result[372] = binding;
            binding = new Binding(this, function ():Class
            {
                return (NineBossPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO97.cls = _arg_1;
            }, "_PanelLayer_UIPropVO97.cls");
            result[373] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.NINE_BOSS_PANEL);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO97.vid = _arg_1;
            }, "_PanelLayer_UIPropVO97.vid");
            result[374] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO97.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO97.initVisible");
            result[375] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO97.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO97.createLater");
            result[376] = binding;
            binding = new Binding(this, function ():Class
            {
                return (SendCombineActPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO98.cls = _arg_1;
            }, "_PanelLayer_UIPropVO98.cls");
            result[377] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_SENDCOMBINE);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO98.vid = _arg_1;
            }, "_PanelLayer_UIPropVO98.vid");
            result[378] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO98.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO98.initVisible");
            result[379] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO98.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO98.createLater");
            result[380] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PetSoulPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO99.cls = _arg_1;
            }, "_PanelLayer_UIPropVO99.cls");
            result[381] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_PET_SOUL);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO99.vid = _arg_1;
            }, "_PanelLayer_UIPropVO99.vid");
            result[382] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO99.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO99.initVisible");
            result[383] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO99.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO99.createLater");
            result[384] = binding;
            binding = new Binding(this, function ():Class
            {
                return (SoulExpPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO100.cls = _arg_1;
            }, "_PanelLayer_UIPropVO100.cls");
            result[385] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_SOUL_EXP);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO100.vid = _arg_1;
            }, "_PanelLayer_UIPropVO100.vid");
            result[386] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO100.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO100.initVisible");
            result[387] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO100.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO100.createLater");
            result[388] = binding;
            binding = new Binding(this, function ():Class
            {
                return (CardGamePanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO101.cls = _arg_1;
            }, "_PanelLayer_UIPropVO101.cls");
            result[389] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_CARDGAME);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO101.vid = _arg_1;
            }, "_PanelLayer_UIPropVO101.vid");
            result[390] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO101.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO101.initVisible");
            result[391] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO101.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO101.createLater");
            result[392] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PmPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO102.cls = _arg_1;
            }, "_PanelLayer_UIPropVO102.cls");
            result[393] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_PM);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO102.vid = _arg_1;
            }, "_PanelLayer_UIPropVO102.vid");
            result[394] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO102.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO102.initVisible");
            result[395] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO102.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO102.createLater");
            result[396] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PmInfoPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO103.cls = _arg_1;
            }, "_PanelLayer_UIPropVO103.cls");
            result[397] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_PM_INFO);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO103.vid = _arg_1;
            }, "_PanelLayer_UIPropVO103.vid");
            result[398] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO103.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO103.initVisible");
            result[399] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO103.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO103.createLater");
            result[400] = binding;
            binding = new Binding(this, function ():Class
            {
                return (JewelExchagePanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO104.cls = _arg_1;
            }, "_PanelLayer_UIPropVO104.cls");
            result[401] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_JEWEL_EXCHANGE);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO104.vid = _arg_1;
            }, "_PanelLayer_UIPropVO104.vid");
            result[402] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO104.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO104.initVisible");
            result[403] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO104.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO104.createLater");
            result[404] = binding;
            binding = new Binding(this, function ():Class
            {
                return (VipShopPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO105.cls = _arg_1;
            }, "_PanelLayer_UIPropVO105.cls");
            result[405] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_VIP_SHOP);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO105.vid = _arg_1;
            }, "_PanelLayer_UIPropVO105.vid");
            result[406] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO105.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO105.initVisible");
            result[407] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO105.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO105.createLater");
            result[408] = binding;
            binding = new Binding(this, function ():Class
            {
                return (LotteryPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO106.cls = _arg_1;
            }, "_PanelLayer_UIPropVO106.cls");
            result[409] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_LOTTERY);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO106.vid = _arg_1;
            }, "_PanelLayer_UIPropVO106.vid");
            result[410] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO106.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO106.initVisible");
            result[411] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO106.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO106.createLater");
            result[412] = binding;
            binding = new Binding(this, function ():Class
            {
                return (DoubleElevenPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO107.cls = _arg_1;
            }, "_PanelLayer_UIPropVO107.cls");
            result[413] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_DOUBLE_ELEVEN);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO107.vid = _arg_1;
            }, "_PanelLayer_UIPropVO107.vid");
            result[414] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO107.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO107.initVisible");
            result[415] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO107.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO107.createLater");
            result[416] = binding;
            binding = new Binding(this, function ():Class
            {
                return (LotteryBagPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO108.cls = _arg_1;
            }, "_PanelLayer_UIPropVO108.cls");
            result[417] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_LOTTERY_BAG);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO108.vid = _arg_1;
            }, "_PanelLayer_UIPropVO108.vid");
            result[418] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO108.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO108.initVisible");
            result[419] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO108.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO108.createLater");
            result[420] = binding;
            binding = new Binding(this, function ():Class
            {
                return (VipSuccinctPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO109.cls = _arg_1;
            }, "_PanelLayer_UIPropVO109.cls");
            result[421] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_VIP_SUCCINCT);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO109.vid = _arg_1;
            }, "_PanelLayer_UIPropVO109.vid");
            result[422] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO109.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO109.initVisible");
            result[423] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO109.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO109.createLater");
            result[424] = binding;
            binding = new Binding(this, function ():Class
            {
                return (SignInPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO110.cls = _arg_1;
            }, "_PanelLayer_UIPropVO110.cls");
            result[425] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_SIGN_IN);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO110.vid = _arg_1;
            }, "_PanelLayer_UIPropVO110.vid");
            result[426] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO110.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO110.initVisible");
            result[427] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO110.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO110.createLater");
            result[428] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PVPResultPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO111.cls = _arg_1;
            }, "_PanelLayer_UIPropVO111.cls");
            result[429] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_PVP_RESULT);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO111.vid = _arg_1;
            }, "_PanelLayer_UIPropVO111.vid");
            result[430] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO111.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO111.initVisible");
            result[431] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO111.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO111.createLater");
            result[432] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MountPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO112.cls = _arg_1;
            }, "_PanelLayer_UIPropVO112.cls");
            result[433] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_MOUNT);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO112.vid = _arg_1;
            }, "_PanelLayer_UIPropVO112.vid");
            result[434] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO112.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO112.initVisible");
            result[435] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO112.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO112.createLater");
            result[436] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ChangeRbResPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO113.cls = _arg_1;
            }, "_PanelLayer_UIPropVO113.cls");
            result[437] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_CHANGE_RES);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO113.vid = _arg_1;
            }, "_PanelLayer_UIPropVO113.vid");
            result[438] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO113.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO113.initVisible");
            result[439] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO113.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO113.createLater");
            result[440] = binding;
            binding = new Binding(this, function ():Class
            {
                return (LuckDrawPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO114.cls = _arg_1;
            }, "_PanelLayer_UIPropVO114.cls");
            result[441] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_LUCK_DRAW);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO114.vid = _arg_1;
            }, "_PanelLayer_UIPropVO114.vid");
            result[442] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO114.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO114.initVisible");
            result[443] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO114.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO114.createLater");
            result[444] = binding;
            binding = new Binding(this, function ():Class
            {
                return (LuckDrawBagPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO115.cls = _arg_1;
            }, "_PanelLayer_UIPropVO115.cls");
            result[445] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_LUCK_DRAW_BAG);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO115.vid = _arg_1;
            }, "_PanelLayer_UIPropVO115.vid");
            result[446] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO115.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO115.initVisible");
            result[447] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO115.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO115.createLater");
            result[448] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MagicArrayPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO116.cls = _arg_1;
            }, "_PanelLayer_UIPropVO116.cls");
            result[449] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_MAGIC_ARRAY);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO116.vid = _arg_1;
            }, "_PanelLayer_UIPropVO116.vid");
            result[450] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO116.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO116.initVisible");
            result[451] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO116.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO116.createLater");
            result[452] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MilitaryPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO117.cls = _arg_1;
            }, "_PanelLayer_UIPropVO117.cls");
            result[453] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_MILITARY);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO117.vid = _arg_1;
            }, "_PanelLayer_UIPropVO117.vid");
            result[454] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO117.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO117.initVisible");
            result[455] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO117.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO117.createLater");
            result[456] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MazePanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO118.cls = _arg_1;
            }, "_PanelLayer_UIPropVO118.cls");
            result[457] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_MAZE);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO118.vid = _arg_1;
            }, "_PanelLayer_UIPropVO118.vid");
            result[458] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO118.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO118.initVisible");
            result[459] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO118.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO118.createLater");
            result[460] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MazeQuestionPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO119.cls = _arg_1;
            }, "_PanelLayer_UIPropVO119.cls");
            result[461] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_MAZE_QUESTION);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO119.vid = _arg_1;
            }, "_PanelLayer_UIPropVO119.vid");
            result[462] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO119.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO119.initVisible");
            result[463] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO119.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO119.createLater");
            result[464] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MazeShopPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO120.cls = _arg_1;
            }, "_PanelLayer_UIPropVO120.cls");
            result[465] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_MAZE_SHOP);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO120.vid = _arg_1;
            }, "_PanelLayer_UIPropVO120.vid");
            result[466] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO120.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO120.initVisible");
            result[467] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO120.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO120.createLater");
            result[468] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MazeLotteryPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO121.cls = _arg_1;
            }, "_PanelLayer_UIPropVO121.cls");
            result[469] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_MAZE_LOTTERY);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO121.vid = _arg_1;
            }, "_PanelLayer_UIPropVO121.vid");
            result[470] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO121.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO121.initVisible");
            result[471] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO121.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO121.createLater");
            result[472] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MazeEventInfoPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO122.cls = _arg_1;
            }, "_PanelLayer_UIPropVO122.cls");
            result[473] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_MAZE_EVENT_INFO);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO122.vid = _arg_1;
            }, "_PanelLayer_UIPropVO122.vid");
            result[474] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO122.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO122.initVisible");
            result[475] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO122.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO122.createLater");
            result[476] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MazePlayRulePanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO123.cls = _arg_1;
            }, "_PanelLayer_UIPropVO123.cls");
            result[477] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_MAZE_PLAY_RULE);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO123.vid = _arg_1;
            }, "_PanelLayer_UIPropVO123.vid");
            result[478] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO123.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO123.initVisible");
            result[479] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO123.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO123.createLater");
            result[480] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MazeDiscPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO124.cls = _arg_1;
            }, "_PanelLayer_UIPropVO124.cls");
            result[481] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_MAZE_DISC);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO124.vid = _arg_1;
            }, "_PanelLayer_UIPropVO124.vid");
            result[482] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO124.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO124.initVisible");
            result[483] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO124.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO124.createLater");
            result[484] = binding;
            binding = new Binding(this, function ():Class
            {
                return (SmallGamePanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO125.cls = _arg_1;
            }, "_PanelLayer_UIPropVO125.cls");
            result[485] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_Small_Game);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO125.vid = _arg_1;
            }, "_PanelLayer_UIPropVO125.vid");
            result[486] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO125.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO125.initVisible");
            result[487] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO125.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO125.createLater");
            result[488] = binding;
            binding = new Binding(this, function ():Class
            {
                return (SmallGameHideSeekPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO126.cls = _arg_1;
            }, "_PanelLayer_UIPropVO126.cls");
            result[489] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_Small_Game_HideSeek);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO126.vid = _arg_1;
            }, "_PanelLayer_UIPropVO126.vid");
            result[490] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO126.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO126.initVisible");
            result[491] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO126.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO126.createLater");
            result[492] = binding;
            binding = new Binding(this, function ():Class
            {
                return (SmallGameTwoSamePanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO127.cls = _arg_1;
            }, "_PanelLayer_UIPropVO127.cls");
            result[493] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_Small_Game_TwoSame);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO127.vid = _arg_1;
            }, "_PanelLayer_UIPropVO127.vid");
            result[494] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO127.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO127.initVisible");
            result[495] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO127.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO127.createLater");
            result[496] = binding;
            binding = new Binding(this, function ():Class
            {
                return (SmallGameMagicPowerPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO128.cls = _arg_1;
            }, "_PanelLayer_UIPropVO128.cls");
            result[497] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_Small_Game_MagicPower);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO128.vid = _arg_1;
            }, "_PanelLayer_UIPropVO128.vid");
            result[498] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO128.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO128.initVisible");
            result[499] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO128.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO128.createLater");
            result[500] = binding;
            binding = new Binding(this, function ():Class
            {
                return (SmallGameSpeedPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO129.cls = _arg_1;
            }, "_PanelLayer_UIPropVO129.cls");
            result[501] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_Small_Game_Speed);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO129.vid = _arg_1;
            }, "_PanelLayer_UIPropVO129.vid");
            result[502] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO129.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO129.initVisible");
            result[503] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO129.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO129.createLater");
            result[504] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MedalPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO130.cls = _arg_1;
            }, "_PanelLayer_UIPropVO130.cls");
            result[505] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_MEDAL);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO130.vid = _arg_1;
            }, "_PanelLayer_UIPropVO130.vid");
            result[506] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO130.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO130.initVisible");
            result[507] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO130.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO130.createLater");
            result[508] = binding;
            binding = new Binding(this, function ():Class
            {
                return (AstrologicPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO131.cls = _arg_1;
            }, "_PanelLayer_UIPropVO131.cls");
            result[509] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_ASTROLOGIC);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO131.vid = _arg_1;
            }, "_PanelLayer_UIPropVO131.vid");
            result[510] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO131.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO131.initVisible");
            result[511] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO131.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO131.createLater");
            result[0x0200] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PetHandbook);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO132.cls = _arg_1;
            }, "_PanelLayer_UIPropVO132.cls");
            result[513] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_PET_HANDBOOK);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO132.vid = _arg_1;
            }, "_PanelLayer_UIPropVO132.vid");
            result[0x0202] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO132.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO132.initVisible");
            result[515] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO132.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO132.createLater");
            result[516] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PetEvolutionPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO133.cls = _arg_1;
            }, "_PanelLayer_UIPropVO133.cls");
            result[517] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_PET_EVOLUTION);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO133.vid = _arg_1;
            }, "_PanelLayer_UIPropVO133.vid");
            result[518] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO133.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO133.initVisible");
            result[519] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO133.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO133.createLater");
            result[520] = binding;
            binding = new Binding(this, function ():Class
            {
                return (FindBackPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO134.cls = _arg_1;
            }, "_PanelLayer_UIPropVO134.cls");
            result[521] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_FINDBACK);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO134.vid = _arg_1;
            }, "_PanelLayer_UIPropVO134.vid");
            result[522] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO134.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO134.initVisible");
            result[523] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO134.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO134.createLater");
            result[524] = binding;
            binding = new Binding(this, function ():Class
            {
                return (CrossFightPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO135.cls = _arg_1;
            }, "_PanelLayer_UIPropVO135.cls");
            result[525] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_CROSS_FIGHT);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO135.vid = _arg_1;
            }, "_PanelLayer_UIPropVO135.vid");
            result[526] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO135.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO135.initVisible");
            result[527] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO135.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO135.createLater");
            result[528] = binding;
            binding = new Binding(this, function ():Class
            {
                return (CrossFightTeamInfo);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO136.cls = _arg_1;
            }, "_PanelLayer_UIPropVO136.cls");
            result[529] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_CROSS_FIGHT_TEAM);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO136.vid = _arg_1;
            }, "_PanelLayer_UIPropVO136.vid");
            result[530] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO136.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO136.initVisible");
            result[531] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO136.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO136.createLater");
            result[532] = binding;
            binding = new Binding(this, function ():Class
            {
                return (FairySkillConfigCanvas);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO137.cls = _arg_1;
            }, "_PanelLayer_UIPropVO137.cls");
            result[533] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_FAIRY_SKILL_CONFIG);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO137.vid = _arg_1;
            }, "_PanelLayer_UIPropVO137.vid");
            result[534] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO137.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO137.initVisible");
            result[535] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO137.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO137.createLater");
            result[536] = binding;
            binding = new Binding(this, function ():Class
            {
                return (BattleInfoCanvas);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO138.cls = _arg_1;
            }, "_PanelLayer_UIPropVO138.cls");
            result[537] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_BATTLE_INFO);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO138.vid = _arg_1;
            }, "_PanelLayer_UIPropVO138.vid");
            result[538] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO138.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO138.initVisible");
            result[539] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO138.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO138.createLater");
            result[540] = binding;
            binding = new Binding(this, function ():Class
            {
                return (CrossTeamFightPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO139.cls = _arg_1;
            }, "_PanelLayer_UIPropVO139.cls");
            result[541] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_CROSS_TEAM_FIGHT);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO139.vid = _arg_1;
            }, "_PanelLayer_UIPropVO139.vid");
            result[542] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO139.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO139.initVisible");
            result[543] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO139.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO139.createLater");
            result[544] = binding;
            binding = new Binding(this, function ():Class
            {
                return (CrossTeamFightBetPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO140.cls = _arg_1;
            }, "_PanelLayer_UIPropVO140.cls");
            result[545] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_CROSS_TEAM_FIGHT_BET);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO140.vid = _arg_1;
            }, "_PanelLayer_UIPropVO140.vid");
            result[546] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO140.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO140.initVisible");
            result[547] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO140.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO140.createLater");
            result[548] = binding;
            binding = new Binding(this, function ():Class
            {
                return (CrossContentionTotalPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO141.cls = _arg_1;
            }, "_PanelLayer_UIPropVO141.cls");
            result[549] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_CROSS_CONTENTION_TOTAL);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO141.vid = _arg_1;
            }, "_PanelLayer_UIPropVO141.vid");
            result[550] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO141.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO141.initVisible");
            result[551] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO141.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO141.createLater");
            result[552] = binding;
            binding = new Binding(this, function ():Class
            {
                return (CrossContentionSinglePanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO142.cls = _arg_1;
            }, "_PanelLayer_UIPropVO142.cls");
            result[553] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_CROSS_CONTENTION_SINGLE);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO142.vid = _arg_1;
            }, "_PanelLayer_UIPropVO142.vid");
            result[554] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO142.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO142.initVisible");
            result[555] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO142.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO142.createLater");
            result[556] = binding;
            binding = new Binding(this, function ():Class
            {
                return (CrossContentionSingleInfoPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO143.cls = _arg_1;
            }, "_PanelLayer_UIPropVO143.cls");
            result[557] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_CROSS_CONTENTION_SINGLE_INFO);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO143.vid = _arg_1;
            }, "_PanelLayer_UIPropVO143.vid");
            result[558] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO143.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO143.initVisible");
            result[559] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO143.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO143.createLater");
            result[560] = binding;
            binding = new Binding(this, function ():Class
            {
                return (CrossContentionAreaPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO144.cls = _arg_1;
            }, "_PanelLayer_UIPropVO144.cls");
            result[561] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_CROSS_CONTENTION_AREA);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO144.vid = _arg_1;
            }, "_PanelLayer_UIPropVO144.vid");
            result[562] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO144.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO144.initVisible");
            result[563] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO144.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO144.createLater");
            result[564] = binding;
            binding = new Binding(this, function ():Class
            {
                return (CrossContentionBossAreaPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO145.cls = _arg_1;
            }, "_PanelLayer_UIPropVO145.cls");
            result[565] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_CROSS_CONTENTION_BOSS_AREA);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO145.vid = _arg_1;
            }, "_PanelLayer_UIPropVO145.vid");
            result[566] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO145.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO145.initVisible");
            result[567] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO145.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO145.createLater");
            result[568] = binding;
            binding = new Binding(this, function ():Class
            {
                return (CrossContentionFightPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO146.cls = _arg_1;
            }, "_PanelLayer_UIPropVO146.cls");
            result[569] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_CROSS_CONTENTION_FIGHT);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO146.vid = _arg_1;
            }, "_PanelLayer_UIPropVO146.vid");
            result[570] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO146.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO146.initVisible");
            result[571] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO146.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO146.createLater");
            result[572] = binding;
            binding = new Binding(this, function ():Class
            {
                return (CrossContentionFirstAward);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO147.cls = _arg_1;
            }, "_PanelLayer_UIPropVO147.cls");
            result[573] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_CROSS_CONTENTION_FIRST_AWARD);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO147.vid = _arg_1;
            }, "_PanelLayer_UIPropVO147.vid");
            result[574] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO147.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO147.initVisible");
            result[575] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO147.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO147.createLater");
            result[576] = binding;
            binding = new Binding(this, function ():Class
            {
                return (CrossContentionScoreAward);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO148.cls = _arg_1;
            }, "_PanelLayer_UIPropVO148.cls");
            result[577] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_CROSS_CONTENTION_SCORE_AWARD);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO148.vid = _arg_1;
            }, "_PanelLayer_UIPropVO148.vid");
            result[578] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO148.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO148.initVisible");
            result[579] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO148.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO148.createLater");
            result[580] = binding;
            binding = new Binding(this, function ():Class
            {
                return (CrossContentionTimeAward);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO149.cls = _arg_1;
            }, "_PanelLayer_UIPropVO149.cls");
            result[581] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_CROSS_CONTENTION_TIME_AWARD);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO149.vid = _arg_1;
            }, "_PanelLayer_UIPropVO149.vid");
            result[582] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO149.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO149.initVisible");
            result[583] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO149.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO149.createLater");
            result[584] = binding;
            binding = new Binding(this, function ():Class
            {
                return (CrossContentionBattleInfo);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO150.cls = _arg_1;
            }, "_PanelLayer_UIPropVO150.cls");
            result[585] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_CROSS_CONTENTION_BATTLE_INFO);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO150.vid = _arg_1;
            }, "_PanelLayer_UIPropVO150.vid");
            result[586] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO150.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO150.initVisible");
            result[587] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO150.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO150.createLater");
            result[588] = binding;
            binding = new Binding(this, function ():Class
            {
                return (CrossContentionRank);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO151.cls = _arg_1;
            }, "_PanelLayer_UIPropVO151.cls");
            result[589] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_CROSS_CONTENTION_RANK);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO151.vid = _arg_1;
            }, "_PanelLayer_UIPropVO151.vid");
            result[590] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO151.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO151.initVisible");
            result[591] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO151.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO151.createLater");
            result[592] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PetTalentPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO152.cls = _arg_1;
            }, "_PanelLayer_UIPropVO152.cls");
            result[593] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_PET_TALENT);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO152.vid = _arg_1;
            }, "_PanelLayer_UIPropVO152.vid");
            result[594] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO152.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO152.initVisible");
            result[595] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO152.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO152.createLater");
            result[596] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PetTalentFuncPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO153.cls = _arg_1;
            }, "_PanelLayer_UIPropVO153.cls");
            result[597] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_PET_TALENT_FUNC);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO153.vid = _arg_1;
            }, "_PanelLayer_UIPropVO153.vid");
            result[598] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO153.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO153.initVisible");
            result[599] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO153.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO153.createLater");
            result[600] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TreasurePanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO154.cls = _arg_1;
            }, "_PanelLayer_UIPropVO154.cls");
            result[601] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_TREASURE_BOWL);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO154.vid = _arg_1;
            }, "_PanelLayer_UIPropVO154.vid");
            result[602] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO154.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO154.initVisible");
            result[603] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO154.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO154.createLater");
            result[604] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ExtractCardActivity);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO155.cls = _arg_1;
            }, "_PanelLayer_UIPropVO155.cls");
            result[605] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_EXTRACT_CARD_ACTIVITY);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO155.vid = _arg_1;
            }, "_PanelLayer_UIPropVO155.vid");
            result[606] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO155.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO155.initVisible");
            result[607] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO155.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO155.createLater");
            result[608] = binding;
            binding = new Binding(this, function ():Class
            {
                return (StoneSealPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO156.cls = _arg_1;
            }, "_PanelLayer_UIPropVO156.cls");
            result[609] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_STONE_SEAL);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO156.vid = _arg_1;
            }, "_PanelLayer_UIPropVO156.vid");
            result[610] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO156.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO156.initVisible");
            result[611] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO156.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO156.createLater");
            result[612] = binding;
            binding = new Binding(this, function ():Class
            {
                return (StoneSealBoreCanvas);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO157.cls = _arg_1;
            }, "_PanelLayer_UIPropVO157.cls");
            result[613] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_STONE_SEAL_BORE);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO157.vid = _arg_1;
            }, "_PanelLayer_UIPropVO157.vid");
            result[614] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO157.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO157.initVisible");
            result[615] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO157.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO157.createLater");
            result[616] = binding;
            binding = new Binding(this, function ():Class
            {
                return (StarExchange);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO158.cls = _arg_1;
            }, "_PanelLayer_UIPropVO158.cls");
            result[617] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_STAR_EXCHANGE);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO158.vid = _arg_1;
            }, "_PanelLayer_UIPropVO158.vid");
            result[618] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO158.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO158.initVisible");
            result[619] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO158.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO158.createLater");
            result[620] = binding;
            binding = new Binding(this, function ():Class
            {
                return (FlopPassPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO159.cls = _arg_1;
            }, "_PanelLayer_UIPropVO159.cls");
            result[621] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_FLOP_PASS);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO159.vid = _arg_1;
            }, "_PanelLayer_UIPropVO159.vid");
            result[622] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO159.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO159.initVisible");
            result[623] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO159.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO159.createLater");
            result[624] = binding;
            binding = new Binding(this, function ():Class
            {
                return (HulaPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO160.cls = _arg_1;
            }, "_PanelLayer_UIPropVO160.cls");
            result[625] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_HULA);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO160.vid = _arg_1;
            }, "_PanelLayer_UIPropVO160.vid");
            result[626] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO160.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO160.initVisible");
            result[627] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO160.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO160.createLater");
            result[628] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ReturnRewardPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO161.cls = _arg_1;
            }, "_PanelLayer_UIPropVO161.cls");
            result[629] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_RETURN_REWARD);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO161.vid = _arg_1;
            }, "_PanelLayer_UIPropVO161.vid");
            result[630] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO161.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO161.initVisible");
            result[631] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO161.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO161.createLater");
            result[632] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TrialsPassMainPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO162.cls = _arg_1;
            }, "_PanelLayer_UIPropVO162.cls");
            result[633] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_TRIALS);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO162.vid = _arg_1;
            }, "_PanelLayer_UIPropVO162.vid");
            result[634] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO162.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO162.initVisible");
            result[635] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO162.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO162.createLater");
            result[636] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TrialsPassAwardPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO163.cls = _arg_1;
            }, "_PanelLayer_UIPropVO163.cls");
            result[637] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_TRIALS_AWARD);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO163.vid = _arg_1;
            }, "_PanelLayer_UIPropVO163.vid");
            result[638] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO163.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO163.initVisible");
            result[639] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO163.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO163.createLater");
            result[640] = binding;
            binding = new Binding(this, function ():Class
            {
                return (DotaPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO164.cls = _arg_1;
            }, "_PanelLayer_UIPropVO164.cls");
            result[641] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_DOTA);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO164.vid = _arg_1;
            }, "_PanelLayer_UIPropVO164.vid");
            result[642] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO164.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO164.initVisible");
            result[643] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO164.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO164.createLater");
            result[644] = binding;
            binding = new Binding(this, function ():Class
            {
                return (GrouponPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO165.cls = _arg_1;
            }, "_PanelLayer_UIPropVO165.cls");
            result[645] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_GROUPON);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO165.vid = _arg_1;
            }, "_PanelLayer_UIPropVO165.vid");
            result[646] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO165.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO165.initVisible");
            result[647] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO165.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO165.createLater");
            result[648] = binding;
            binding = new Binding(this, function ():Class
            {
                return (SummerGames);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO166.cls = _arg_1;
            }, "_PanelLayer_UIPropVO166.cls");
            result[649] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_SUMMER_GAME);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO166.vid = _arg_1;
            }, "_PanelLayer_UIPropVO166.vid");
            result[650] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO166.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO166.initVisible");
            result[651] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO166.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO166.createLater");
            result[652] = binding;
            binding = new Binding(this, function ():Class
            {
                return (Wasteland);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO167.cls = _arg_1;
            }, "_PanelLayer_UIPropVO167.cls");
            result[653] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_SUMMER_GAME_WASTELAND);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO167.vid = _arg_1;
            }, "_PanelLayer_UIPropVO167.vid");
            result[654] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO167.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO167.initVisible");
            result[655] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO167.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO167.createLater");
            result[656] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ThreeDiabetes);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO168.cls = _arg_1;
            }, "_PanelLayer_UIPropVO168.cls");
            result[657] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_SUMMER_GAME_DIABETES);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO168.vid = _arg_1;
            }, "_PanelLayer_UIPropVO168.vid");
            result[658] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO168.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO168.initVisible");
            result[659] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO168.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO168.createLater");
            result[660] = binding;
            binding = new Binding(this, function ():Class
            {
                return (HorseRace);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO169.cls = _arg_1;
            }, "_PanelLayer_UIPropVO169.cls");
            result[661] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_SUMMER_GAME_HORSE_RACE);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO169.vid = _arg_1;
            }, "_PanelLayer_UIPropVO169.vid");
            result[662] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO169.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO169.initVisible");
            result[663] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO169.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO169.createLater");
            result[664] = binding;
            binding = new Binding(this, function ():Class
            {
                return (WorldCupPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO170.cls = _arg_1;
            }, "_PanelLayer_UIPropVO170.cls");
            result[665] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_WORLD_CUP);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO170.vid = _arg_1;
            }, "_PanelLayer_UIPropVO170.vid");
            result[666] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO170.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO170.initVisible");
            result[667] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO170.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO170.createLater");
            result[668] = binding;
            binding = new Binding(this, function ():Class
            {
                return (WorldCupVSPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO171.cls = _arg_1;
            }, "_PanelLayer_UIPropVO171.cls");
            result[669] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_WORLD_CUP_VS);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO171.vid = _arg_1;
            }, "_PanelLayer_UIPropVO171.vid");
            result[670] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO171.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO171.initVisible");
            result[671] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO171.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO171.createLater");
            result[672] = binding;
            binding = new Binding(this, function ():Class
            {
                return (DressPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO172.cls = _arg_1;
            }, "_PanelLayer_UIPropVO172.cls");
            result[673] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_DRESS);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO172.vid = _arg_1;
            }, "_PanelLayer_UIPropVO172.vid");
            result[674] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO172.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO172.initVisible");
            result[675] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO172.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO172.createLater");
            result[676] = binding;
            binding = new Binding(this, function ():Class
            {
                return (DecoratePanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO173.cls = _arg_1;
            }, "_PanelLayer_UIPropVO173.cls");
            result[677] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_DECORATE);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO173.vid = _arg_1;
            }, "_PanelLayer_UIPropVO173.vid");
            result[678] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO173.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO173.initVisible");
            result[679] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO173.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO173.createLater");
            result[680] = binding;
            binding = new Binding(this, function ():Class
            {
                return (AutoTaskPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO174.cls = _arg_1;
            }, "_PanelLayer_UIPropVO174.cls");
            result[681] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_AUTOTASK);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO174.vid = _arg_1;
            }, "_PanelLayer_UIPropVO174.vid");
            result[682] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO174.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO174.initVisible");
            result[683] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO174.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO174.createLater");
            result[684] = binding;
            binding = new Binding(this, function ():Class
            {
                return (RecipeExchangePanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO175.cls = _arg_1;
            }, "_PanelLayer_UIPropVO175.cls");
            result[685] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_RECIPE_EXCHANGE);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO175.vid = _arg_1;
            }, "_PanelLayer_UIPropVO175.vid");
            result[686] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO175.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO175.initVisible");
            result[687] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO175.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO175.createLater");
            result[688] = binding;
            binding = new Binding(this, function ():Class
            {
                return (WorldCupChangePanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO176.cls = _arg_1;
            }, "_PanelLayer_UIPropVO176.cls");
            result[689] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_WORLD_CUP_CHANGE);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO176.vid = _arg_1;
            }, "_PanelLayer_UIPropVO176.vid");
            result[690] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO176.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO176.initVisible");
            result[691] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO176.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO176.createLater");
            result[692] = binding;
            binding = new Binding(this, function ():Class
            {
                return (NpcShopPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO177.cls = _arg_1;
            }, "_PanelLayer_UIPropVO177.cls");
            result[693] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_NPC_SHOP);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO177.vid = _arg_1;
            }, "_PanelLayer_UIPropVO177.vid");
            result[694] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO177.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO177.initVisible");
            result[695] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO177.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO177.createLater");
            result[696] = binding;
            binding = new Binding(this, function ():Class
            {
                return (BossDailyPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO178.cls = _arg_1;
            }, "_PanelLayer_UIPropVO178.cls");
            result[697] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_BOSS_DAILY);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO178.vid = _arg_1;
            }, "_PanelLayer_UIPropVO178.vid");
            result[698] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO178.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO178.initVisible");
            result[699] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO178.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO178.createLater");
            result[700] = binding;
            binding = new Binding(this, function ():Class
            {
                return (AwakenPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO179.cls = _arg_1;
            }, "_PanelLayer_UIPropVO179.cls");
            result[701] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_AWAKEN);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO179.vid = _arg_1;
            }, "_PanelLayer_UIPropVO179.vid");
            result[702] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO179.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO179.initVisible");
            result[703] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO179.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO179.createLater");
            result[704] = binding;
            binding = new Binding(this, function ():Class
            {
                return (WaWaGamePanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO180.cls = _arg_1;
            }, "_PanelLayer_UIPropVO180.cls");
            result[705] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_WAWA_GAME);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO180.vid = _arg_1;
            }, "_PanelLayer_UIPropVO180.vid");
            result[706] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO180.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO180.initVisible");
            result[707] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO180.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO180.createLater");
            result[708] = binding;
            binding = new Binding(this, function ():Class
            {
                return (WaWaChangePanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO181.cls = _arg_1;
            }, "_PanelLayer_UIPropVO181.cls");
            result[709] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_WAWA_CHANGE);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO181.vid = _arg_1;
            }, "_PanelLayer_UIPropVO181.vid");
            result[710] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO181.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO181.initVisible");
            result[711] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO181.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO181.createLater");
            result[712] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ChargeNoticePanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO182.cls = _arg_1;
            }, "_PanelLayer_UIPropVO182.cls");
            result[713] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_CHARGE_NOTICE);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO182.vid = _arg_1;
            }, "_PanelLayer_UIPropVO182.vid");
            result[714] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO182.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO182.initVisible");
            result[715] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO182.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO182.createLater");
            result[716] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MysteryFurnace);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO183.cls = _arg_1;
            }, "_PanelLayer_UIPropVO183.cls");
            result[717] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_MYSTERY_FURNACE);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO183.vid = _arg_1;
            }, "_PanelLayer_UIPropVO183.vid");
            result[718] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO183.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO183.initVisible");
            result[719] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO183.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO183.createLater");
            result[720] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TrainSoulPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO184.cls = _arg_1;
            }, "_PanelLayer_UIPropVO184.cls");
            result[721] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_TRAIN_SOUL);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO184.vid = _arg_1;
            }, "_PanelLayer_UIPropVO184.vid");
            result[722] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO184.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO184.initVisible");
            result[723] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO184.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO184.createLater");
            result[724] = binding;
            binding = new Binding(this, function ():Class
            {
                return (JuHuaSuanAlertPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO185.cls = _arg_1;
            }, "_PanelLayer_UIPropVO185.cls");
            result[725] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_JUHUASUAN_ALERT);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO185.vid = _arg_1;
            }, "_PanelLayer_UIPropVO185.vid");
            result[726] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO185.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO185.initVisible");
            result[727] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO185.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO185.createLater");
            result[728] = binding;
            binding = new Binding(this, function ():Class
            {
                return (JuHuaSuanPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO186.cls = _arg_1;
            }, "_PanelLayer_UIPropVO186.cls");
            result[729] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_JUHUASUAN);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO186.vid = _arg_1;
            }, "_PanelLayer_UIPropVO186.vid");
            result[730] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO186.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO186.initVisible");
            result[731] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO186.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO186.createLater");
            result[732] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ManJiuJianPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO187.cls = _arg_1;
            }, "_PanelLayer_UIPropVO187.cls");
            result[733] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_MANJIUJIAN);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO187.vid = _arg_1;
            }, "_PanelLayer_UIPropVO187.vid");
            result[734] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO187.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO187.initVisible");
            result[735] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO187.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO187.createLater");
            result[736] = binding;
            binding = new Binding(this, function ():Class
            {
                return (RebateEverydayPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO188.cls = _arg_1;
            }, "_PanelLayer_UIPropVO188.cls");
            result[737] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_REBATEEVERYDAY);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO188.vid = _arg_1;
            }, "_PanelLayer_UIPropVO188.vid");
            result[738] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO188.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO188.initVisible");
            result[739] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO188.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO188.createLater");
            result[740] = binding;
            binding = new Binding(this, function ():Class
            {
                return (RebateEverydayAlertPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO189.cls = _arg_1;
            }, "_PanelLayer_UIPropVO189.cls");
            result[741] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_REBATEEVERYDAY_ALERT);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO189.vid = _arg_1;
            }, "_PanelLayer_UIPropVO189.vid");
            result[742] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO189.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO189.initVisible");
            result[743] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO189.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO189.createLater");
            result[744] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TripleTownPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO190.cls = _arg_1;
            }, "_PanelLayer_UIPropVO190.cls");
            result[745] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_TRIPLE_TOWN);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO190.vid = _arg_1;
            }, "_PanelLayer_UIPropVO190.vid");
            result[746] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO190.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO190.initVisible");
            result[747] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO190.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO190.createLater");
            result[748] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MonthWelfarePanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO191.cls = _arg_1;
            }, "_PanelLayer_UIPropVO191.cls");
            result[749] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_MONTHWELFARE);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO191.vid = _arg_1;
            }, "_PanelLayer_UIPropVO191.vid");
            result[750] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO191.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO191.initVisible");
            result[751] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO191.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO191.createLater");
            result[752] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MonthWelfareAlertPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO192.cls = _arg_1;
            }, "_PanelLayer_UIPropVO192.cls");
            result[753] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_MONTHWELFARE_ALERT);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO192.vid = _arg_1;
            }, "_PanelLayer_UIPropVO192.vid");
            result[754] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO192.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO192.initVisible");
            result[755] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO192.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO192.createLater");
            result[756] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MonthWelfareBagPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO193.cls = _arg_1;
            }, "_PanelLayer_UIPropVO193.cls");
            result[757] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_MONTHWELFARE_BAG);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO193.vid = _arg_1;
            }, "_PanelLayer_UIPropVO193.vid");
            result[758] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO193.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO193.initVisible");
            result[759] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO193.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO193.createLater");
            result[760] = binding;
            binding = new Binding(this, function ():Class
            {
                return (HeiYaoShiPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO194.cls = _arg_1;
            }, "_PanelLayer_UIPropVO194.cls");
            result[761] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_HEIYAOSHI);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO194.vid = _arg_1;
            }, "_PanelLayer_UIPropVO194.vid");
            result[762] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO194.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO194.initVisible");
            result[763] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO194.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO194.createLater");
            result[764] = binding;
            binding = new Binding(this, function ():Class
            {
                return (HeiyaoshiAlertPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO195.cls = _arg_1;
            }, "_PanelLayer_UIPropVO195.cls");
            result[765] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_HEIYAOSHI_ALERT);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO195.vid = _arg_1;
            }, "_PanelLayer_UIPropVO195.vid");
            result[766] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO195.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO195.initVisible");
            result[767] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO195.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO195.createLater");
            result[0x0300] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PRSPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO196.cls = _arg_1;
            }, "_PanelLayer_UIPropVO196.cls");
            result[769] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_PET_REAl_SOUL);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO196.vid = _arg_1;
            }, "_PanelLayer_UIPropVO196.vid");
            result[770] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO196.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO196.initVisible");
            result[0x0303] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO196.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO196.createLater");
            result[772] = binding;
            binding = new Binding(this, function ():Class
            {
                return (SecretTreasureHuntPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO197.cls = _arg_1;
            }, "_PanelLayer_UIPropVO197.cls");
            result[773] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_SECRET_TREASUREHUNT);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO197.vid = _arg_1;
            }, "_PanelLayer_UIPropVO197.vid");
            result[774] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO197.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO197.initVisible");
            result[775] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO197.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO197.createLater");
            result[776] = binding;
            binding = new Binding(this, function ():Class
            {
                return (SecretTreasureHuntAlertPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO198.cls = _arg_1;
            }, "_PanelLayer_UIPropVO198.cls");
            result[777] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_SECRET_TREASUREHUNT_ALERT);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO198.vid = _arg_1;
            }, "_PanelLayer_UIPropVO198.vid");
            result[778] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO198.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO198.initVisible");
            result[779] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO198.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO198.createLater");
            result[780] = binding;
            binding = new Binding(this, function ():Class
            {
                return (SecretTreasureHuntAlertOne);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO199.cls = _arg_1;
            }, "_PanelLayer_UIPropVO199.cls");
            result[781] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_SECRET_TREASUREHUNT_ONE);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO199.vid = _arg_1;
            }, "_PanelLayer_UIPropVO199.vid");
            result[782] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO199.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO199.initVisible");
            result[783] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO199.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO199.createLater");
            result[784] = binding;
            binding = new Binding(this, function ():Class
            {
                return (SecretTreasureHuntEnd);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO200.cls = _arg_1;
            }, "_PanelLayer_UIPropVO200.cls");
            result[785] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_SECRET_TREASUREHUNT_END);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO200.vid = _arg_1;
            }, "_PanelLayer_UIPropVO200.vid");
            result[786] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO200.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO200.initVisible");
            result[787] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO200.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO200.createLater");
            result[788] = binding;
            binding = new Binding(this, function ():Class
            {
                return (SecretTreasureHuntAutoPlay);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO201.cls = _arg_1;
            }, "_PanelLayer_UIPropVO201.cls");
            result[789] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_SECRET_TREASUREHUNT_AUTO);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO201.vid = _arg_1;
            }, "_PanelLayer_UIPropVO201.vid");
            result[790] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO201.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO201.initVisible");
            result[791] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO201.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO201.createLater");
            result[792] = binding;
            binding = new Binding(this, function ():Class
            {
                return (WarSpritePanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO202.cls = _arg_1;
            }, "_PanelLayer_UIPropVO202.cls");
            result[793] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_WAR_BATTLE);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO202.vid = _arg_1;
            }, "_PanelLayer_UIPropVO202.vid");
            result[794] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO202.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO202.initVisible");
            result[795] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO202.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO202.createLater");
            result[796] = binding;
            binding = new Binding(this, function ():Class
            {
                return (HappyFrontLinePanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO203.cls = _arg_1;
            }, "_PanelLayer_UIPropVO203.cls");
            result[797] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_HAPPYFRONTLINE);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO203.vid = _arg_1;
            }, "_PanelLayer_UIPropVO203.vid");
            result[798] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO203.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO203.initVisible");
            result[799] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO203.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO203.createLater");
            result[800] = binding;
            binding = new Binding(this, function ():Class
            {
                return (AnniversaryPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO204.cls = _arg_1;
            }, "_PanelLayer_UIPropVO204.cls");
            result[801] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_ANNIVERSARY);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO204.vid = _arg_1;
            }, "_PanelLayer_UIPropVO204.vid");
            result[802] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO204.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO204.initVisible");
            result[803] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO204.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO204.createLater");
            result[804] = binding;
            binding = new Binding(this, function ():Class
            {
                return (FarmMaster);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO205.cls = _arg_1;
            }, "_PanelLayer_UIPropVO205.cls");
            result[805] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_FARMMASTER);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO205.vid = _arg_1;
            }, "_PanelLayer_UIPropVO205.vid");
            result[806] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO205.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO205.initVisible");
            result[807] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO205.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO205.createLater");
            result[808] = binding;
            binding = new Binding(this, function ():Class
            {
                return (StoneMaster);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO206.cls = _arg_1;
            }, "_PanelLayer_UIPropVO206.cls");
            result[809] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_STONEMASTER);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO206.vid = _arg_1;
            }, "_PanelLayer_UIPropVO206.vid");
            result[810] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO206.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO206.initVisible");
            result[811] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO206.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO206.createLater");
            result[812] = binding;
            binding = new Binding(this, function ():Class
            {
                return (CubeMaster);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO207.cls = _arg_1;
            }, "_PanelLayer_UIPropVO207.cls");
            result[813] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_CUBEMASTER);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO207.vid = _arg_1;
            }, "_PanelLayer_UIPropVO207.vid");
            result[814] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO207.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO207.initVisible");
            result[815] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO207.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO207.createLater");
            result[816] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MonsterHeartPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO208.cls = _arg_1;
            }, "_PanelLayer_UIPropVO208.cls");
            result[817] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_MONSTERHEART);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO208.vid = _arg_1;
            }, "_PanelLayer_UIPropVO208.vid");
            result[818] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO208.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO208.initVisible");
            result[819] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO208.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO208.createLater");
            result[820] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PetGuardPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO209.cls = _arg_1;
            }, "_PanelLayer_UIPropVO209.cls");
            result[821] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_PETGUARD);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO209.vid = _arg_1;
            }, "_PanelLayer_UIPropVO209.vid");
            result[822] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO209.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO209.initVisible");
            result[823] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO209.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO209.createLater");
            result[824] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PetGuardInSidePanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO210.cls = _arg_1;
            }, "_PanelLayer_UIPropVO210.cls");
            result[825] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_PETGUARDINSIDE);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO210.vid = _arg_1;
            }, "_PanelLayer_UIPropVO210.vid");
            result[826] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO210.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO210.initVisible");
            result[827] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO210.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO210.createLater");
            result[828] = binding;
            binding = new Binding(this, function ():Class
            {
                return (DailySignInPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO211.cls = _arg_1;
            }, "_PanelLayer_UIPropVO211.cls");
            result[829] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_DAILYSIGNINACT);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO211.vid = _arg_1;
            }, "_PanelLayer_UIPropVO211.vid");
            result[830] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO211.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO211.initVisible");
            result[831] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO211.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO211.createLater");
            result[832] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MagicCrystalPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO212.cls = _arg_1;
            }, "_PanelLayer_UIPropVO212.cls");
            result[833] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_MAGICCRYSTAL);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO212.vid = _arg_1;
            }, "_PanelLayer_UIPropVO212.vid");
            result[834] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO212.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO212.initVisible");
            result[835] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO212.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO212.createLater");
            result[836] = binding;
            binding = new Binding(this, function ():Class
            {
                return (StoneToGoldActPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO213.cls = _arg_1;
            }, "_PanelLayer_UIPropVO213.cls");
            result[837] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_STONETOGOLDACT);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO213.vid = _arg_1;
            }, "_PanelLayer_UIPropVO213.vid");
            result[838] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO213.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO213.initVisible");
            result[839] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO213.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO213.createLater");
            result[840] = binding;
            binding = new Binding(this, function ():Class
            {
                return (QiLingPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO214.cls = _arg_1;
            }, "_PanelLayer_UIPropVO214.cls");
            result[841] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_QILING);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO214.vid = _arg_1;
            }, "_PanelLayer_UIPropVO214.vid");
            result[842] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO214.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO214.initVisible");
            result[843] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO214.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO214.createLater");
            result[844] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MoJinActPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO215.cls = _arg_1;
            }, "_PanelLayer_UIPropVO215.cls");
            result[845] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_MOJINACT);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO215.vid = _arg_1;
            }, "_PanelLayer_UIPropVO215.vid");
            result[846] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO215.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO215.initVisible");
            result[847] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO215.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO215.createLater");
            result[848] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PetStonePanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO216.cls = _arg_1;
            }, "_PanelLayer_UIPropVO216.cls");
            result[849] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_PET_STONE);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO216.vid = _arg_1;
            }, "_PanelLayer_UIPropVO216.vid");
            result[850] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO216.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO216.initVisible");
            result[851] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO216.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO216.createLater");
            result[852] = binding;
            binding = new Binding(this, function ():Class
            {
                return (AddOpePanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO217.cls = _arg_1;
            }, "_PanelLayer_UIPropVO217.cls");
            result[853] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_ADD_OPE);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO217.vid = _arg_1;
            }, "_PanelLayer_UIPropVO217.vid");
            result[854] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO217.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO217.initVisible");
            result[855] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO217.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO217.createLater");
            result[856] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ExplorerMedalPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO218.cls = _arg_1;
            }, "_PanelLayer_UIPropVO218.cls");
            result[857] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_EXPLORER_MEDAL);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO218.vid = _arg_1;
            }, "_PanelLayer_UIPropVO218.vid");
            result[858] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO218.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO218.initVisible");
            result[859] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO218.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO218.createLater");
            result[860] = binding;
            binding = new Binding(this, function ():Class
            {
                return (Sudoku);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO219.cls = _arg_1;
            }, "_PanelLayer_UIPropVO219.cls");
            result[861] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_SUDOKU);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO219.vid = _arg_1;
            }, "_PanelLayer_UIPropVO219.vid");
            result[862] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO219.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO219.initVisible");
            result[863] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO219.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO219.createLater");
            result[864] = binding;
            binding = new Binding(this, function ():Class
            {
                return (DuiduiPeng);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO220.cls = _arg_1;
            }, "_PanelLayer_UIPropVO220.cls");
            result[865] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_DUIDUIPENG);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO220.vid = _arg_1;
            }, "_PanelLayer_UIPropVO220.vid");
            result[866] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO220.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO220.initVisible");
            result[867] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO220.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO220.createLater");
            result[868] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ShowTimePnael);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO221.cls = _arg_1;
            }, "_PanelLayer_UIPropVO221.cls");
            result[869] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_SHOWTIME);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO221.vid = _arg_1;
            }, "_PanelLayer_UIPropVO221.vid");
            result[870] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO221.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO221.initVisible");
            result[871] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO221.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO221.createLater");
            result[872] = binding;
            binding = new Binding(this, function ():Class
            {
                return (AnniversaryTurntable);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO222.cls = _arg_1;
            }, "_PanelLayer_UIPropVO222.cls");
            result[873] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_ANNI_ZHUANPAN);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO222.vid = _arg_1;
            }, "_PanelLayer_UIPropVO222.vid");
            result[874] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO222.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO222.initVisible");
            result[875] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO222.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO222.createLater");
            result[876] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PetPVESystem);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO223.cls = _arg_1;
            }, "_PanelLayer_UIPropVO223.cls");
            result[877] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_PET_PVE);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO223.vid = _arg_1;
            }, "_PanelLayer_UIPropVO223.vid");
            result[878] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO223.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO223.initVisible");
            result[879] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO223.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO223.createLater");
            result[880] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PetPVEConfigPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO224.cls = _arg_1;
            }, "_PanelLayer_UIPropVO224.cls");
            result[881] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_PET_PVE_CONFIG);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO224.vid = _arg_1;
            }, "_PanelLayer_UIPropVO224.vid");
            result[882] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO224.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO224.initVisible");
            result[883] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO224.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO224.createLater");
            result[884] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PetArenaActivityPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO225.cls = _arg_1;
            }, "_PanelLayer_UIPropVO225.cls");
            result[885] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_PET_ARENA_ACTIVITY);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO225.vid = _arg_1;
            }, "_PanelLayer_UIPropVO225.vid");
            result[886] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO225.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO225.initVisible");
            result[887] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO225.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO225.createLater");
            result[888] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PetArenaActivityRankPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO226.cls = _arg_1;
            }, "_PanelLayer_UIPropVO226.cls");
            result[889] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_PET_ARENA_ACTIVITY_RANK);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO226.vid = _arg_1;
            }, "_PanelLayer_UIPropVO226.vid");
            result[890] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO226.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO226.initVisible");
            result[891] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO226.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO226.createLater");
            result[892] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PetFightConfActivity);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO227.cls = _arg_1;
            }, "_PanelLayer_UIPropVO227.cls");
            result[893] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_PETFIGHT_CONF_ACTIVITY);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO227.vid = _arg_1;
            }, "_PanelLayer_UIPropVO227.vid");
            result[894] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO227.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO227.initVisible");
            result[895] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO227.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO227.createLater");
            result[896] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PetArenaPrevRankActivityPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO228.cls = _arg_1;
            }, "_PanelLayer_UIPropVO228.cls");
            result[897] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_PET_ARENA_PREV_ACTIVITY_RANK);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO228.vid = _arg_1;
            }, "_PanelLayer_UIPropVO228.vid");
            result[898] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO228.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO228.initVisible");
            result[899] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO228.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO228.createLater");
            result[900] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PKGamePanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO229.cls = _arg_1;
            }, "_PanelLayer_UIPropVO229.cls");
            result[901] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_PK_GAME);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO229.vid = _arg_1;
            }, "_PanelLayer_UIPropVO229.vid");
            result[902] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO229.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO229.initVisible");
            result[903] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO229.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO229.createLater");
            result[904] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ConsumeNoticePanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO230.cls = _arg_1;
            }, "_PanelLayer_UIPropVO230.cls");
            result[905] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_CONSUME_NOTICE_ACTIVITY);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO230.vid = _arg_1;
            }, "_PanelLayer_UIPropVO230.vid");
            result[906] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO230.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO230.initVisible");
            result[907] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO230.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO230.createLater");
            result[908] = binding;
            binding = new Binding(this, function ():Class
            {
                return (XiaochudasaiPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO231.cls = _arg_1;
            }, "_PanelLayer_UIPropVO231.cls");
            result[909] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_XIAOCHUSDASAI_ACTIVITY);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO231.vid = _arg_1;
            }, "_PanelLayer_UIPropVO231.vid");
            result[910] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO231.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO231.initVisible");
            result[911] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO231.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO231.createLater");
            result[912] = binding;
            binding = new Binding(this, function ():Class
            {
                return (PrePurchasePanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO232.cls = _arg_1;
            }, "_PanelLayer_UIPropVO232.cls");
            result[913] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_PREPURCHASE_ACTIVITY);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO232.vid = _arg_1;
            }, "_PanelLayer_UIPropVO232.vid");
            result[914] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO232.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO232.initVisible");
            result[915] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO232.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO232.createLater");
            result[916] = binding;
            binding = new Binding(this, function ():Class
            {
                return (texunkecheng);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO233.cls = _arg_1;
            }, "_PanelLayer_UIPropVO233.cls");
            result[917] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_TEXUNKECHENG_ACTIVITY);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO233.vid = _arg_1;
            }, "_PanelLayer_UIPropVO233.vid");
            result[918] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO233.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO233.initVisible");
            result[919] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO233.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO233.createLater");
            result[920] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TXKCEXPPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO234.cls = _arg_1;
            }, "_PanelLayer_UIPropVO234.cls");
            result[921] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_TEXUNKECHENG_EXP_PANEL);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO234.vid = _arg_1;
            }, "_PanelLayer_UIPropVO234.vid");
            result[922] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO234.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO234.initVisible");
            result[923] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO234.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO234.createLater");
            result[924] = binding;
            binding = new Binding(this, function ():Class
            {
                return (XiulianshiPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO235.cls = _arg_1;
            }, "_PanelLayer_UIPropVO235.cls");
            result[925] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_XIULIAN_PANEL);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO235.vid = _arg_1;
            }, "_PanelLayer_UIPropVO235.vid");
            result[926] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO235.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO235.initVisible");
            result[927] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO235.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO235.createLater");
            result[928] = binding;
            binding = new Binding(this, function ():Class
            {
                return (Moyintuce);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO236.cls = _arg_1;
            }, "_PanelLayer_UIPropVO236.cls");
            result[929] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_MOYINTUCE_PANEL);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO236.vid = _arg_1;
            }, "_PanelLayer_UIPropVO236.vid");
            result[930] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO236.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO236.initVisible");
            result[931] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO236.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO236.createLater");
            result[932] = binding;
            binding = new Binding(this, function ():Class
            {
                return (RedEnvelopePanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO237.cls = _arg_1;
            }, "_PanelLayer_UIPropVO237.cls");
            result[933] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_REDENVELOPE_PANEL);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO237.vid = _arg_1;
            }, "_PanelLayer_UIPropVO237.vid");
            result[934] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO237.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO237.initVisible");
            result[935] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO237.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO237.createLater");
            result[936] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MCZD);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO238.cls = _arg_1;
            }, "_PanelLayer_UIPropVO238.cls");
            result[937] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_MCZD);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO238.vid = _arg_1;
            }, "_PanelLayer_UIPropVO238.vid");
            result[938] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO238.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO238.initVisible");
            result[939] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO238.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO238.createLater");
            result[940] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MCZDPetFightConf);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO239.cls = _arg_1;
            }, "_PanelLayer_UIPropVO239.cls");
            result[941] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_MCZD_PETFIGHT_CONF);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO239.vid = _arg_1;
            }, "_PanelLayer_UIPropVO239.vid");
            result[942] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO239.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO239.initVisible");
            result[943] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO239.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO239.createLater");
            result[944] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MCZDTotalRankPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO240.cls = _arg_1;
            }, "_PanelLayer_UIPropVO240.cls");
            result[945] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_MCZD_ALL_RANK);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO240.vid = _arg_1;
            }, "_PanelLayer_UIPropVO240.vid");
            result[946] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO240.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO240.initVisible");
            result[947] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO240.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO240.createLater");
            result[948] = binding;
            binding = new Binding(this, function ():Class
            {
                return (JXHD);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO241.cls = _arg_1;
            }, "_PanelLayer_UIPropVO241.cls");
            result[949] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_JXHD);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO241.vid = _arg_1;
            }, "_PanelLayer_UIPropVO241.vid");
            result[950] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO241.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO241.initVisible");
            result[951] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO241.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO241.createLater");
            result[952] = binding;
            binding = new Binding(this, function ():Class
            {
                return (MQDTPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO242.cls = _arg_1;
            }, "_PanelLayer_UIPropVO242.cls");
            result[953] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_MQDT);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO242.vid = _arg_1;
            }, "_PanelLayer_UIPropVO242.vid");
            result[954] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO242.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO242.initVisible");
            result[955] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO242.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO242.createLater");
            result[956] = binding;
            binding = new Binding(this, function ():Class
            {
                return (TKYYHInfoPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO243.cls = _arg_1;
            }, "_PanelLayer_UIPropVO243.cls");
            result[957] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_TKYYHInfo);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO243.vid = _arg_1;
            }, "_PanelLayer_UIPropVO243.vid");
            result[958] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO243.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO243.initVisible");
            result[959] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO243.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO243.createLater");
            result[960] = binding;
            binding = new Binding(this, function ():Class
            {
                return (AnniversarySignInPanel);
            }, function (_arg_1:Class):void
            {
                _PanelLayer_UIPropVO244.cls = _arg_1;
            }, "_PanelLayer_UIPropVO244.cls");
            result[961] = binding;
            binding = new Binding(this, function ():int
            {
                return (ViewManager.PANEL_ANNIVERSARYSIGNIN);
            }, function (_arg_1:int):void
            {
                _PanelLayer_UIPropVO244.vid = _arg_1;
            }, "_PanelLayer_UIPropVO244.vid");
            result[962] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (false);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO244.initVisible = _arg_1;
            }, "_PanelLayer_UIPropVO244.initVisible");
            result[963] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (true);
            }, function (_arg_1:Boolean):void
            {
                _PanelLayer_UIPropVO244.createLater = _arg_1;
            }, "_PanelLayer_UIPropVO244.createLater");
            result[964] = binding;
            return (result);
        }

        private function _PanelLayer_UIPropVO108_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO108 = _local_1;
            _local_1.name = "转盘背包面板";
            _local_1.prop = {
                "dx":100,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO108", _PanelLayer_UIPropVO108);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO11_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO11 = _local_1;
            _local_1.name = "邮件面板";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO11", _PanelLayer_UIPropVO11);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO34_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO34 = _local_1;
            _local_1.name = "组队信息";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO34", _PanelLayer_UIPropVO34);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO57_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO57 = _local_1;
            _local_1.name = "公会手册";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO57", _PanelLayer_UIPropVO57);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO172_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO172 = _local_1;
            _local_1.name = "装扮图鉴";
            _local_1.prop = {
                "dx":100,
                "dy":30
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO172", _PanelLayer_UIPropVO172);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO195_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO195 = _local_1;
            _local_1.name = "黑曜石阵弹窗";
            _local_1.prop = {
                "dx":307,
                "dy":178
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO195", _PanelLayer_UIPropVO195);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO229_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO229 = _local_1;
            _local_1.name = "pkgame";
            _local_1.prop = {
                "dx":50,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO229", _PanelLayer_UIPropVO229);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO217_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO217 = _local_1;
            _local_1.name = "增加操作次数";
            _local_1.prop = {
                "dx":300,
                "dy":150
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO217", _PanelLayer_UIPropVO217);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO160_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO160 = _local_1;
            _local_1.name = "草裙舞";
            _local_1.prop = {
                "dx":133,
                "dy":64
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO160", _PanelLayer_UIPropVO160);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO22_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO22 = _local_1;
            _local_1.name = "信息面板";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO22", _PanelLayer_UIPropVO22);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO45_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO45 = _local_1;
            _local_1.name = "自动战斗";
            _local_1.style = {
                "right":2,
                "top":2
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO45", _PanelLayer_UIPropVO45);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO68_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO68 = _local_1;
            _local_1.name = "成就观察面板";
            _local_1.prop = {
                "dx":100,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO68", _PanelLayer_UIPropVO68);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO107_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO107 = _local_1;
            _local_1.name = "双十一转盘面板";
            _local_1.prop = {
                "dx":70,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO107", _PanelLayer_UIPropVO107);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO205_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO205 = _local_1;
            _local_1.name = "开垦能手";
            _local_1.prop = {
                "dx":70,
                "dy":10
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO205", _PanelLayer_UIPropVO205);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO183_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO183 = _local_1;
            _local_1.name = "神秘熔炉";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO183", _PanelLayer_UIPropVO183);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO10_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO10 = _local_1;
            _local_1.name = "邮件管理面板";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO10", _PanelLayer_UIPropVO10);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO33_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO33 = _local_1;
            _local_1.name = "道具商城购物车";
            _local_1.prop = {
                "dx":171,
                "dy":100
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO33", _PanelLayer_UIPropVO33);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO56_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO56 = _local_1;
            _local_1.name = "公会手册";
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO56", _PanelLayer_UIPropVO56);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO79_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO79 = _local_1;
            _local_1.name = "七夕活动告白面板";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO79", _PanelLayer_UIPropVO79);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO171_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO171 = _local_1;
            _local_1.name = "世界杯预测GOLD";
            _local_1.prop = {
                "dx":100,
                "dy":30
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO171", _PanelLayer_UIPropVO171);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO194_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO194 = _local_1;
            _local_1.name = "黑曜石阵";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO194", _PanelLayer_UIPropVO194);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO228_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO228 = _local_1;
            _local_1.name = "斗宠活动周排行榜";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO228", _PanelLayer_UIPropVO228);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO119_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO119 = _local_1;
            _local_1.name = "迷阵答题面板";
            _local_1.prop = {
                "dx":100,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO119", _PanelLayer_UIPropVO119);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO118_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO118 = _local_1;
            _local_1.name = "迷阵面板";
            _local_1.prop = {
                "dx":230,
                "dy":140
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO118", _PanelLayer_UIPropVO118);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO67_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO67 = _local_1;
            _local_1.name = "成就面板";
            _local_1.prop = {
                "dx":100,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO67", _PanelLayer_UIPropVO67);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO182_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO182 = _local_1;
            _local_1.name = "充值提醒面板";
            _local_1.prop = {
                "dx":307,
                "dy":178
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO182", _PanelLayer_UIPropVO182);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO21_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO21 = _local_1;
            _local_1.name = "技能面板";
            _local_1.prop = {
                "dx":500,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO21", _PanelLayer_UIPropVO21);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO44_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO44 = _local_1;
            _local_1.name = "答题面板";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO44", _PanelLayer_UIPropVO44);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO239_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO239 = _local_1;
            _local_1.name = "萌宠活动配置面板";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO239", _PanelLayer_UIPropVO239);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO204_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO204 = _local_1;
            _local_1.name = "魔力嘉年华排行榜";
            _local_1.prop = {
                "dx":70,
                "dy":10
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO204", _PanelLayer_UIPropVO204);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO129_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO129 = _local_1;
            _local_1.name = "暑期夏令营之激情竞速";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO129", _PanelLayer_UIPropVO129);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO106_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO106 = _local_1;
            _local_1.name = "幸运转盘面板";
            _local_1.prop = {
                "dx":70,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO106", _PanelLayer_UIPropVO106);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO216_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO216 = _local_1;
            _local_1.name = "宠装宝石";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO216", _PanelLayer_UIPropVO216);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO32_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO32 = _local_1;
            _local_1.name = "道具商城";
            _local_1.prop = {
                "dx":171,
                "dy":100
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO32", _PanelLayer_UIPropVO32);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO55_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO55 = _local_1;
            _local_1.name = "公会建筑进度";
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO55", _PanelLayer_UIPropVO55);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO78_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO78 = _local_1;
            _local_1.name = "答题系统面板";
            _local_1.prop = {
                "dx":100,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO78", _PanelLayer_UIPropVO78);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO170_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO170 = _local_1;
            _local_1.name = "世界杯预测";
            _local_1.prop = {
                "dx":100,
                "dy":30
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO170", _PanelLayer_UIPropVO170);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO193_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO193 = _local_1;
            _local_1.name = "月福利背包";
            _local_1.prop = {
                "dx":150,
                "dy":100
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO193", _PanelLayer_UIPropVO193);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO215_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO215 = _local_1;
            _local_1.name = "摸金";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO215", _PanelLayer_UIPropVO215);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO20_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO20 = _local_1;
            _local_1.name = "任务管理面板";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO20", _PanelLayer_UIPropVO20);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO43_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO43 = _local_1;
            _local_1.name = "公告栏任务面板";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO43", _PanelLayer_UIPropVO43);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO66_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO66 = _local_1;
            _local_1.name = "礼堂预定面板";
            _local_1.prop = {
                "dx":100,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO66", _PanelLayer_UIPropVO66);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO89_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO89 = _local_1;
            _local_1.name = "星宫-效果总览";
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO89", _PanelLayer_UIPropVO89);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO181_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO181 = _local_1;
            _local_1.name = "娃娃机兑换面板";
            _local_1.prop = {
                "dx":200,
                "dy":100
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO181", _PanelLayer_UIPropVO181);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO227_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO227 = _local_1;
            _local_1.name = "斗宠活动配置面板";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO227", _PanelLayer_UIPropVO227);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO105_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO105 = _local_1;
            _local_1.name = "VIP商城面板";
            _local_1.prop = {
                "dx":70,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO105", _PanelLayer_UIPropVO105);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO203_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO203 = _local_1;
            _local_1.name = "欢乐一线牵";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO203", _PanelLayer_UIPropVO203);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO128_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO128 = _local_1;
            _local_1.name = "暑期夏令营之能量宝石箱";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO128", _PanelLayer_UIPropVO128);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO31_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO31 = _local_1;
            _local_1.name = "聊天面板";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO31", _PanelLayer_UIPropVO31);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO54_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO54 = _local_1;
            _local_1.name = "公会技能开发";
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO54", _PanelLayer_UIPropVO54);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO77_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO77 = _local_1;
            _local_1.name = "宠物详细属性";
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO77", _PanelLayer_UIPropVO77);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO192_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO192 = _local_1;
            _local_1.name = "月福利弹窗";
            _local_1.prop = {
                "dx":307,
                "dy":178
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO192", _PanelLayer_UIPropVO192);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO226_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO226 = _local_1;
            _local_1.name = "斗宠活动排行榜";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO226", _PanelLayer_UIPropVO226);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO117_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO117 = _local_1;
            _local_1.name = "军衔按钮面板";
            _local_1.prop = {
                "dx":40,
                "dy":150
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO117", _PanelLayer_UIPropVO117);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO116_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO116 = _local_1;
            _local_1.name = "魔法秘阵面板";
            _local_1.prop = {
                "dx":100,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO116", _PanelLayer_UIPropVO116);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO65_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO65 = _local_1;
            _local_1.name = "征婚面板";
            _local_1.prop = {
                "dx":100,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO65", _PanelLayer_UIPropVO65);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO42_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO42 = _local_1;
            _local_1.name = "称号管理面板";
            _local_1.prop = {
                "dx":335,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO42", _PanelLayer_UIPropVO42);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO88_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO88 = _local_1;
            _local_1.name = "星宫-增加资质";
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO88", _PanelLayer_UIPropVO88);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO237_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO237 = _local_1;
            _local_1.name = "红包";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO237", _PanelLayer_UIPropVO237);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO139_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO139 = _local_1;
            _local_1.name = "组队跨服战面板";
            _local_1.prop = {
                "dx":125,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO139", _PanelLayer_UIPropVO139);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO180_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO180 = _local_1;
            _local_1.name = "娃娃机面板";
            _local_1.prop = {
                "dx":55,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO180", _PanelLayer_UIPropVO180);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO202_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO202 = _local_1;
            _local_1.name = "战魂斗魄";
            _local_1.prop = {
                "dx":100,
                "dy":30
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO202", _PanelLayer_UIPropVO202);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO104_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO104 = _local_1;
            _local_1.name = "材料兑换面板";
            _local_1.prop = {
                "dx":120,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO104", _PanelLayer_UIPropVO104);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO127_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO127 = _local_1;
            _local_1.name = "暑期夏令营之宠物对对碰";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO127", _PanelLayer_UIPropVO127);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO214_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO214 = _local_1;
            _local_1.name = "祈灵";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO214", _PanelLayer_UIPropVO214);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO53_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO53 = _local_1;
            _local_1.name = "建筑管理";
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO53", _PanelLayer_UIPropVO53);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO76_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO76 = _local_1;
            _local_1.name = "详细属性";
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO76", _PanelLayer_UIPropVO76);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO99_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO99 = _local_1;
            _local_1.name = "宠物炼命背包面板";
            _local_1.prop = {
                "dx":70,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO99", _PanelLayer_UIPropVO99);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO191_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO191 = _local_1;
            _local_1.name = "月福利";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO191", _PanelLayer_UIPropVO191);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO30_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO30 = _local_1;
            _local_1.name = "批量拍卖面板";
            _local_1.prop = {
                "dx":280,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO30", _PanelLayer_UIPropVO30);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO213_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO213 = _local_1;
            _local_1.name = "点石成金";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO213", _PanelLayer_UIPropVO213);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO138_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO138 = _local_1;
            _local_1.name = "战斗信息面板";
            _local_1.prop = {
                "dx":300,
                "dy":200
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO138", _PanelLayer_UIPropVO138);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO41_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO41 = _local_1;
            _local_1.name = "战斗设置面板";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO41", _PanelLayer_UIPropVO41);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO87_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO87 = _local_1;
            _local_1.name = "输入身份验证信息";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO87", _PanelLayer_UIPropVO87);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO64_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO64 = _local_1;
            _local_1.name = "翅膀染色面板";
            _local_1.prop = {
                "dx":100,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO64", _PanelLayer_UIPropVO64);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO115_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO115 = _local_1;
            _local_1.name = "抽奖背包面板";
            _local_1.prop = {
                "dx":100,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO115", _PanelLayer_UIPropVO115);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO225_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO225 = _local_1;
            _local_1.name = "斗宠活动面板";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO225", _PanelLayer_UIPropVO225);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO201_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO201 = _local_1;
            _local_1.name = "秘境结束自动寻宝";
            _local_1.prop = {
                "dx":307,
                "dy":178
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO201", _PanelLayer_UIPropVO201);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO103_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO103 = _local_1;
            _local_1.name = "VIP描述面板";
            _local_1.prop = {
                "dx":120,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO103", _PanelLayer_UIPropVO103);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO126_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO126 = _local_1;
            _local_1.name = "暑期夏令营之宠物捉迷藏";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO126", _PanelLayer_UIPropVO126);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO149_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO149 = _local_1;
            _local_1.name = "远征占领时间奖励面板";
            _local_1.prop = {
                "dx":200,
                "dy":100
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO149", _PanelLayer_UIPropVO149);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO236_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO236 = _local_1;
            _local_1.name = "魔印图册";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO236", _PanelLayer_UIPropVO236);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO52_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO52 = _local_1;
            _local_1.name = "建筑管理";
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO52", _PanelLayer_UIPropVO52);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO75_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO75 = _local_1;
            _local_1.name = "模板背包栏";
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO75", _PanelLayer_UIPropVO75);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO98_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO98 = _local_1;
            _local_1.name = "搭配送活动面板";
            _local_1.prop = {
                "dx":70,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO98", _PanelLayer_UIPropVO98);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO224_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO224 = _local_1;
            _local_1.name = "宠物雕刻空间配置";
            _local_1.prop = {
                "dx":50,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO224", _PanelLayer_UIPropVO224);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO63_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO63 = _local_1;
            _local_1.name = "染色面板";
            _local_1.prop = {
                "dx":100,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO63", _PanelLayer_UIPropVO63);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO40_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO40 = _local_1;
            _local_1.name = "采集面板";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO40", _PanelLayer_UIPropVO40);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO200_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO200 = _local_1;
            _local_1.name = "秘境结束弹窗";
            _local_1.prop = {
                "dx":307,
                "dy":178
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO200", _PanelLayer_UIPropVO200);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO86_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO86 = _local_1;
            _local_1.name = "多选物品选择框";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO86", _PanelLayer_UIPropVO86);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO125_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO125 = _local_1;
            _local_1.name = "暑期夏令营之小游戏";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO125", _PanelLayer_UIPropVO125);
            return (_local_1);
        }

        private function _PanelLayer_Array1_i():Array
        {
            var _local_1:Array = [_PanelLayer_UIPropVO1_i(), _PanelLayer_UIPropVO2_i(), _PanelLayer_UIPropVO3_i(), _PanelLayer_UIPropVO4_i(), _PanelLayer_UIPropVO5_i(), _PanelLayer_UIPropVO6_i(), _PanelLayer_UIPropVO7_i(), _PanelLayer_UIPropVO8_i(), _PanelLayer_UIPropVO9_i(), _PanelLayer_UIPropVO10_i(), _PanelLayer_UIPropVO11_i(), _PanelLayer_UIPropVO12_i(), _PanelLayer_UIPropVO13_i(), _PanelLayer_UIPropVO14_i(), _PanelLayer_UIPropVO15_i(), _PanelLayer_UIPropVO16_i(), _PanelLayer_UIPropVO17_i(), _PanelLayer_UIPropVO18_i(), _PanelLayer_UIPropVO19_i(), _PanelLayer_UIPropVO20_i(), _PanelLayer_UIPropVO21_i(), _PanelLayer_UIPropVO22_i(), _PanelLayer_UIPropVO23_i(), _PanelLayer_UIPropVO24_i(), _PanelLayer_UIPropVO25_i(), _PanelLayer_UIPropVO26_i(), _PanelLayer_UIPropVO27_i(), _PanelLayer_UIPropVO28_i(), _PanelLayer_UIPropVO29_i(), _PanelLayer_UIPropVO30_i(), _PanelLayer_UIPropVO31_i(), _PanelLayer_UIPropVO32_i(), _PanelLayer_UIPropVO33_i(), _PanelLayer_UIPropVO34_i(), _PanelLayer_UIPropVO35_i(), _PanelLayer_UIPropVO36_i(), _PanelLayer_UIPropVO37_i(), _PanelLayer_UIPropVO38_i(), _PanelLayer_UIPropVO39_i(), _PanelLayer_UIPropVO40_i(), _PanelLayer_UIPropVO41_i(), _PanelLayer_UIPropVO42_i(), _PanelLayer_UIPropVO43_i(), _PanelLayer_UIPropVO44_i(), _PanelLayer_UIPropVO45_i(), _PanelLayer_UIPropVO46_i(), _PanelLayer_UIPropVO47_i(), _PanelLayer_UIPropVO48_i(), _PanelLayer_UIPropVO49_i(), _PanelLayer_UIPropVO50_i(), _PanelLayer_UIPropVO51_i(), _PanelLayer_UIPropVO52_i(), _PanelLayer_UIPropVO53_i(), _PanelLayer_UIPropVO54_i(), _PanelLayer_UIPropVO55_i(), _PanelLayer_UIPropVO56_i(), _PanelLayer_UIPropVO57_i(), _PanelLayer_UIPropVO58_i(), _PanelLayer_UIPropVO59_i(), _PanelLayer_UIPropVO60_i(), _PanelLayer_UIPropVO61_i(), _PanelLayer_UIPropVO62_i(), _PanelLayer_UIPropVO63_i(), _PanelLayer_UIPropVO64_i(), _PanelLayer_UIPropVO65_i(), _PanelLayer_UIPropVO66_i(), _PanelLayer_UIPropVO67_i(), _PanelLayer_UIPropVO68_i(), _PanelLayer_UIPropVO69_i(), _PanelLayer_UIPropVO70_i(), _PanelLayer_UIPropVO71_i(), _PanelLayer_UIPropVO72_i(), _PanelLayer_UIPropVO73_i(), _PanelLayer_UIPropVO74_i(), _PanelLayer_UIPropVO75_i(), _PanelLayer_UIPropVO76_i(), _PanelLayer_UIPropVO77_i(), _PanelLayer_UIPropVO78_i(), _PanelLayer_UIPropVO79_i(), _PanelLayer_UIPropVO80_i(), _PanelLayer_UIPropVO81_i(), _PanelLayer_UIPropVO82_i(), _PanelLayer_UIPropVO83_i(), _PanelLayer_UIPropVO84_i(), _PanelLayer_UIPropVO85_i(), _PanelLayer_UIPropVO86_i(), _PanelLayer_UIPropVO87_i(), _PanelLayer_UIPropVO88_i(), _PanelLayer_UIPropVO89_i(), _PanelLayer_UIPropVO90_i(), _PanelLayer_UIPropVO91_i(), _PanelLayer_UIPropVO92_i(), _PanelLayer_UIPropVO93_i(), _PanelLayer_UIPropVO94_i(), _PanelLayer_UIPropVO95_i(), _PanelLayer_UIPropVO96_i(), _PanelLayer_UIPropVO97_i(), _PanelLayer_UIPropVO98_i(), _PanelLayer_UIPropVO99_i(), _PanelLayer_UIPropVO100_i(), _PanelLayer_UIPropVO101_i(), _PanelLayer_UIPropVO102_i(), _PanelLayer_UIPropVO103_i(), _PanelLayer_UIPropVO104_i(), _PanelLayer_UIPropVO105_i(), _PanelLayer_UIPropVO106_i(), _PanelLayer_UIPropVO107_i(), _PanelLayer_UIPropVO108_i(), _PanelLayer_UIPropVO109_i(), _PanelLayer_UIPropVO110_i(), _PanelLayer_UIPropVO111_i(), _PanelLayer_UIPropVO112_i(), _PanelLayer_UIPropVO113_i(), _PanelLayer_UIPropVO114_i(), _PanelLayer_UIPropVO115_i(), _PanelLayer_UIPropVO116_i(), _PanelLayer_UIPropVO117_i(), _PanelLayer_UIPropVO118_i(), _PanelLayer_UIPropVO119_i(), _PanelLayer_UIPropVO120_i(), _PanelLayer_UIPropVO121_i(), _PanelLayer_UIPropVO122_i(), _PanelLayer_UIPropVO123_i(), _PanelLayer_UIPropVO124_i(), _PanelLayer_UIPropVO125_i(), _PanelLayer_UIPropVO126_i(), _PanelLayer_UIPropVO127_i(), _PanelLayer_UIPropVO128_i(), _PanelLayer_UIPropVO129_i(), _PanelLayer_UIPropVO130_i(), _PanelLayer_UIPropVO131_i(), _PanelLayer_UIPropVO132_i(), _PanelLayer_UIPropVO133_i(), _PanelLayer_UIPropVO134_i(), _PanelLayer_UIPropVO135_i(), _PanelLayer_UIPropVO136_i(), _PanelLayer_UIPropVO137_i(), _PanelLayer_UIPropVO138_i(), _PanelLayer_UIPropVO139_i(), _PanelLayer_UIPropVO140_i(), _PanelLayer_UIPropVO141_i(), _PanelLayer_UIPropVO142_i(), _PanelLayer_UIPropVO143_i(), _PanelLayer_UIPropVO144_i(), _PanelLayer_UIPropVO145_i(), _PanelLayer_UIPropVO146_i(), _PanelLayer_UIPropVO147_i(), _PanelLayer_UIPropVO148_i(), _PanelLayer_UIPropVO149_i(), _PanelLayer_UIPropVO150_i(), _PanelLayer_UIPropVO151_i(), _PanelLayer_UIPropVO152_i(), _PanelLayer_UIPropVO153_i(), _PanelLayer_UIPropVO154_i(), _PanelLayer_UIPropVO155_i(), _PanelLayer_UIPropVO156_i(), _PanelLayer_UIPropVO157_i(), _PanelLayer_UIPropVO158_i(), _PanelLayer_UIPropVO159_i(), _PanelLayer_UIPropVO160_i(), _PanelLayer_UIPropVO161_i(), _PanelLayer_UIPropVO162_i(), _PanelLayer_UIPropVO163_i(), _PanelLayer_UIPropVO164_i(), _PanelLayer_UIPropVO165_i(), _PanelLayer_UIPropVO166_i(), _PanelLayer_UIPropVO167_i(), _PanelLayer_UIPropVO168_i(), _PanelLayer_UIPropVO169_i(), _PanelLayer_UIPropVO170_i(), _PanelLayer_UIPropVO171_i(), _PanelLayer_UIPropVO172_i(), _PanelLayer_UIPropVO173_i(), _PanelLayer_UIPropVO174_i(), _PanelLayer_UIPropVO175_i(), _PanelLayer_UIPropVO176_i(), _PanelLayer_UIPropVO177_i(), _PanelLayer_UIPropVO178_i(), _PanelLayer_UIPropVO179_i(), _PanelLayer_UIPropVO180_i(), _PanelLayer_UIPropVO181_i(), _PanelLayer_UIPropVO182_i(), _PanelLayer_UIPropVO183_i(), _PanelLayer_UIPropVO184_i(), _PanelLayer_UIPropVO185_i(), _PanelLayer_UIPropVO186_i(), _PanelLayer_UIPropVO187_i(), _PanelLayer_UIPropVO188_i(), _PanelLayer_UIPropVO189_i(), _PanelLayer_UIPropVO190_i(), _PanelLayer_UIPropVO191_i(), _PanelLayer_UIPropVO192_i(), _PanelLayer_UIPropVO193_i(), _PanelLayer_UIPropVO194_i(), _PanelLayer_UIPropVO195_i(), _PanelLayer_UIPropVO196_i(), _PanelLayer_UIPropVO197_i(), _PanelLayer_UIPropVO198_i(), _PanelLayer_UIPropVO199_i(), _PanelLayer_UIPropVO200_i(), _PanelLayer_UIPropVO201_i(), _PanelLayer_UIPropVO202_i(), _PanelLayer_UIPropVO203_i(), _PanelLayer_UIPropVO204_i(), _PanelLayer_UIPropVO205_i(), _PanelLayer_UIPropVO206_i(), _PanelLayer_UIPropVO207_i(), _PanelLayer_UIPropVO208_i(), _PanelLayer_UIPropVO209_i(), _PanelLayer_UIPropVO210_i(), _PanelLayer_UIPropVO211_i(), _PanelLayer_UIPropVO212_i(), _PanelLayer_UIPropVO213_i(), _PanelLayer_UIPropVO214_i(), _PanelLayer_UIPropVO215_i(), _PanelLayer_UIPropVO216_i(), _PanelLayer_UIPropVO217_i(), _PanelLayer_UIPropVO218_i(), _PanelLayer_UIPropVO219_i(), _PanelLayer_UIPropVO220_i(), _PanelLayer_UIPropVO221_i(), _PanelLayer_UIPropVO222_i(), _PanelLayer_UIPropVO223_i(), _PanelLayer_UIPropVO224_i(), _PanelLayer_UIPropVO225_i(), _PanelLayer_UIPropVO226_i(), _PanelLayer_UIPropVO227_i(), _PanelLayer_UIPropVO228_i(), _PanelLayer_UIPropVO229_i(), _PanelLayer_UIPropVO230_i(), _PanelLayer_UIPropVO231_i(), _PanelLayer_UIPropVO232_i(), _PanelLayer_UIPropVO233_i(), _PanelLayer_UIPropVO234_i(), _PanelLayer_UIPropVO235_i(), _PanelLayer_UIPropVO236_i(), _PanelLayer_UIPropVO237_i(), _PanelLayer_UIPropVO238_i(), _PanelLayer_UIPropVO239_i(), _PanelLayer_UIPropVO240_i(), _PanelLayer_UIPropVO241_i(), _PanelLayer_UIPropVO242_i(), _PanelLayer_UIPropVO243_i(), _PanelLayer_UIPropVO244_i()];
            uiList = _local_1;
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO9_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO9 = _local_1;
            _local_1.name = "帮助面板";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO9", _PanelLayer_UIPropVO9);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO114_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO114 = _local_1;
            _local_1.name = "真情回馈幸运大抽奖";
            _local_1.prop = {
                "dx":70,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO114", _PanelLayer_UIPropVO114);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO51_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO51 = _local_1;
            _local_1.name = "公会仓库";
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO51", _PanelLayer_UIPropVO51);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO74_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO74 = _local_1;
            _local_1.name = "翅膀高级合成面板";
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO74", _PanelLayer_UIPropVO74);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO97_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO97 = _local_1;
            _local_1.name = "九层Boss(众生之劫)面板";
            _local_1.prop = {
                "dx":70,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO97", _PanelLayer_UIPropVO97);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO7_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO7 = _local_1;
            _local_1.name = "工会面板";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO7", _PanelLayer_UIPropVO7);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO100_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO100 = _local_1;
            _local_1.name = "宠物炼命经验注入面板";
            _local_1.prop = {
                "dx":410,
                "dy":185
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO100", _PanelLayer_UIPropVO100);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO61_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO61 = _local_1;
            _local_1.name = "许愿背包面板";
            _local_1.prop = {
                "dx":100,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO61", _PanelLayer_UIPropVO61);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO73_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO73 = _local_1;
            _local_1.name = "小精灵";
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO73", _PanelLayer_UIPropVO73);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO96_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO96 = _local_1;
            _local_1.name = "新服内置活动面板";
            _local_1.prop = {
                "dx":70,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO96", _PanelLayer_UIPropVO96);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO235_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO235 = _local_1;
            _local_1.name = "幻魔塔修炼";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO235", _PanelLayer_UIPropVO235);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO112_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO112 = _local_1;
            _local_1.name = "坐骑面板";
            _local_1.prop = {
                "dx":100,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO112", _PanelLayer_UIPropVO112);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO72_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO72 = _local_1;
            _local_1.name = "翅膀改造面板";
            _local_1.prop = {
                "dx":100,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO72", _PanelLayer_UIPropVO72);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO95_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO95 = _local_1;
            _local_1.name = "扫荡面板";
            _local_1.prop = {
                "dx":300,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO95", _PanelLayer_UIPropVO95);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO85_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO85 = _local_1;
            _local_1.name = "宠物竞技上周排行榜";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO85", _PanelLayer_UIPropVO85);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO111_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO111 = _local_1;
            _local_1.name = "PVP战报面板";
            _local_1.prop = {
                "dx":335,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO111", _PanelLayer_UIPropVO111);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO134_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO134 = _local_1;
            _local_1.name = "找回面板";
            _local_1.prop = {
                "dx":125,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO134", _PanelLayer_UIPropVO134);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO157_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO157 = _local_1;
            _local_1.name = "宝石封印功能面板";
            _local_1.prop = {
                "dx":300,
                "dy":200
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO157", _PanelLayer_UIPropVO157);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO8_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO8 = _local_1;
            _local_1.name = "工会创建面板";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO8", _PanelLayer_UIPropVO8);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO102_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO102 = _local_1;
            _local_1.name = "VIP面板";
            _local_1.prop = {
                "dx":70,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO102", _PanelLayer_UIPropVO102);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO19_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO19 = _local_1;
            _local_1.name = "任务面板";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO19", _PanelLayer_UIPropVO19);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO148_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO148 = _local_1;
            _local_1.name = "远征战斗积分奖励面板";
            _local_1.prop = {
                "dx":200,
                "dy":100
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO148", _PanelLayer_UIPropVO148);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO123_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO123 = _local_1;
            _local_1.name = "迷阵玩法规则面板";
            _local_1.prop = {
                "dx":100,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO123", _PanelLayer_UIPropVO123);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO60_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO60 = _local_1;
            _local_1.name = "许愿面板";
            _local_1.prop = {
                "dx":100,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO60", _PanelLayer_UIPropVO60);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO83_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO83 = _local_1;
            _local_1.name = "宠物竞技面板";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO83", _PanelLayer_UIPropVO83);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO146_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO146 = _local_1;
            _local_1.name = "魔力远征战斗准备面板";
            _local_1.prop = {
                "dx":300,
                "dy":200
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO146", _PanelLayer_UIPropVO146);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO169_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO169 = _local_1;
            _local_1.name = "暑期小游戏(赛马)面板";
            _local_1.prop = {
                "dx":100,
                "dy":30
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO169", _PanelLayer_UIPropVO169);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO190_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO190 = _local_1;
            _local_1.name = "欢乐消除";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO190", _PanelLayer_UIPropVO190);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO122_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO122 = _local_1;
            _local_1.name = "迷阵事件信息面板";
            _local_1.prop = {
                "dx":100,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO122", _PanelLayer_UIPropVO122);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO145_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO145 = _local_1;
            _local_1.name = "魔力远征BOSS单位置介绍面板";
            _local_1.prop = {
                "dx":300,
                "dy":200
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO145", _PanelLayer_UIPropVO145);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO168_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO168 = _local_1;
            _local_1.name = "暑期小游戏(三消)面板";
            _local_1.prop = {
                "dx":100,
                "dy":30
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO168", _PanelLayer_UIPropVO168);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO50_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO50 = _local_1;
            _local_1.name = "公会捐献";
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO50", _PanelLayer_UIPropVO50);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO233_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO233 = _local_1;
            _local_1.name = "特训课程";
            _local_1.prop = {
                "dx":10,
                "dy":10
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO233", _PanelLayer_UIPropVO233);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO6_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO6 = _local_1;
            _local_1.name = "聊天面板";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO6", _PanelLayer_UIPropVO6);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO124_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO124 = _local_1;
            _local_1.name = "迷阵描述面板";
            _local_1.prop = {
                "dx":100,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO124", _PanelLayer_UIPropVO124);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO62_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO62 = _local_1;
            _local_1.name = "临时背包面板";
            _local_1.prop = {
                "dx":100,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO62", _PanelLayer_UIPropVO62);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO211_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO211 = _local_1;
            _local_1.name = "携手岁月";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO211", _PanelLayer_UIPropVO211);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO113_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO113 = _local_1;
            _local_1.name = "转生形象转换面板";
            _local_1.prop = {
                "dx":100,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO113", _PanelLayer_UIPropVO113);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO136_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO136 = _local_1;
            _local_1.name = "跨服战队伍信息面板";
            _local_1.prop = {
                "dx":300,
                "dy":200
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO136", _PanelLayer_UIPropVO136);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO159_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO159 = _local_1;
            _local_1.name = "宝石封印功能面板";
            _local_1.prop = {
                "dx":125,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO159", _PanelLayer_UIPropVO159);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO220_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO220 = _local_1;
            _local_1.name = "对对碰";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO220", _PanelLayer_UIPropVO220);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO71_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO71 = _local_1;
            _local_1.name = "今日活动面板";
            _local_1.prop = {
                "dx":100,
                "dy":40
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO71", _PanelLayer_UIPropVO71);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO18_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO18 = _local_1;
            _local_1.name = "NPC脚本功能";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO18", _PanelLayer_UIPropVO18);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO110_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO110 = _local_1;
            _local_1.name = "签到有礼面板";
            _local_1.prop = {
                "dx":100,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO110", _PanelLayer_UIPropVO110);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO133_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO133 = _local_1;
            _local_1.name = "宠物进化面板";
            _local_1.prop = {
                "dx":125,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO133", _PanelLayer_UIPropVO133);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO94_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO94 = _local_1;
            _local_1.name = "福利计划面板";
            _local_1.prop = {
                "dx":70,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO94", _PanelLayer_UIPropVO94);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO179_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO179 = _local_1;
            _local_1.name = "人物觉醒";
            _local_1.prop = {
                "dx":100,
                "dy":30
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO179", _PanelLayer_UIPropVO179);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO101_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO101 = _local_1;
            _local_1.name = "卡牌游戏面板";
            _local_1.prop = {
                "dx":85,
                "dy":75
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO101", _PanelLayer_UIPropVO101);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO147_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO147 = _local_1;
            _local_1.name = "远征战斗首战奖励面板";
            _local_1.prop = {
                "dx":200,
                "dy":100
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO147", _PanelLayer_UIPropVO147);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO243_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO243 = _local_1;
            _local_1.name = "天空游园会";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO243", _PanelLayer_UIPropVO243);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO231_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO231 = _local_1;
            _local_1.name = "消除大赛";
            _local_1.prop = {
                "dx":20,
                "dy":20
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO231", _PanelLayer_UIPropVO231);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO156_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO156 = _local_1;
            _local_1.name = "宝石封印";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO156", _PanelLayer_UIPropVO156);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO137_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO137 = _local_1;
            _local_1.name = "小精灵技能配置面板";
            _local_1.prop = {
                "dx":300,
                "dy":200
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO137", _PanelLayer_UIPropVO137);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO29_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO29 = _local_1;
            _local_1.name = "拍卖面板";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO29", _PanelLayer_UIPropVO29);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO82_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO82 = _local_1;
            _local_1.name = "宠物战斗配置面板";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO82", _PanelLayer_UIPropVO82);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO121_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO121 = _local_1;
            _local_1.name = "迷阵抽奖面板";
            _local_1.prop = {
                "dx":100,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO121", _PanelLayer_UIPropVO121);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO144_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO144 = _local_1;
            _local_1.name = "魔力远征单位置介绍面板";
            _local_1.prop = {
                "dx":300,
                "dy":200
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO144", _PanelLayer_UIPropVO144);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO167_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO167 = _local_1;
            _local_1.name = "暑期小游戏(开垦)面板";
            _local_1.prop = {
                "dx":100,
                "dy":30
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO167", _PanelLayer_UIPropVO167);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO232_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO232 = _local_1;
            _local_1.name = "双十二预购";
            _local_1.prop = {
                "dx":20,
                "dy":20
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO232", _PanelLayer_UIPropVO232);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO5_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO5 = _local_1;
            _local_1.name = "角色面板";
            _local_1.prop = {
                "dx":70,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO5", _PanelLayer_UIPropVO5);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO244_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO244 = _local_1;
            _local_1.name = "周年签到";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO244", _PanelLayer_UIPropVO244);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO242_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO242 = _local_1;
            _local_1.name = "默契答题";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO242", _PanelLayer_UIPropVO242);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO84_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO84 = _local_1;
            _local_1.name = "宠物竞技排行榜";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO84", _PanelLayer_UIPropVO84);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO210_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO210 = _local_1;
            _local_1.name = "宠物护卫";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO210", _PanelLayer_UIPropVO210);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO234_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO234 = _local_1;
            _local_1.name = "特训经验购买";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO234", _PanelLayer_UIPropVO234);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO135_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO135 = _local_1;
            _local_1.name = "跨服战面板";
            _local_1.prop = {
                "dx":125,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO135", _PanelLayer_UIPropVO135);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO158_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO158 = _local_1;
            _local_1.name = "星碎兑换面板";
            _local_1.prop = {
                "dx":120,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO158", _PanelLayer_UIPropVO158);
            return (_local_1);
        }

        override public function initialize():void
        {
            var target:PanelLayer;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PanelLayer_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_PanelLayerWatcherSetupUtil");
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

        private function _PanelLayer_UIPropVO223_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO223 = _local_1;
            _local_1.name = "宠物雕刻空间";
            _local_1.prop = {
                "dx":50,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO223", _PanelLayer_UIPropVO223);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO17_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO17 = _local_1;
            _local_1.name = "NPC功能其他";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO17", _PanelLayer_UIPropVO17);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO70_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO70 = _local_1;
            _local_1.name = "玩法推荐面板";
            _local_1.prop = {
                "dx":100,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO70", _PanelLayer_UIPropVO70);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO93_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO93 = _local_1;
            _local_1.name = "世界BOSS计时面板";
            _local_1.prop = {
                "dx":300,
                "dy":300
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO93", _PanelLayer_UIPropVO93);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO155_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO155 = _local_1;
            _local_1.name = "元宵节翻牌抽字活动";
            _local_1.prop = {
                "dx":133,
                "dy":64
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO155", _PanelLayer_UIPropVO155);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO178_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO178 = _local_1;
            _local_1.name = "魔物手记面板";
            _local_1.prop = {
                "dx":125,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO178", _PanelLayer_UIPropVO178);
            return (_local_1);
        }

        private function _PanelLayer_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = BagPanel;
            _local_1 = ViewManager.PANEL_BAG;
            _local_1 = false;
            _local_1 = false;
            _local_1 = ShopPanel;
            _local_1 = ViewManager.PANEL_SHOP;
            _local_1 = false;
            _local_1 = false;
            _local_1 = AwardPanelAll;
            _local_1 = ViewManager.PANEL_AWARD_ALL;
            _local_1 = false;
            _local_1 = true;
            _local_1 = BankPanel;
            _local_1 = ViewManager.PANEL_BANK;
            _local_1 = false;
            _local_1 = false;
            _local_1 = CharactorPanel;
            _local_1 = ViewManager.PANEL_CHARACTOR;
            _local_1 = false;
            _local_1 = false;
            _local_1 = ChatPanelManager;
            _local_1 = ViewManager.PANEL_CHATMANAGER;
            _local_1 = false;
            _local_1 = true;
            _local_1 = GuildPanel;
            _local_1 = ViewManager.PANEL_GUILD;
            _local_1 = false;
            _local_1 = true;
            _local_1 = AddGuildPanel;
            _local_1 = ViewManager.PANEL_ADDGUILD;
            _local_1 = false;
            _local_1 = true;
            _local_1 = HelpPanel;
            _local_1 = ViewManager.PANEL_HELP;
            _local_1 = false;
            _local_1 = false;
            _local_1 = MailManagerPanel;
            _local_1 = ViewManager.PANEL_MAILMANAGER;
            _local_1 = false;
            _local_1 = true;
            _local_1 = MailPanel;
            _local_1 = ViewManager.PANEL_MAIL;
            _local_1 = false;
            _local_1 = true;
            _local_1 = MapPanel;
            _local_1 = ViewManager.PANEL_MAP;
            _local_1 = false;
            _local_1 = true;
            _local_1 = CharactorInfoPanel;
            _local_1 = ViewManager.PANEL_CHARACTORINFO;
            _local_1 = false;
            _local_1 = true;
            _local_1 = PetManagerPanel;
            _local_1 = ViewManager.PANEL_PETMANAGER;
            _local_1 = false;
            _local_1 = false;
            _local_1 = PetPanel;
            _local_1 = ViewManager.PANEL_PET;
            _local_1 = false;
            _local_1 = true;
            _local_1 = NpcFuncPanel;
            _local_1 = ViewManager.PANEL_NPCFUNC;
            _local_1 = false;
            _local_1 = true;
            _local_1 = NpcFuncOther;
            _local_1 = ViewManager.PANEL_NPCFUNCOTHER;
            _local_1 = false;
            _local_1 = true;
            _local_1 = NpcScriptPanel;
            _local_1 = ViewManager.PANEL_NPCSCRIPT;
            _local_1 = false;
            _local_1 = true;
            _local_1 = QuestPanel;
            _local_1 = ViewManager.PANEL_QUEST;
            _local_1 = false;
            _local_1 = true;
            _local_1 = QuestManager;
            _local_1 = ViewManager.PANEL_QUESTMANAGER;
            _local_1 = false;
            _local_1 = true;
            _local_1 = SkillManager;
            _local_1 = ViewManager.PANEL_SKILLMANAGER;
            _local_1 = false;
            _local_1 = true;
            _local_1 = TextPanel;
            _local_1 = ViewManager.PANEL_TXT;
            _local_1 = false;
            _local_1 = true;
            _local_1 = TradePanel;
            _local_1 = ViewManager.PANEL_TRADE;
            _local_1 = false;
            _local_1 = true;
            _local_1 = UserSystemSetPanel;
            _local_1 = ViewManager.PANEL_SYSTEM;
            _local_1 = false;
            _local_1 = true;
            _local_1 = EquiptFuncPanel;
            _local_1 = ViewManager.PANEL_EQUIPTFUNC;
            _local_1 = false;
            _local_1 = true;
            _local_1 = PetFuncPanel;
            _local_1 = ViewManager.PANEL_PETFUNC;
            _local_1 = false;
            _local_1 = true;
            _local_1 = PetAdvancedPanel;
            _local_1 = ViewManager.PANEL_PETADVANCED;
            _local_1 = false;
            _local_1 = true;
            _local_1 = SkillLearningPanel;
            _local_1 = ViewManager.PANEL_LEARNSKILL;
            _local_1 = false;
            _local_1 = true;
            _local_1 = AuctionPanel;
            _local_1 = ViewManager.PANEL_AUCTION;
            _local_1 = false;
            _local_1 = true;
            _local_1 = PMAuctionPanel;
            _local_1 = ViewManager.PANEL_PM_AUCTION;
            _local_1 = false;
            _local_1 = false;
            _local_1 = IMPanel;
            _local_1 = ViewManager.PANEL_IM;
            _local_1 = false;
            _local_1 = true;
            _local_1 = SystemShopPanel;
            _local_1 = ViewManager.PANEL_SYSTEM_SHOP;
            _local_1 = false;
            _local_1 = true;
            _local_1 = SystemShopTrolleyPanel;
            _local_1 = ViewManager.PANEL_SYSTEM_SHOP_TROLLEY;
            _local_1 = false;
            _local_1 = false;
            _local_1 = GroupPanel;
            _local_1 = ViewManager.PANEL_GROUP;
            _local_1 = false;
            _local_1 = true;
            _local_1 = GroupRecruitPanel;
            _local_1 = ViewManager.PANEL_GROUP_RECRUIT;
            _local_1 = false;
            _local_1 = true;
            _local_1 = GroupRecruitNewPanel;
            _local_1 = ViewManager.PANEL_GROUP_RECRUIT_NEW;
            _local_1 = false;
            _local_1 = true;
            _local_1 = GroupRecruitDetailPanel;
            _local_1 = ViewManager.PANEL_GROUP_RECRUIT_DETAIL;
            _local_1 = false;
            _local_1 = true;
            _local_1 = Treasure;
            _local_1 = ViewManager.PANEL_TREASURE;
            _local_1 = false;
            _local_1 = true;
            _local_1 = ExchangePanel;
            _local_1 = ViewManager.PANEL_EXCHANGE;
            _local_1 = false;
            _local_1 = true;
            _local_1 = ProductPanel;
            _local_1 = ViewManager.PANEL_PRODUCT;
            _local_1 = false;
            _local_1 = true;
            _local_1 = BattleSettingPanel;
            _local_1 = ViewManager.PANEL_BATTLESET;
            _local_1 = false;
            _local_1 = true;
            _local_1 = TitleSelectPanel;
            _local_1 = ViewManager.PANEL_TITLE;
            _local_1 = false;
            _local_1 = true;
            _local_1 = CallBoardPanel;
            _local_1 = ViewManager.PANEL_CALLBOARD;
            _local_1 = false;
            _local_1 = true;
            _local_1 = AnswerPanel;
            _local_1 = ViewManager.PANEL_ANSWER;
            _local_1 = false;
            _local_1 = true;
            _local_1 = AutoBattleCanvas;
            _local_1 = ViewManager.PANEL_BATTLEAUTO;
            _local_1 = false;
            _local_1 = true;
            _local_1 = AwardPanel;
            _local_1 = ViewManager.PANEL_AWARD;
            _local_1 = false;
            _local_1 = true;
            _local_1 = AutoExpPanel;
            _local_1 = ViewManager.MAIN_AUTO_EXP;
            _local_1 = false;
            _local_1 = BloodAddPanel;
            _local_1 = ViewManager.PANEL_BLOODADD;
            _local_1 = false;
            _local_1 = ActivePanel;
            _local_1 = ViewManager.PANEL_ACTIVE;
            _local_1 = false;
            _local_1 = true;
            _local_1 = GuildContribPanel;
            _local_1 = ViewManager.PANEL_GUILDCONTRIB;
            _local_1 = false;
            _local_1 = GuildWarehousePanel;
            _local_1 = ViewManager.PANEL_GUILDWAREHOUSE;
            _local_1 = false;
            _local_1 = ConstructionManager;
            _local_1 = ViewManager.PANEL_CONSTRUCTIONMANAGER;
            _local_1 = false;
            _local_1 = BuildInfoPanel;
            _local_1 = ViewManager.PANEL_BUILDINFO;
            _local_1 = false;
            _local_1 = GuildSkillDevPanel;
            _local_1 = ViewManager.PANEL_GUILD_SKILL_DEV;
            _local_1 = false;
            _local_1 = GuildBuildProcess;
            _local_1 = ViewManager.PANEL_BUILDPROCESS;
            _local_1 = false;
            _local_1 = GuildHelpPanel;
            _local_1 = ViewManager.PANEL_GUILDHELP;
            _local_1 = false;
            _local_1 = NpcShowMsgPanel;
            _local_1 = ViewManager.PANEL_NPCSHOWMSG;
            _local_1 = false;
            _local_1 = NpcShowRankPanel;
            _local_1 = ViewManager.PANEL_NPCSHOWRANK;
            _local_1 = false;
            _local_1 = LifeSkillPanel;
            _local_1 = ViewManager.PANEL_LIFESKILL;
            _local_1 = false;
            _local_1 = true;
            _local_1 = LottoPanel;
            _local_1 = ViewManager.PANEL_LOTTO;
            _local_1 = false;
            _local_1 = true;
            _local_1 = LottoBagPanel;
            _local_1 = ViewManager.PANEL_LOTTO_BAG;
            _local_1 = false;
            _local_1 = true;
            _local_1 = TemporaryBagPanel;
            _local_1 = ViewManager.PANEL_TEMPORARY_BAG;
            _local_1 = false;
            _local_1 = true;
            _local_1 = ChangeColorPanel;
            _local_1 = ViewManager.PANEL_CHANGE_COLOR;
            _local_1 = false;
            _local_1 = true;
            _local_1 = ChangeWingColorPanel;
            _local_1 = ViewManager.PANEL_WING_COLOR;
            _local_1 = false;
            _local_1 = true;
            _local_1 = MarriageManagerPanel;
            _local_1 = ViewManager.PANEL_MARRIAGE;
            _local_1 = false;
            _local_1 = true;
            _local_1 = WeddingBookPanel;
            _local_1 = ViewManager.PANEL_WEDDING_BOOK;
            _local_1 = false;
            _local_1 = true;
            _local_1 = AchievementPanel;
            _local_1 = ViewManager.PANEL_ACHIEVE;
            _local_1 = false;
            _local_1 = true;
            _local_1 = AchievementComparePanel;
            _local_1 = ViewManager.PANEL_ACHIEVE_WATCHING;
            _local_1 = false;
            _local_1 = true;
            _local_1 = CrossBattleRank;
            _local_1 = ViewManager.PANEL_CROSS_BATTLE_RANK;
            _local_1 = false;
            _local_1 = true;
            _local_1 = GameIntroPanel;
            _local_1 = ViewManager.PANEL_GAMEINTRO;
            _local_1 = false;
            _local_1 = true;
            _local_1 = DailyActPanel;
            _local_1 = ViewManager.DAILY_ACTIVITY;
            _local_1 = false;
            _local_1 = false;
            _local_1 = WingFuncPanel;
            _local_1 = ViewManager.PANEL_WING_FUNC;
            _local_1 = false;
            _local_1 = true;
            _local_1 = FairyManagerPanel;
            _local_1 = ViewManager.PANEL_FAIRY_MANAGER;
            _local_1 = false;
            _local_1 = true;
            _local_1 = WingAdvancedPanel;
            _local_1 = ViewManager.PANEL_WING_ADVANCED;
            _local_1 = false;
            _local_1 = true;
            _local_1 = TempBagSlot;
            _local_1 = ViewManager.POP_TEMP_BAG_SLOT;
            _local_1 = false;
            _local_1 = true;
            _local_1 = DetailPropPanel;
            _local_1 = ViewManager.DETAIL_PROP_PANEL;
            _local_1 = false;
            _local_1 = true;
            _local_1 = DetailPropPanel;
            _local_1 = ViewManager.DETAIL_PROP_PANEL_PET;
            _local_1 = false;
            _local_1 = true;
            _local_1 = QuestioningPanel;
            _local_1 = ViewManager.PANEL_QUESTIONING;
            _local_1 = false;
            _local_1 = true;
            _local_1 = QxWishesPanel;
            _local_1 = ViewManager.PANEL_SHOW_LOVE;
            _local_1 = false;
            _local_1 = true;
            _local_1 = VDAYPanel;
            _local_1 = ViewManager.PANEL_VDAY;
            _local_1 = false;
            _local_1 = true;
            _local_1 = FazendaPanel;
            _local_1 = ViewManager.PANEL_FAZENDA;
            _local_1 = false;
            _local_1 = true;
            _local_1 = PetFightConf;
            _local_1 = ViewManager.PANEL_PETFIGHT_CONF;
            _local_1 = false;
            _local_1 = true;
            _local_1 = PetArenaPanel;
            _local_1 = ViewManager.PANEL_PET_ARENA;
            _local_1 = false;
            _local_1 = true;
            _local_1 = PetArenaRankPanel;
            _local_1 = ViewManager.PANEL_PET_ARENA_RANK;
            _local_1 = false;
            _local_1 = true;
            _local_1 = PetArenaPrevRankPanel;
            _local_1 = ViewManager.PANEL_PET_ARENA_PREV_RANK;
            _local_1 = false;
            _local_1 = true;
            _local_1 = MultiItemPanel;
            _local_1 = ViewManager.PANEL_MULITI_ITEM;
            _local_1 = false;
            _local_1 = true;
            _local_1 = AddictEnterPanel;
            _local_1 = ViewManager.MAIN_ADDICT_INFO;
            _local_1 = false;
            _local_1 = true;
            _local_1 = StarAdditionPanel;
            _local_1 = ViewManager.PANEL_STAR_ADDITION;
            _local_1 = false;
            _local_1 = true;
            _local_1 = StarEffectPanel;
            _local_1 = ViewManager.PANEL_STAR_EFFECT;
            _local_1 = false;
            _local_1 = true;
            _local_1 = StarSpeedUpPanel;
            _local_1 = ViewManager.PANEL_STAR_SPEED_UP;
            _local_1 = false;
            _local_1 = true;
            _local_1 = MailNoticePanel;
            _local_1 = ViewManager.PANEL_MAIL_NOTICE;
            _local_1 = false;
            _local_1 = true;
            _local_1 = WbResult;
            _local_1 = ViewManager.PANEL_WB_RESULT;
            _local_1 = false;
            _local_1 = true;
            _local_1 = WbTimerCanvas;
            _local_1 = ViewManager.PANEL_WB_TIMER;
            _local_1 = false;
            _local_1 = true;
            _local_1 = WelfarePanel;
            _local_1 = ViewManager.PANEL_WELFARE;
            _local_1 = false;
            _local_1 = true;
            _local_1 = TaskSweepPanel;
            _local_1 = ViewManager.PANEL_TASKSWEEP;
            _local_1 = false;
            _local_1 = false;
            _local_1 = NewServerActPanel;
            _local_1 = ViewManager.PANEL_NEWSERVER;
            _local_1 = false;
            _local_1 = true;
            _local_1 = NineBossPanel;
            _local_1 = ViewManager.NINE_BOSS_PANEL;
            _local_1 = false;
            _local_1 = false;
            _local_1 = SendCombineActPanel;
            _local_1 = ViewManager.PANEL_SENDCOMBINE;
            _local_1 = false;
            _local_1 = false;
            _local_1 = PetSoulPanel;
            _local_1 = ViewManager.PANEL_PET_SOUL;
            _local_1 = false;
            _local_1 = true;
            _local_1 = SoulExpPanel;
            _local_1 = ViewManager.PANEL_SOUL_EXP;
            _local_1 = false;
            _local_1 = false;
            _local_1 = CardGamePanel;
            _local_1 = ViewManager.PANEL_CARDGAME;
            _local_1 = false;
            _local_1 = false;
            _local_1 = PmPanel;
            _local_1 = ViewManager.PANEL_PM;
            _local_1 = false;
            _local_1 = false;
            _local_1 = PmInfoPanel;
            _local_1 = ViewManager.PANEL_PM_INFO;
            _local_1 = false;
            _local_1 = false;
            _local_1 = JewelExchagePanel;
            _local_1 = ViewManager.PANEL_JEWEL_EXCHANGE;
            _local_1 = false;
            _local_1 = false;
            _local_1 = VipShopPanel;
            _local_1 = ViewManager.PANEL_VIP_SHOP;
            _local_1 = false;
            _local_1 = false;
            _local_1 = LotteryPanel;
            _local_1 = ViewManager.PANEL_LOTTERY;
            _local_1 = false;
            _local_1 = false;
            _local_1 = DoubleElevenPanel;
            _local_1 = ViewManager.PANEL_DOUBLE_ELEVEN;
            _local_1 = false;
            _local_1 = false;
            _local_1 = LotteryBagPanel;
            _local_1 = ViewManager.PANEL_LOTTERY_BAG;
            _local_1 = false;
            _local_1 = false;
            _local_1 = VipSuccinctPanel;
            _local_1 = ViewManager.PANEL_VIP_SUCCINCT;
            _local_1 = false;
            _local_1 = true;
            _local_1 = SignInPanel;
            _local_1 = ViewManager.PANEL_SIGN_IN;
            _local_1 = false;
            _local_1 = false;
            _local_1 = PVPResultPanel;
            _local_1 = ViewManager.PANEL_PVP_RESULT;
            _local_1 = false;
            _local_1 = false;
            _local_1 = MountPanel;
            _local_1 = ViewManager.PANEL_MOUNT;
            _local_1 = false;
            _local_1 = true;
            _local_1 = ChangeRbResPanel;
            _local_1 = ViewManager.PANEL_CHANGE_RES;
            _local_1 = false;
            _local_1 = true;
            _local_1 = LuckDrawPanel;
            _local_1 = ViewManager.PANEL_LUCK_DRAW;
            _local_1 = false;
            _local_1 = false;
            _local_1 = LuckDrawBagPanel;
            _local_1 = ViewManager.PANEL_LUCK_DRAW_BAG;
            _local_1 = false;
            _local_1 = false;
            _local_1 = MagicArrayPanel;
            _local_1 = ViewManager.PANEL_MAGIC_ARRAY;
            _local_1 = false;
            _local_1 = false;
            _local_1 = MilitaryPanel;
            _local_1 = ViewManager.PANEL_MILITARY;
            _local_1 = false;
            _local_1 = false;
            _local_1 = MazePanel;
            _local_1 = ViewManager.PANEL_MAZE;
            _local_1 = false;
            _local_1 = false;
            _local_1 = MazeQuestionPanel;
            _local_1 = ViewManager.PANEL_MAZE_QUESTION;
            _local_1 = false;
            _local_1 = false;
            _local_1 = MazeShopPanel;
            _local_1 = ViewManager.PANEL_MAZE_SHOP;
            _local_1 = false;
            _local_1 = false;
            _local_1 = MazeLotteryPanel;
            _local_1 = ViewManager.PANEL_MAZE_LOTTERY;
            _local_1 = false;
            _local_1 = false;
            _local_1 = MazeEventInfoPanel;
            _local_1 = ViewManager.PANEL_MAZE_EVENT_INFO;
            _local_1 = false;
            _local_1 = false;
            _local_1 = MazePlayRulePanel;
            _local_1 = ViewManager.PANEL_MAZE_PLAY_RULE;
            _local_1 = false;
            _local_1 = false;
            _local_1 = MazeDiscPanel;
            _local_1 = ViewManager.PANEL_MAZE_DISC;
            _local_1 = false;
            _local_1 = false;
            _local_1 = SmallGamePanel;
            _local_1 = ViewManager.PANEL_Small_Game;
            _local_1 = false;
            _local_1 = true;
            _local_1 = SmallGameHideSeekPanel;
            _local_1 = ViewManager.PANEL_Small_Game_HideSeek;
            _local_1 = false;
            _local_1 = false;
            _local_1 = SmallGameTwoSamePanel;
            _local_1 = ViewManager.PANEL_Small_Game_TwoSame;
            _local_1 = false;
            _local_1 = false;
            _local_1 = SmallGameMagicPowerPanel;
            _local_1 = ViewManager.PANEL_Small_Game_MagicPower;
            _local_1 = false;
            _local_1 = false;
            _local_1 = SmallGameSpeedPanel;
            _local_1 = ViewManager.PANEL_Small_Game_Speed;
            _local_1 = false;
            _local_1 = false;
            _local_1 = MedalPanel;
            _local_1 = ViewManager.PANEL_MEDAL;
            _local_1 = false;
            _local_1 = false;
            _local_1 = AstrologicPanel;
            _local_1 = ViewManager.PANEL_ASTROLOGIC;
            _local_1 = false;
            _local_1 = false;
            _local_1 = PetHandbook;
            _local_1 = ViewManager.PANEL_PET_HANDBOOK;
            _local_1 = false;
            _local_1 = false;
            _local_1 = PetEvolutionPanel;
            _local_1 = ViewManager.PANEL_PET_EVOLUTION;
            _local_1 = false;
            _local_1 = false;
            _local_1 = FindBackPanel;
            _local_1 = ViewManager.PANEL_FINDBACK;
            _local_1 = false;
            _local_1 = false;
            _local_1 = CrossFightPanel;
            _local_1 = ViewManager.PANEL_CROSS_FIGHT;
            _local_1 = false;
            _local_1 = false;
            _local_1 = CrossFightTeamInfo;
            _local_1 = ViewManager.PANEL_CROSS_FIGHT_TEAM;
            _local_1 = false;
            _local_1 = false;
            _local_1 = FairySkillConfigCanvas;
            _local_1 = ViewManager.PANEL_FAIRY_SKILL_CONFIG;
            _local_1 = false;
            _local_1 = false;
            _local_1 = BattleInfoCanvas;
            _local_1 = ViewManager.PANEL_BATTLE_INFO;
            _local_1 = false;
            _local_1 = false;
            _local_1 = CrossTeamFightPanel;
            _local_1 = ViewManager.PANEL_CROSS_TEAM_FIGHT;
            _local_1 = false;
            _local_1 = false;
            _local_1 = CrossTeamFightBetPanel;
            _local_1 = ViewManager.PANEL_CROSS_TEAM_FIGHT_BET;
            _local_1 = false;
            _local_1 = false;
            _local_1 = CrossContentionTotalPanel;
            _local_1 = ViewManager.PANEL_CROSS_CONTENTION_TOTAL;
            _local_1 = false;
            _local_1 = false;
            _local_1 = CrossContentionSinglePanel;
            _local_1 = ViewManager.PANEL_CROSS_CONTENTION_SINGLE;
            _local_1 = false;
            _local_1 = false;
            _local_1 = CrossContentionSingleInfoPanel;
            _local_1 = ViewManager.PANEL_CROSS_CONTENTION_SINGLE_INFO;
            _local_1 = false;
            _local_1 = false;
            _local_1 = CrossContentionAreaPanel;
            _local_1 = ViewManager.PANEL_CROSS_CONTENTION_AREA;
            _local_1 = false;
            _local_1 = false;
            _local_1 = CrossContentionBossAreaPanel;
            _local_1 = ViewManager.PANEL_CROSS_CONTENTION_BOSS_AREA;
            _local_1 = false;
            _local_1 = false;
            _local_1 = CrossContentionFightPanel;
            _local_1 = ViewManager.PANEL_CROSS_CONTENTION_FIGHT;
            _local_1 = false;
            _local_1 = false;
            _local_1 = CrossContentionFirstAward;
            _local_1 = ViewManager.PANEL_CROSS_CONTENTION_FIRST_AWARD;
            _local_1 = false;
            _local_1 = false;
            _local_1 = CrossContentionScoreAward;
            _local_1 = ViewManager.PANEL_CROSS_CONTENTION_SCORE_AWARD;
            _local_1 = false;
            _local_1 = false;
            _local_1 = CrossContentionTimeAward;
            _local_1 = ViewManager.PANEL_CROSS_CONTENTION_TIME_AWARD;
            _local_1 = false;
            _local_1 = false;
            _local_1 = CrossContentionBattleInfo;
            _local_1 = ViewManager.PANEL_CROSS_CONTENTION_BATTLE_INFO;
            _local_1 = false;
            _local_1 = false;
            _local_1 = CrossContentionRank;
            _local_1 = ViewManager.PANEL_CROSS_CONTENTION_RANK;
            _local_1 = false;
            _local_1 = false;
            _local_1 = PetTalentPanel;
            _local_1 = ViewManager.PANEL_PET_TALENT;
            _local_1 = false;
            _local_1 = true;
            _local_1 = PetTalentFuncPanel;
            _local_1 = ViewManager.PANEL_PET_TALENT_FUNC;
            _local_1 = false;
            _local_1 = true;
            _local_1 = TreasurePanel;
            _local_1 = ViewManager.PANEL_TREASURE_BOWL;
            _local_1 = false;
            _local_1 = true;
            _local_1 = ExtractCardActivity;
            _local_1 = ViewManager.PANEL_EXTRACT_CARD_ACTIVITY;
            _local_1 = false;
            _local_1 = true;
            _local_1 = StoneSealPanel;
            _local_1 = ViewManager.PANEL_STONE_SEAL;
            _local_1 = false;
            _local_1 = true;
            _local_1 = StoneSealBoreCanvas;
            _local_1 = ViewManager.PANEL_STONE_SEAL_BORE;
            _local_1 = false;
            _local_1 = true;
            _local_1 = StarExchange;
            _local_1 = ViewManager.PANEL_STAR_EXCHANGE;
            _local_1 = false;
            _local_1 = false;
            _local_1 = FlopPassPanel;
            _local_1 = ViewManager.PANEL_FLOP_PASS;
            _local_1 = false;
            _local_1 = true;
            _local_1 = HulaPanel;
            _local_1 = ViewManager.PANEL_HULA;
            _local_1 = false;
            _local_1 = true;
            _local_1 = ReturnRewardPanel;
            _local_1 = ViewManager.PANEL_RETURN_REWARD;
            _local_1 = false;
            _local_1 = true;
            _local_1 = TrialsPassMainPanel;
            _local_1 = ViewManager.PANEL_TRIALS;
            _local_1 = false;
            _local_1 = true;
            _local_1 = TrialsPassAwardPanel;
            _local_1 = ViewManager.PANEL_TRIALS_AWARD;
            _local_1 = false;
            _local_1 = true;
            _local_1 = DotaPanel;
            _local_1 = ViewManager.PANEL_DOTA;
            _local_1 = false;
            _local_1 = true;
            _local_1 = GrouponPanel;
            _local_1 = ViewManager.PANEL_GROUPON;
            _local_1 = false;
            _local_1 = true;
            _local_1 = SummerGames;
            _local_1 = ViewManager.PANEL_SUMMER_GAME;
            _local_1 = false;
            _local_1 = true;
            _local_1 = Wasteland;
            _local_1 = ViewManager.PANEL_SUMMER_GAME_WASTELAND;
            _local_1 = false;
            _local_1 = true;
            _local_1 = ThreeDiabetes;
            _local_1 = ViewManager.PANEL_SUMMER_GAME_DIABETES;
            _local_1 = false;
            _local_1 = true;
            _local_1 = HorseRace;
            _local_1 = ViewManager.PANEL_SUMMER_GAME_HORSE_RACE;
            _local_1 = false;
            _local_1 = true;
            _local_1 = WorldCupPanel;
            _local_1 = ViewManager.PANEL_WORLD_CUP;
            _local_1 = false;
            _local_1 = true;
            _local_1 = WorldCupVSPanel;
            _local_1 = ViewManager.PANEL_WORLD_CUP_VS;
            _local_1 = false;
            _local_1 = true;
            _local_1 = DressPanel;
            _local_1 = ViewManager.PANEL_DRESS;
            _local_1 = false;
            _local_1 = true;
            _local_1 = DecoratePanel;
            _local_1 = ViewManager.PANEL_DECORATE;
            _local_1 = false;
            _local_1 = true;
            _local_1 = AutoTaskPanel;
            _local_1 = ViewManager.PANEL_AUTOTASK;
            _local_1 = false;
            _local_1 = false;
            _local_1 = RecipeExchangePanel;
            _local_1 = ViewManager.PANEL_RECIPE_EXCHANGE;
            _local_1 = false;
            _local_1 = true;
            _local_1 = WorldCupChangePanel;
            _local_1 = ViewManager.PANEL_WORLD_CUP_CHANGE;
            _local_1 = false;
            _local_1 = true;
            _local_1 = NpcShopPanel;
            _local_1 = ViewManager.PANEL_NPC_SHOP;
            _local_1 = false;
            _local_1 = false;
            _local_1 = BossDailyPanel;
            _local_1 = ViewManager.PANEL_BOSS_DAILY;
            _local_1 = false;
            _local_1 = true;
            _local_1 = AwakenPanel;
            _local_1 = ViewManager.PANEL_AWAKEN;
            _local_1 = false;
            _local_1 = true;
            _local_1 = WaWaGamePanel;
            _local_1 = ViewManager.PANEL_WAWA_GAME;
            _local_1 = false;
            _local_1 = true;
            _local_1 = WaWaChangePanel;
            _local_1 = ViewManager.PANEL_WAWA_CHANGE;
            _local_1 = false;
            _local_1 = true;
            _local_1 = ChargeNoticePanel;
            _local_1 = ViewManager.PANEL_CHARGE_NOTICE;
            _local_1 = false;
            _local_1 = true;
            _local_1 = MysteryFurnace;
            _local_1 = ViewManager.PANEL_MYSTERY_FURNACE;
            _local_1 = false;
            _local_1 = true;
            _local_1 = TrainSoulPanel;
            _local_1 = ViewManager.PANEL_TRAIN_SOUL;
            _local_1 = false;
            _local_1 = true;
            _local_1 = JuHuaSuanAlertPanel;
            _local_1 = ViewManager.PANEL_JUHUASUAN_ALERT;
            _local_1 = false;
            _local_1 = true;
            _local_1 = JuHuaSuanPanel;
            _local_1 = ViewManager.PANEL_JUHUASUAN;
            _local_1 = false;
            _local_1 = true;
            _local_1 = ManJiuJianPanel;
            _local_1 = ViewManager.PANEL_MANJIUJIAN;
            _local_1 = false;
            _local_1 = true;
            _local_1 = RebateEverydayPanel;
            _local_1 = ViewManager.PANEL_REBATEEVERYDAY;
            _local_1 = false;
            _local_1 = true;
            _local_1 = RebateEverydayAlertPanel;
            _local_1 = ViewManager.PANEL_REBATEEVERYDAY_ALERT;
            _local_1 = false;
            _local_1 = true;
            _local_1 = TripleTownPanel;
            _local_1 = ViewManager.PANEL_TRIPLE_TOWN;
            _local_1 = false;
            _local_1 = true;
            _local_1 = MonthWelfarePanel;
            _local_1 = ViewManager.PANEL_MONTHWELFARE;
            _local_1 = false;
            _local_1 = true;
            _local_1 = MonthWelfareAlertPanel;
            _local_1 = ViewManager.PANEL_MONTHWELFARE_ALERT;
            _local_1 = false;
            _local_1 = true;
            _local_1 = MonthWelfareBagPanel;
            _local_1 = ViewManager.PANEL_MONTHWELFARE_BAG;
            _local_1 = false;
            _local_1 = true;
            _local_1 = HeiYaoShiPanel;
            _local_1 = ViewManager.PANEL_HEIYAOSHI;
            _local_1 = false;
            _local_1 = true;
            _local_1 = HeiyaoshiAlertPanel;
            _local_1 = ViewManager.PANEL_HEIYAOSHI_ALERT;
            _local_1 = false;
            _local_1 = true;
            _local_1 = PRSPanel;
            _local_1 = ViewManager.PANEL_PET_REAl_SOUL;
            _local_1 = false;
            _local_1 = true;
            _local_1 = SecretTreasureHuntPanel;
            _local_1 = ViewManager.PANEL_SECRET_TREASUREHUNT;
            _local_1 = false;
            _local_1 = true;
            _local_1 = SecretTreasureHuntAlertPanel;
            _local_1 = ViewManager.PANEL_SECRET_TREASUREHUNT_ALERT;
            _local_1 = false;
            _local_1 = true;
            _local_1 = SecretTreasureHuntAlertOne;
            _local_1 = ViewManager.PANEL_SECRET_TREASUREHUNT_ONE;
            _local_1 = false;
            _local_1 = true;
            _local_1 = SecretTreasureHuntEnd;
            _local_1 = ViewManager.PANEL_SECRET_TREASUREHUNT_END;
            _local_1 = false;
            _local_1 = true;
            _local_1 = SecretTreasureHuntAutoPlay;
            _local_1 = ViewManager.PANEL_SECRET_TREASUREHUNT_AUTO;
            _local_1 = false;
            _local_1 = true;
            _local_1 = WarSpritePanel;
            _local_1 = ViewManager.PANEL_WAR_BATTLE;
            _local_1 = false;
            _local_1 = true;
            _local_1 = HappyFrontLinePanel;
            _local_1 = ViewManager.PANEL_HAPPYFRONTLINE;
            _local_1 = false;
            _local_1 = true;
            _local_1 = AnniversaryPanel;
            _local_1 = ViewManager.PANEL_ANNIVERSARY;
            _local_1 = false;
            _local_1 = true;
            _local_1 = FarmMaster;
            _local_1 = ViewManager.PANEL_FARMMASTER;
            _local_1 = false;
            _local_1 = true;
            _local_1 = StoneMaster;
            _local_1 = ViewManager.PANEL_STONEMASTER;
            _local_1 = false;
            _local_1 = true;
            _local_1 = CubeMaster;
            _local_1 = ViewManager.PANEL_CUBEMASTER;
            _local_1 = false;
            _local_1 = true;
            _local_1 = MonsterHeartPanel;
            _local_1 = ViewManager.PANEL_MONSTERHEART;
            _local_1 = false;
            _local_1 = true;
            _local_1 = PetGuardPanel;
            _local_1 = ViewManager.PANEL_PETGUARD;
            _local_1 = false;
            _local_1 = true;
            _local_1 = PetGuardInSidePanel;
            _local_1 = ViewManager.PANEL_PETGUARDINSIDE;
            _local_1 = false;
            _local_1 = true;
            _local_1 = DailySignInPanel;
            _local_1 = ViewManager.PANEL_DAILYSIGNINACT;
            _local_1 = false;
            _local_1 = true;
            _local_1 = MagicCrystalPanel;
            _local_1 = ViewManager.PANEL_MAGICCRYSTAL;
            _local_1 = false;
            _local_1 = true;
            _local_1 = StoneToGoldActPanel;
            _local_1 = ViewManager.PANEL_STONETOGOLDACT;
            _local_1 = false;
            _local_1 = true;
            _local_1 = QiLingPanel;
            _local_1 = ViewManager.PANEL_QILING;
            _local_1 = false;
            _local_1 = true;
            _local_1 = MoJinActPanel;
            _local_1 = ViewManager.PANEL_MOJINACT;
            _local_1 = false;
            _local_1 = true;
            _local_1 = PetStonePanel;
            _local_1 = ViewManager.PANEL_PET_STONE;
            _local_1 = false;
            _local_1 = true;
            _local_1 = AddOpePanel;
            _local_1 = ViewManager.PANEL_ADD_OPE;
            _local_1 = false;
            _local_1 = true;
            _local_1 = ExplorerMedalPanel;
            _local_1 = ViewManager.PANEL_EXPLORER_MEDAL;
            _local_1 = false;
            _local_1 = true;
            _local_1 = Sudoku;
            _local_1 = ViewManager.PANEL_SUDOKU;
            _local_1 = false;
            _local_1 = true;
            _local_1 = DuiduiPeng;
            _local_1 = ViewManager.PANEL_DUIDUIPENG;
            _local_1 = false;
            _local_1 = true;
            _local_1 = ShowTimePnael;
            _local_1 = ViewManager.PANEL_SHOWTIME;
            _local_1 = false;
            _local_1 = true;
            _local_1 = AnniversaryTurntable;
            _local_1 = ViewManager.PANEL_ANNI_ZHUANPAN;
            _local_1 = false;
            _local_1 = true;
            _local_1 = PetPVESystem;
            _local_1 = ViewManager.PANEL_PET_PVE;
            _local_1 = false;
            _local_1 = true;
            _local_1 = PetPVEConfigPanel;
            _local_1 = ViewManager.PANEL_PET_PVE_CONFIG;
            _local_1 = false;
            _local_1 = true;
            _local_1 = PetArenaActivityPanel;
            _local_1 = ViewManager.PANEL_PET_ARENA_ACTIVITY;
            _local_1 = false;
            _local_1 = true;
            _local_1 = PetArenaActivityRankPanel;
            _local_1 = ViewManager.PANEL_PET_ARENA_ACTIVITY_RANK;
            _local_1 = false;
            _local_1 = true;
            _local_1 = PetFightConfActivity;
            _local_1 = ViewManager.PANEL_PETFIGHT_CONF_ACTIVITY;
            _local_1 = false;
            _local_1 = true;
            _local_1 = PetArenaPrevRankActivityPanel;
            _local_1 = ViewManager.PANEL_PET_ARENA_PREV_ACTIVITY_RANK;
            _local_1 = false;
            _local_1 = true;
            _local_1 = PKGamePanel;
            _local_1 = ViewManager.PANEL_PK_GAME;
            _local_1 = false;
            _local_1 = true;
            _local_1 = ConsumeNoticePanel;
            _local_1 = ViewManager.PANEL_CONSUME_NOTICE_ACTIVITY;
            _local_1 = false;
            _local_1 = true;
            _local_1 = XiaochudasaiPanel;
            _local_1 = ViewManager.PANEL_XIAOCHUSDASAI_ACTIVITY;
            _local_1 = false;
            _local_1 = true;
            _local_1 = PrePurchasePanel;
            _local_1 = ViewManager.PANEL_PREPURCHASE_ACTIVITY;
            _local_1 = false;
            _local_1 = false;
            _local_1 = texunkecheng;
            _local_1 = ViewManager.PANEL_TEXUNKECHENG_ACTIVITY;
            _local_1 = false;
            _local_1 = false;
            _local_1 = TXKCEXPPanel;
            _local_1 = ViewManager.PANEL_TEXUNKECHENG_EXP_PANEL;
            _local_1 = false;
            _local_1 = true;
            _local_1 = XiulianshiPanel;
            _local_1 = ViewManager.PANEL_XIULIAN_PANEL;
            _local_1 = false;
            _local_1 = true;
            _local_1 = Moyintuce;
            _local_1 = ViewManager.PANEL_MOYINTUCE_PANEL;
            _local_1 = false;
            _local_1 = true;
            _local_1 = RedEnvelopePanel;
            _local_1 = ViewManager.PANEL_REDENVELOPE_PANEL;
            _local_1 = false;
            _local_1 = false;
            _local_1 = MCZD;
            _local_1 = ViewManager.PANEL_MCZD;
            _local_1 = false;
            _local_1 = false;
            _local_1 = MCZDPetFightConf;
            _local_1 = ViewManager.PANEL_MCZD_PETFIGHT_CONF;
            _local_1 = false;
            _local_1 = true;
            _local_1 = MCZDTotalRankPanel;
            _local_1 = ViewManager.PANEL_MCZD_ALL_RANK;
            _local_1 = false;
            _local_1 = true;
            _local_1 = JXHD;
            _local_1 = ViewManager.PANEL_JXHD;
            _local_1 = false;
            _local_1 = true;
            _local_1 = MQDTPanel;
            _local_1 = ViewManager.PANEL_MQDT;
            _local_1 = false;
            _local_1 = true;
            _local_1 = TKYYHInfoPanel;
            _local_1 = ViewManager.PANEL_TKYYHInfo;
            _local_1 = false;
            _local_1 = true;
            _local_1 = AnniversarySignInPanel;
            _local_1 = ViewManager.PANEL_ANNIVERSARYSIGNIN;
            _local_1 = false;
            _local_1 = true;
        }

        private function _PanelLayer_UIPropVO230_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO230 = _local_1;
            _local_1.name = "消费预告";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO230", _PanelLayer_UIPropVO230);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO132_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO132 = _local_1;
            _local_1.name = "怪物图鉴面板";
            _local_1.prop = {
                "dx":125,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO132", _PanelLayer_UIPropVO132);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO221_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO221 = _local_1;
            _local_1.name = "魔力之星";
            _local_1.prop = {
                "dx":50,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO221", _PanelLayer_UIPropVO221);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO212_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO212 = _local_1;
            _local_1.name = "幻能水晶";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO212", _PanelLayer_UIPropVO212);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO28_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO28 = _local_1;
            _local_1.name = "技能学习面板";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO28", _PanelLayer_UIPropVO28);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO81_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO81 = _local_1;
            _local_1.name = "庄园面板";
            _local_1.prop = {
                "dx":60,
                "dy":20
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO81", _PanelLayer_UIPropVO81);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO120_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO120 = _local_1;
            _local_1.name = "迷阵商城面板";
            _local_1.prop = {
                "dx":100,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO120", _PanelLayer_UIPropVO120);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO143_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO143 = _local_1;
            _local_1.name = "魔力远征单区介绍面板";
            _local_1.prop = {
                "dx":300,
                "dy":200
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO143", _PanelLayer_UIPropVO143);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO166_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO166 = _local_1;
            _local_1.name = "暑期小游戏面板";
            _local_1.prop = {
                "dx":100,
                "dy":30
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO166", _PanelLayer_UIPropVO166);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO189_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO189 = _local_1;
            _local_1.name = "天天返利弹窗";
            _local_1.prop = {
                "dx":307,
                "dy":178
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO189", _PanelLayer_UIPropVO189);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO238_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO238 = _local_1;
            _local_1.name = "萌宠智斗";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO238", _PanelLayer_UIPropVO238);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO4_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO4 = _local_1;
            _local_1.name = "仓库面板";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO4", _PanelLayer_UIPropVO4);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO241_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO241 = _local_1;
            _local_1.name = "惊喜活动";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO241", _PanelLayer_UIPropVO241);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO92_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO92 = _local_1;
            _local_1.name = "世界BOSS活动结算面板";
            _local_1.prop = {
                "dx":200,
                "dy":150
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO92", _PanelLayer_UIPropVO92);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO39_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO39 = _local_1;
            _local_1.name = "充值面板";
            _local_1.prop = {
                "dx":307,
                "dy":178
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO39", _PanelLayer_UIPropVO39);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO154_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO154 = _local_1;
            _local_1.name = "聚宝盆面板";
            _local_1.prop = {
                "dx":133,
                "dy":64
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO154", _PanelLayer_UIPropVO154);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO177_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO177 = _local_1;
            _local_1.name = "结晶商店";
            _local_1.prop = {
                "dx":200,
                "dy":100
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO177", _PanelLayer_UIPropVO177);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO16_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO16 = _local_1;
            _local_1.name = "NPC功能";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO16", _PanelLayer_UIPropVO16);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO131_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO131 = _local_1;
            _local_1.name = "占星台面板";
            _local_1.prop = {
                "dx":125,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO131", _PanelLayer_UIPropVO131);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO80_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO80 = _local_1;
            _local_1.name = "情人节活动告白面板";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO80", _PanelLayer_UIPropVO80);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO222_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO222 = _local_1;
            _local_1.name = "周年庆转盘";
            _local_1.prop = {
                "dx":50,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO222", _PanelLayer_UIPropVO222);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO27_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO27 = _local_1;
            _local_1.name = "高级融合";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO27", _PanelLayer_UIPropVO27);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO240_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO240 = _local_1;
            _local_1.name = "萌宠活动排行榜";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO240", _PanelLayer_UIPropVO240);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO165_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO165 = _local_1;
            _local_1.name = "团购返利面板";
            _local_1.prop = {
                "dx":55,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO165", _PanelLayer_UIPropVO165);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO188_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO188 = _local_1;
            _local_1.name = "天天返利";
            _local_1.prop = {
                "dx":100,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO188", _PanelLayer_UIPropVO188);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO3_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO3 = _local_1;
            _local_1.name = "礼包奖励面板";
            _local_1.prop = {
                "dx":200,
                "dy":80
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO3", _PanelLayer_UIPropVO3);
            return (_local_1);
        }

        private function _PanelLayer_UIPropVO142_i():UIPropVO
        {
            var _local_1:UIPropVO = new UIPropVO();
            _PanelLayer_UIPropVO142 = _local_1;
            _local_1.name = "魔力远征单区面板";
            _local_1.prop = {
                "dx":50,
                "dy":50
            };
            BindingManager.executeBindings(this, "_PanelLayer_UIPropVO142", _PanelLayer_UIPropVO142);
            return (_local_1);
        }


    }
}//package com.qeedoo.ui.view

