// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.ColorTree

package com.qeedoo.ui.view.comp
{
    import mx.controls.Tree;
    import mx.core.ClassFactory;

    public class ColorTree extends Tree 
    {

        public function ColorTree()
        {
            itemRenderer = new ClassFactory(RendererTreeNode);
        }

    }
}//package com.qeedoo.ui.view.comp

