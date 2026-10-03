// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.CustomMenuItemRenderer

package com.qeedoo.ui.view.comp
{
    import mx.controls.menuClasses.MenuItemRenderer;
    import mx.controls.menuClasses.IMenuItemRenderer;

    public class CustomMenuItemRenderer extends MenuItemRenderer implements IMenuItemRenderer 
    {


        override protected function commitProperties():void
        {
            super.commitProperties();
            setStyle("color", data.textColor);
        }


    }
}//package com.qeedoo.ui.view.comp

