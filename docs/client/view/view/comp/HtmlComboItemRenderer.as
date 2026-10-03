// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.HtmlComboItemRenderer

package com.qeedoo.ui.view.comp
{
    import mx.controls.listClasses.ListItemRenderer;
    import com.qeedoo.game.predef.GamePredef;
    import mx.core.IUITextField;

    public class HtmlComboItemRenderer extends ListItemRenderer 
    {


        override protected function commitProperties():void
        {
            super.commitProperties();
            var _local_1:String = ((data.element > 0) ? GamePredef.ELEMENT_COLOR[data.element] : "#FFFFFF");
            var _local_2:* = (((("<font color='" + _local_1) + "'>") + data.label) + "</font>");
            label.htmlText = _local_2;
        }

        override protected function createInFontContext(_arg_1:Class):Object
        {
            var _local_2:Object = super.createInFontContext(_arg_1);
            var _local_3:IUITextField = IUITextField(_local_2);
            _local_3.filters = [GamePredef.FILTER_GLOW_LOWBLACK];
            return (_local_3);
        }


    }
}//package com.qeedoo.ui.view.comp

