// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.StarIcon

package com.qeedoo.ui.view.comp
{
    import mx.controls.Image;
    import mx.effects.Glow;
    import com.qeedoo.game.system.Core;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import mx.events.FlexEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.game.config.Language;
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

    public class StarIcon extends Image 
    {

        private var _207684226glowEffect:Glow;
        public var starData:Object;
        private var _stype:int;
        private var _showTip:Boolean;

        private var iconN:Class = StarIcon_iconN;
        private var iconC:Class = StarIcon_iconC;
        private var iconL:Class = StarIcon_iconL;
        private var _core:Core = Core.getInstance();

        public function StarIcon()
        {
            this.width = 20;
            this.height = 20;
            _StarIcon_Glow1_i();
            this.addEventListener("rollOver", ___StarIcon_Image1_rollOver);
            this.addEventListener("rollOut", ___StarIcon_Image1_rollOut);
            this.addEventListener("creationComplete", ___StarIcon_Image1_creationComplete);
        }

        private function _StarIcon_Glow1_i():Glow
        {
            var _local_1:Glow = new Glow();
            glowEffect = _local_1;
            _local_1.duration = 1000;
            _local_1.repeatCount = 100;
            _local_1.alphaFrom = 1;
            _local_1.alphaTo = 1;
            _local_1.blurXFrom = 0;
            _local_1.blurXTo = 10;
            _local_1.blurYFrom = 0;
            _local_1.blurYTo = 10;
            _local_1.color = 0xFFEA00;
            return (_local_1);
        }

        public function setSourceC():void
        {
            source = iconC;
        }

        public function set glowEffect(_arg_1:Glow):void
        {
            var _local_2:Object = this._207684226glowEffect;
            if (_local_2 !== _arg_1)
            {
                this._207684226glowEffect = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "glowEffect", _local_2, _arg_1));
            };
        }

        public function ___StarIcon_Image1_rollOver(_arg_1:MouseEvent):void
        {
            showTip();
        }

        [Bindable(event="propertyChange")]
        public function get glowEffect():Glow
        {
            return (this._207684226glowEffect);
        }

        public function setSourceL():void
        {
            source = iconL;
        }

        public function init():void
        {
            source = iconN;
        }

        public function setSourceN():void
        {
            source = iconN;
        }

        public function ___StarIcon_Image1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function set stype(_arg_1:int):void
        {
            _stype = _arg_1;
        }

        public function showTip():void
        {
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            var _local_8:int;
            var _local_9:int;
            var _local_10:String;
            filters = [GamePredef.FILTER_ALLOW_SELECTED];
            var _local_1:TipStarReq = TipStarReq(_core.view.getUI(ViewManager.TOOLTIP_REQSTAR));
            var _local_2:Object = GameData.d[GamePredef.TBL_STARS_TEMPLATE][starData.currentId];
            var _local_3:Object = GameData.d[GamePredef.TBL_STARS_TEMPLATE][starData.nextId];
            var _local_4:Object = new Object();
            _local_4.type = _stype;
            if (_local_3)
            {
                _local_4.name = _local_3.name;
                _local_4.reqStarLevel = _local_3.reqStarLevel;
                _local_4.reqMoney = _local_3.reqMoney;
                _local_4.reqLevel = _local_3.reqLevel;
                _local_4.addValue2 = _local_3.addValue;
                _local_5 = _local_3.reqSeconds;
                _local_6 = int((_local_5 / (3600 * 24)));
                _local_7 = int(((_local_5 % (3600 * 24)) / 3600));
                _local_8 = int(((_local_5 % 3600) / 60));
                _local_9 = ((_local_5 % 3600) % 60);
                _local_10 = Language.CHARACTORPANEL_S[67].toString().replace("{d}", _local_6).replace("{h}", _local_7).replace("{m}", _local_8).replace("{s}", _local_9);
                _local_4.reqTime = _local_10;
            }
            else
            {
                ((_local_2) && (_local_4.name = _local_2.name));
                _local_4.reqStarLevel = "--";
                _local_4.reqMoney = "--";
                _local_4.reqLevel = "--";
                _local_4.addValue2 = "--";
                _local_4.reqTime = "--";
            };
            if (_local_2)
            {
                _local_4.addValue1 = _local_2.addValue;
                _local_4.level = _local_2.level;
            }
            else
            {
                _local_4.addValue1 = 0;
                _local_4.level = 0;
            };
            if (parseInt(_local_4.addValue1) == _local_4.addValue1)
            {
                _local_4.addValue1 = parseInt(_local_4.addValue1);
            };
            if (parseInt(_local_4.addValue2) == _local_4.addValue2)
            {
                _local_4.addValue2 = parseInt(_local_4.addValue2);
            };
            if (_local_1)
            {
                _local_1.object = _local_4;
                _local_1.show();
            };
        }

        override public function initialize():void
        {
            super.initialize();
        }

        public function setData(_arg_1:Object):void
        {
            starData = _arg_1;
            if (_arg_1.finishDate > 0)
            {
            };
        }

        public function checkLvUpCond(_arg_1:int):void
        {
            var _local_2:Object = GameData.d[GamePredef.TBL_STARS_TEMPLATE][starData.nextId];
            var _local_3:Object = GameData.d[GamePredef.TBL_STARS_TEMPLATE][starData.currentId];
            if (_local_2)
            {
                if ((((_arg_1 >= _local_2.reqStarLevel) && (_core.player.level >= _local_2.reqLevel)) && ((_core.player.money >= _local_2.reqMoney) || (_core.player.moneyBind >= _local_2.reqMoney))))
                {
                    if (!glowEffect.isPlaying)
                    {
                        glowEffect.play([this]);
                    };
                }
                else
                {
                    stopEffect();
                };
            };
        }

        public function stopEffect():void
        {
            if (glowEffect.isPlaying)
            {
                glowEffect.stop();
                this.filters = null;
            };
        }

        public function showStar():void
        {
            setSourceC();
        }

        public function hideTip():void
        {
            filters = [];
            var _local_1:TipStarReq = TipStarReq(_core.view.getUI(ViewManager.TOOLTIP_REQSTAR));
            ((_local_1) && (_local_1.hide()));
        }

        public function ___StarIcon_Image1_rollOut(_arg_1:MouseEvent):void
        {
            hideTip();
        }


    }
}//package com.qeedoo.ui.view.comp

