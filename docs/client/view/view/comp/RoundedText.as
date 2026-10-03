// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.RoundedText

package com.qeedoo.ui.view.comp
{
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.text.TextFieldType;
    import com.qeedoo.game.predef.GamePredef;
    import flash.text.TextFieldAutoSize;

    public class RoundedText extends TextField 
    {

        public function RoundedText()
        {
            var _local_1:TextFormat = new TextFormat("Arial", 12);
            setTextFormat(_local_1);
            textColor = 0xFFFFFF;
            selectable = false;
            type = TextFieldType.DYNAMIC;
            background = false;
            width = 100;
            height = 20;
            filters = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            autoSize = TextFieldAutoSize.CENTER;
        }

    }
}//package com.qeedoo.ui.view.comp

