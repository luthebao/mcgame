// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.RendererTreeNode

package com.qeedoo.ui.view.comp
{
    import mx.controls.treeClasses.TreeItemRenderer;
    import mx.controls.treeClasses.TreeListData;
    import mx.collections.*;
    import mx.controls.treeClasses.*;

    public class RendererTreeNode extends TreeItemRenderer 
    {


        override public function set data(_arg_1:Object):void
        {
            super.data = _arg_1;
            if (_arg_1 == null)
            {
                return;
            };
            if (TreeListData(super.listData).hasChildren)
            {
                setStyle("color", 0xFFFFFF);
            }
            else
            {
                setStyle("color", _arg_1.color);
            };
        }


    }
}//package com.qeedoo.ui.view.comp

