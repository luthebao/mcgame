// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.BasicToolTip

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.core.IToolTip;
    import com.qeedoo.game.config.Language;

    public class BasicToolTip extends Canvas implements IToolTip 
    {

        public static const TYPE_TEMP:uint = 0;
        public static const TYPE_INST:uint = 1;
        protected static const FONT_COLOR_PRE_PROP:String = "<font color='#00FFFF'>";
        protected static const FONT_COLOR_SUF_PROP:String = "</font>";
        protected static const FONT_COLOR_RED_PROP:String = "<font color='#FF0000'>";
        protected static const FONT_COLOR_PRE_UNACTIVE:String = "<font color='#777777'>";
        protected static const FONT_COLOR_SUF_UNACTIVE:String = "</font>";
        protected static const PRE_BIND_PROP:String = (("<font color='#FF11CC'>" + Language.BASICTOOLTIP_S[0]) + "</font>");
        protected static const PRE_JEWEL_PROP:String = (("<font color='#22FFAA'>" + Language.BASICTOOLTIP_S[1]) + "</font>");
        protected static const PRE_SOUL_PROP:String = (("<font color='#11CCFF'>" + Language.BASICTOOLTIP_S[2]) + "</font>");
        protected static const PRE_BINDED_PROP:String = Language.BASICTOOLTIP_S[3];
        protected static const UNACTIVE_PROP:String = ((FONT_COLOR_PRE_UNACTIVE + Language.BASICTOOLTIP_S[4]) + FONT_COLOR_SUF_UNACTIVE);
        protected static const PRE_SUIT_PROP:String = (("<font color='#11CCFF'>" + Language.BASICTOOLTIP_S[5]) + "</font>");
        protected static const SUF_SUIT_PROP:String = (("<font color='#11CCFF'>" + Language.BASICTOOLTIP_S[6]) + "</font>\n");
        protected static const PRE_INACTIVE_PROP:String = "<font color='#C8C8C8'>{str}</font>";
        protected static const COLOR_YELLOW:String = "<font color='#FFFF00'>{str}</font>";
        protected static const COLOR_GREEN:String = "<font color='#00FF00'>{str}</font>";
        protected static const COLOR_ANY:String = "<font color='{colorStr}'>{str}</font>";
        protected static const PRE_FEATHER_PROP_CHAR:String = (("<font color='#22FFAA'>" + Language.BASICTOOLTIP_S[7]) + "</font>");
        protected static const PRE_FEATHER_PROP_PET:String = (("<font color='#22FFAA'>" + Language.BASICTOOLTIP_S[8]) + "</font>");


        protected function setPos():void
        {
            x = (stage.mouseX + 30);
            y = (stage.mouseY + 10);
            parent.setChildIndex(this, (parent.numChildren - 1));
            if ((y + height) > stage.stageHeight)
            {
                y = (stage.stageHeight - height);
            };
            if ((x + width) > stage.stageWidth)
            {
                x = ((x - width) - 40);
            };
        }

        public function get text():String
        {
            return (null);
        }

        public function hide():void
        {
            visible = false;
        }

        public function set text(_arg_1:String):void
        {
        }

        public function show(_arg_1:Object=null):void
        {
            var _local_3:Object;
            var _local_2:Array = Canvas(parent).getChildren();
            for each (_local_3 in _local_2)
            {
                if (((!(_local_3 is TipQuest)) && (!(_local_3 is TipMap))))
                {
                    _local_3.visible = false;
                };
            };
            setPos();
            visible = true;
        }


    }
}//package com.qeedoo.ui.view.comp

